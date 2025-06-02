#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Однофайловое приложение «Заявки партнёров»
соответствует требованиям модулей 1-4 (Python + tkinter + MySQL Connector).
Запуск:  `python partner_orders_app.py`

Функциональность:
    • Автоматически создаёт БД, таблицы и тестовые данные, если их ещё нет.
    • GUI на tkinter: список заявок, добавление новой, просмотр деталей.
    • Функция calc_material_qty() реализует расчёт материалов (модуль 4).
    • Всё, что нужно – MySQL сервер, python-библиотека mysql-connector-python и этот файл.

Протестировано на Python 3.10+ под Windows и Linux (VS Code, PyCharm Community).
"""

# ============================
# Импорты
# ============================
import tkinter as tk
from tkinter import ttk, messagebox
import mysql.connector
from mysql.connector import Error
from math import ceil
from decimal import Decimal
from datetime import datetime

# ============================
# Конфигурация подключения к MySQL
# (поменяйте при необходимости)
# ============================
DB_SETTINGS = {
    "host": "localhost",
    "user": "root",
    "password": "root",
    "database": "partner_orders"
}

# ============================
# Полный SQL-скрипт схемы и демоданных
# ============================
SCHEMA_SQL = """
CREATE DATABASE IF NOT EXISTS partner_orders CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE partner_orders;

-- Партнёры -----------------------------------------------------------
CREATE TABLE IF NOT EXISTS partners (
    id INT AUTO_INCREMENT PRIMARY KEY,
    partner_type ENUM('Оптовый', 'Розничный', 'Дистрибьютор') NOT NULL,
    name VARCHAR(100) NOT NULL,
    director_name VARCHAR(100) NOT NULL,
    address VARCHAR(255) NOT NULL,
    rating INT UNSIGNED NOT NULL DEFAULT 0,
    phone VARCHAR(20),
    email VARCHAR(100),
    UNIQUE KEY uq_partners_name (name)
);

-- Типы продукции -----------------------------------------------------
CREATE TABLE IF NOT EXISTS product_types (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    coef FLOAT NOT NULL DEFAULT 1.0
);

-- Продукция ----------------------------------------------------------
CREATE TABLE IF NOT EXISTS products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_type_id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    min_price DECIMAL(10,2) NOT NULL,
    param1 FLOAT NOT NULL,
    param2 FLOAT NOT NULL,
    FOREIGN KEY (product_type_id) REFERENCES product_types(id)
);

-- Материалы ----------------------------------------------------------
CREATE TABLE IF NOT EXISTS material_types (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    defect_rate FLOAT NOT NULL DEFAULT 0.0
);

-- Заявки -------------------------------------------------------------
CREATE TABLE IF NOT EXISTS orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    partner_id INT NOT NULL,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    total_cost DECIMAL(12,2) NOT NULL DEFAULT 0.00,
    FOREIGN KEY (partner_id) REFERENCES partners(id)
);

CREATE TABLE IF NOT EXISTS order_items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT UNSIGNED NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products(id)
);

-- Демо-данные --------------------------------------------------------
INSERT IGNORE INTO partners (partner_type,name,director_name,address,rating,phone,email) VALUES
 ('Оптовый','ООО "Партнёр-Снаб"','Иванов И.И.','Москва, ул. Ленина 1',5,'+7-900-000-00-00','info@partner.ru');

INSERT IGNORE INTO product_types (name,coef) VALUES ('Тип A',1.2),('Тип B',1.5);
INSERT IGNORE INTO material_types (name,defect_rate) VALUES ('Сталь',0.05),('Пластик',0.03);

INSERT IGNORE INTO products (product_type_id,name,min_price,param1,param2) VALUES
 (1,'Изделие A-100',150.00,2.0,3.0),
 (2,'Изделие B-200',250.00,1.5,4.0);
"""

# ============================
# Класс-обёртка вокруг MySQL
# Автоматически создаёт базу и запускает скрипт схемы
# ============================
class Database:
    """Работа с MySQL: CRUD партнёров, продукции, заявок."""

    def __init__(self):
        # Сначала подключаемся без имени базы, чтобы её создать при первом запуске
        self.cnx = mysql.connector.connect(**{k: v for k, v in DB_SETTINGS.items() if k != "database"})
        self._ensure_database()
        # После создания — переключаемся на рабочую базу
        self.cnx.database = DB_SETTINGS["database"]
        self.cur = self.cnx.cursor(dictionary=True)

    # ---------- Служебное: создание БД и таблиц ----------
    def _ensure_database(self):
        with self.cnx.cursor() as cur:
            cur.execute(f"CREATE DATABASE IF NOT EXISTS {DB_SETTINGS['database']} CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;")
        self.cnx.commit()
        # Выполняем SCHEMA_SQL по частям (разделитель ;) 
        for stmt in SCHEMA_SQL.split(';'):
            if stmt.strip():
                with self.cnx.cursor() as cur:
                    cur.execute(stmt)
        self.cnx.commit()

    # ---------- Партнёры ----------
    def partners_all(self):
        self.cur.execute("SELECT * FROM partners ORDER BY name;")
        return self.cur.fetchall()

    # ---------- Продукты ----------
    def products_all(self):
        q = "SELECT p.*, pt.coef, pt.name AS product_type_name FROM products p JOIN product_types pt ON p.product_type_id = pt.id ORDER BY p.name;"
        self.cur.execute(q)
        return self.cur.fetchall()

    # ---------- Заявки ----------
    def orders_all(self):
        q = ("SELECT o.id, o.created_at, o.total_cost, partners.name AS partner_name "
             "FROM orders o JOIN partners ON o.partner_id = partners.id "
             "ORDER BY o.created_at DESC;")
        self.cur.execute(q)
        return self.cur.fetchall()

    def order_create(self, partner_id: int, items: list[tuple[int, int]]):
        """Создать заявку. items = [(product_id, qty), ...]"""
        try:
            self.cnx.start_transaction()
            with self.cnx.cursor() as cur:
                cur.execute("INSERT INTO orders(partner_id,total_cost) VALUES (%s,0)", (partner_id,))
                order_id = cur.lastrowid
                total = Decimal('0.00')
                for product_id, qty in items:
                    cur.execute("SELECT min_price FROM products WHERE id=%s", (product_id,))
                    price = cur.fetchone()[0]
                    total += price * qty
                    cur.execute("INSERT INTO order_items(order_id,product_id,quantity,unit_price) VALUES (%s,%s,%s,%s)",
                                (order_id, product_id, qty, price))
                cur.execute("UPDATE orders SET total_cost=%s WHERE id=%s", (total, order_id))
            self.cnx.commit()
            return order_id
        except Error as err:
            self.cnx.rollback()
            raise err

    def order_items(self, order_id: int):
        q = ("SELECT products.name, oi.quantity, oi.unit_price "
             "FROM order_items oi JOIN products ON oi.product_id = products.id "
             "WHERE oi.order_id=%s;")
        self.cur.execute(q, (order_id,))
        return self.cur.fetchall()

    # ---------- Завершение ----------
    def close(self):
        self.cur.close(); self.cnx.close()

# ============================
# Функция расчёта материалов (Модуль 4)
# ============================

def calc_material_qty(product_type_id: int, material_type_id: int, required_qty: int, qty_in_stock: int,
                       param1: float, param2: float) -> int:
    """Возвращает количество материала с учётом брака или -1 при ошибке данных."""
    # Базовая валидация входных чисел
    if any(v < 0 for v in (required_qty, qty_in_stock, param1, param2)):
        return -1

    # Берём коэффициенты из БД
    try:
        cnx = mysql.connector.connect(**DB_SETTINGS)
        cur = cnx.cursor()
        cur.execute("SELECT coef FROM product_types WHERE id=%s", (product_type_id,))
        res = cur.fetchone();
        if not res:
            return -1
        coef = float(res[0])
        cur.execute("SELECT defect_rate FROM material_types WHERE id=%s", (material_type_id,))
        res = cur.fetchone();
        if not res:
            return -1
        defect = float(res[0])
    finally:
        cur.close(); cnx.close()

    demand = max(required_qty - qty_in_stock, 0)
    baseline_per_unit = param1 * param2 * coef
    total = baseline_per_unit * demand
    total_with_defect = total * (1 + defect)
    return ceil(total_with_defect)

# ============================
# Tkinter-GUI
# ============================
class OrderApp(tk.Tk):
    """Главное окно программы."""

    def __init__(self):
        super().__init__()
        self.title("Заявки партнёров")
        self.geometry("820x520")
        self.db = Database()

        # Заголовок
        ttk.Label(self, text="Заявки партнёров", font=("Helvetica", 18, "bold")).pack(pady=10)

        # Таблица заявок
        cols = ("id", "partner", "date", "sum")
        self.tree = ttk.Treeview(self, columns=cols, show="headings")
        self.tree.heading("id", text="№")
        self.tree.heading("partner", text="Партнёр")
        self.tree.heading("date", text="Дата")
        self.tree.heading("sum", text="Сумма, ₽")
        self.tree.column("id", width=50, anchor=tk.CENTER)
        self.tree.pack(fill=tk.BOTH, expand=True, padx=10, pady=10)
        self.tree.bind("<Double-1>", self.open_order)

        # Панель кнопок
        bar = ttk.Frame(self)
        bar.pack(pady=5)
        ttk.Button(bar, text="Добавить", command=self.add_order).pack(side=tk.LEFT, padx=5)
        ttk.Button(bar, text="Обновить", command=self.refresh).pack(side=tk.LEFT, padx=5)

        # Заполняем таблицу
        self.refresh()

    # ------- Методы GUI -------
    def refresh(self):
        for i in self.tree.get_children():
            self.tree.delete(i)
        for row in self.db.orders_all():
            self.tree.insert('', 'end',
                              values=(row['id'], row['partner_name'], row['created_at'].strftime('%Y-%m-%d %H:%M'),
                                      f"{row['total_cost']:.2f}"))

    def add_order(self):
        OrderForm(self, self.db)

    def open_order(self, _):
        sel = self.tree.selection()
        if not sel:
            return
        order_id = int(self.tree.item(sel[0])['values'][0])
        OrderDetails(self, self.db, order_id)

    def on_closing(self):
        self.db.close(); self.destroy()

# --------------------------------------------------------
class OrderForm(tk.Toplevel):
    """Окно создания новой заявки."""

    def __init__(self, master: OrderApp, db: Database):
        super().__init__(master)
        self.db = db
        self.title("Новая заявка")
        self.geometry("420x460")
        self.transient(master); self.grab_set()

        # Выбор партнёра
        ttk.Label(self, text="Партнёр:").pack(pady=(10, 0))
        self.partners = db.partners_all()
        self.partner_var = tk.StringVar()
        partner_cb = ttk.Combobox(self, textvariable=self.partner_var, values=[p['name'] for p in self.partners], state="readonly")
        partner_cb.pack(fill=tk.X, padx=20)
        if self.partners: partner_cb.current(0)

        # Список позиций
        ttk.Label(self, text="Товары в заявке:").pack(pady=10)
        self.products = db.products_all()
        self.lines = []  # [(product_cb, qty_var)]
        self.lines_frame = ttk.Frame(self)
        self.lines_frame.pack(fill=tk.BOTH, expand=True, padx=10)
        ttk.Button(self, text="+ Добавить позицию", command=self.add_line).pack(pady=5)

        # Сохранить
        ttk.Button(self, text="Сохранить", command=self.save).pack(pady=10)

    def add_line(self):
        f = ttk.Frame(self.lines_frame); f.pack(fill=tk.X, pady=2)
        pid_var = tk.StringVar(); qty_var = tk.IntVar(value=1)
        product_cb = ttk.Combobox(f, textvariable=pid_var, state="readonly", width=28,
                                   values=[p['name'] for p in self.products])
        product_cb.grid(row=0, column=0, padx=5); product_cb.current(0)
        ttk.Spinbox(f, from_=1, to=1000, textvariable=qty_var, width=6).grid(row=0, column=1, padx=5)
        self.lines.append((product_cb, qty_var))

    def save(self):
        if not self.lines:
            messagebox.showwarning("Нет товаров", "Добавьте хотя бы одну позицию."); return
        partner = next((p for p in self.partners if p['name'] == self.partner_var.get()), None)
        if not partner:
            messagebox.showerror("Ошибка", "Партнёр не выбран."); return
        items = []
        for product_cb, qty_var in self.lines:
            product = next((p for p in self.products if p['name'] == product_cb.get()), None)
            if product: items.append((product['id'], qty_var.get()))
        try:
            order_id = self.db.order_create(partner['id'], items)
            messagebox.showinfo("Успех", f"Заявка №{order_id} создана.")
            self.master.refresh(); self.destroy()
        except Exception as e:
            messagebox.showerror("Ошибка", str(e))

# --------------------------------------------------------
class OrderDetails(tk.Toplevel):
    """Просмотр содержимого заявки."""

    def __init__(self, master: OrderApp, db: Database, order_id: int):
        super().__init__(master)
        self.title(f"Заявка №{order_id}")
        self.geometry("520x420")

        cols = ("product", "qty", "price")
        tree = ttk.Treeview(self, columns=cols, show="headings")
        tree.heading("product", text="Продукция")
        tree.heading("qty", text="Кол-во")
        tree.heading("price", text="Цена")
        tree.pack(fill=tk.BOTH, expand=True, padx=10, pady=10)
        for row in db.order_items(order_id):
            tree.insert('', 'end', values=(row['name'], row['quantity'], f"{row['unit_price']:.2f}"))
        ttk.Button(self, text="Закрыть", command=self.destroy).pack(pady=5)

# ============================
# Точка входа
# ============================
if __name__ == "__main__":
    app = OrderApp()
    app.protocol("WM_DELETE_WINDOW", app.on_closing)
    app.mainloop()
