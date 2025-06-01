# m3

class Main:
    def __init__(self):
        self.root = tk.Tk()
        self.root.geometry('1280x768')
        self.root.iconphoto(False, tk.PhotoImage(file="Комфорт.png"))
        default_font = font.Font(family="Candara", size=12)
        self.root.option_add("*Font", default_font)
        self.main_frame = tk.Frame(self.root)
        self.main_frame.grid(row=0, column=0, sticky=tk.NSEW)
        self.main_frame.grid_rowconfigure(0, weight=1)
        self.main_frame.grid_columnconfigure(0, weight=1)

        self.screen = 'product_list'
        self.draw_screen()

    def main(self):
        self.root.mainloop()

    def draw_screen(self):
        for widget in self.main_frame.winfo_children():
            widget.destroy()

        if self.screen == 'product_list':
            screen = ListScreen(self)
            screen.draw(self.main_frame)
        if self.screen == 'create':
            screen = CreateScreen(self)
            screen.draw(self.main_frame)

if __name__ == '__main__':
    Main().main()

# crate screen

import tkinter as tk
from tkinter import ttk

from service.db_service import DbService


class CreateScreen:
    def __init__(self, app):
        self.app = app
        self.material_type_error_label = None
        self.min_price_error_label = None
        self.title_error_label = None
        self.product_type_error_label = None
        self.sku_error_label = None
        self.min_price_input = None
        self.material_type_input = None
        self.product_type_input = None
        self.title_input = None

        self.db_service = DbService()

        self.product_types = self.db_service.get_product_types()
        self.material_types = self.db_service.get_material_types()

        self.form = {
            "sku": tk.StringVar(),
            "product": tk.StringVar(),
            "title": tk.StringVar(),
            "min_price": tk.StringVar(),
            "material": tk.StringVar(),
        }

        self.sku_input = None

    def draw(self, frame):
        self.app.root.title("Создать продукт")
        header_label = tk.Label(frame, text='Создание продукта', font=('Candara', 18))
        header_label.grid(column=0, row=0, sticky=tk.W)

        sku_label = tk.Label(frame, text="Артикул:")
        sku_label.grid(column=0, row=1, sticky=tk.E, padx=5, pady=5)
        self.sku_input = tk.Entry(frame, textvariable=self.form['sku'])
        self.sku_input.grid(column=1, row=1, sticky=tk.W, padx=5, pady=5)
        self.sku_error_label = tk.Label(frame, text="", fg="red")
        self.sku_error_label.grid(column=2, row=1, sticky=tk.E, padx=5, pady=5)

        product_type_label = tk.Label(frame, text="Тип продукта:")
        product_type_label.grid(column=0, row=2, sticky=tk.E, padx=5, pady=5)
        self.product_type_input = ttk.Combobox(frame, textvariable=self.form['product'],
                                               values=list(self.product_types.keys()))
        self.product_type_input.current(0)
        self.product_type_input.grid(column=1, row=2, sticky=tk.W, padx=5, pady=5)
        self.product_type_error_label = tk.Label(frame, text="", fg="red")
        self.product_type_error_label.grid(column=2, row=2, sticky=tk.E, padx=5, pady=5)

        title_label = tk.Label(frame, text="Наименование:")
        title_label.grid(column=0, row=3, sticky=tk.E, padx=5, pady=5)
        self.title_input = tk.Entry(frame, textvariable=self.form['title'])
        self.title_input.grid(column=1, row=3, sticky=tk.W, padx=5, pady=5)
        self.title_error_label = tk.Label(frame, text="", fg="red")
        self.title_error_label.grid(column=2, row=3, sticky=tk.E, padx=5, pady=5)

        min_price_label = tk.Label(frame, text="Минимальная стоимость для партнёра:")
        min_price_label.grid(column=0, row=4, sticky=tk.E, padx=5, pady=5)
        self.min_price_input = tk.Entry(frame, textvariable=self.form['min_price'])
        self.min_price_input.grid(column=1, row=4, sticky=tk.W, padx=5, pady=5)
        self.min_price_error_label = tk.Label(frame, text="", fg="red")
        self.min_price_error_label.grid(column=2, row=4, sticky=tk.E, padx=5, pady=5)

        material_type_label = tk.Label(frame, text="Основной материал:")
        material_type_label.grid(column=0, row=5, sticky=tk.E, padx=5, pady=5)

        self.material_type_input = ttk.Combobox(frame, textvariable=self.form['material'],
                                                values=list(self.material_types.keys()))
        self.material_type_input.current(0)
        self.material_type_input.grid(column=1, row=5, sticky=tk.W, padx=5, pady=5)
        self.material_type_error_label = tk.Label(frame, text="", fg="red")
        self.material_type_error_label.grid(column=2, row=5, sticky=tk.E, padx=5, pady=5)

        back_button = tk.Button(frame, text="Назад", command=self.back_to_list)
        back_button.grid(column=1, row=6, padx=5, pady=25)

        create_button = tk.Button(frame, text="Создать", command=self.create_product)
        create_button.grid(column=2, row=6, padx=5, pady=25)

    def back_to_list(self):
        self.app.screen = 'product_list'
        self.app.draw_screen()

    def create_product(self):
        if self.find_errors():
            return False
        form_object = {
            key: var.get() for key, var in self.form.items()
        }
        form_object["product_type_id"] = self.product_types[form_object['product']]
        form_object["material_type_id"] = self.material_types[form_object['material']]
        self.db_service.add_product(form_object)
        self.app.screen = 'product_list'
        self.app.draw_screen()

    def find_errors(self):
        has_errors = False
        self.reset_error_labels()

        sku = self.form["sku"].get()
        product = self.form["product"].get()
        title = self.form["title"].get()
        min_price = self.form["min_price"].get()
        material = self.form["material"].get()

        if not sku:
            self.sku_error_label.config(text="Поле \"Артикул\" должно быть заполнено")
            has_errors = True

        if not product:
            self.product_type_error_label.config(text="Нужно выбрать тип продукта из списка")
            has_errors = True

        if not title:
            self.title_error_label.config(text="Поле \"название\" должно быть заполнено")
            has_errors = True

        if not min_price:
            self.min_price_error_label.config(text="Поле \"Минимальная цена\" должно быть заполнено")
            has_errors = True
        if not is_float(min_price):
            self.min_price_error_label.config(text="\"Минимальная цена\" должна быть числом")
            has_errors = True
        if is_float(min_price) and float(min_price) < 0:
            self.min_price_error_label.config(text="\"Минимальная цена\" должна быть положительным")
            has_errors = True

        if not material:
            self.material_type_error_label.config(text="Нужно выбрать основной материал из списка")
            has_errors = True

        return has_errors

    def reset_error_labels(self):
        for label in [self.sku_error_label, self.product_type_error_label, self.title_error_label,
                      self.min_price_error_label]:
            label.config(text="")


def is_float(value: str) -> bool:
    try:
        float(value)
        return True
    except ValueError:
        return False

# db service

import mysql.connector


class DbService:
    def __init__(self):
        self.db_config = {
            'host': 'localhost',
            'user': 'root',
            'password': '1234',
            'database': 'Test1'
        }

    def get_product_list(self):
        query = """
                SELECT pt.title AS product_type,
                       p.title AS product_name,
                       p.sku AS sku,
                       p.minimal_price AS minimal_price,
                       mt.title AS material_type,
                       ROUND(SUM(pw.production_time), 2) AS production_time
                FROM product p
                LEFT JOIN product_type pt ON p.product_type_id = pt.id
                LEFT JOIN material_type mt ON p.material_type_id = mt.id
                LEFT JOIN product_workshop pw ON p.id = pw.product_id
                GROUP BY pt.title, p.title, p.sku, p.minimal_price, mt.title
                """
        connection = mysql.connector.connect(**self.db_config)
        cursor = connection.cursor()
        cursor.execute(query)
        rows = cursor.fetchall()
        cursor.close()
        connection.close()
        return rows

    def get_product_types(self):
        query = """
        select title, id from product_type
        """
        return self.get_dict(query)

    def get_material_types(self):
        query = """
        select title, id from material_type
        """
        return self.get_dict(query)

    def get_dict(self, query):
        connection = mysql.connector.connect(**self.db_config)
        cursor = connection.cursor()
        cursor.execute(query)
        rows = cursor.fetchall()
        cursor.close()
        connection.close()
        return {row[0]: row[1] for row in rows}

    def add_product(self, form):
        query = """
        insert into product (title, sku, minimal_price, product_type_id, material_type_id) values (%s, %s, %s, %s, %s)
        """
        print(form)
        connection = mysql.connector.connect(**self.db_config)
        cursor = connection.cursor()
        cursor.execute(query, [
            form['title'],
            form['sku'],
            form['min_price'],
            form['product_type_id'],
            form['material_type_id']
        ])
        connection.commit()
        cursor.close()
        connection.close()
        print("Продукт успешно сохранён")

## list screen

import tkinter as tk
from tkinter import ttk

from service.db_service import DbService


class ListScreen:
    def __init__(self, app):
        self.app = app
        self.create_button = None
        self.edit_button = None
        self.tree = None
        self.db_service = DbService()
        style = ttk.Style()
        style.theme_use("default")
        style.configure(".", font=("Candara", 12))
        style.map("Treeview",
                  background=[("selected", "#355CBD")],
                  foreground=[("selected", "white")])

    def draw(self, frame):
        self.app.root.title("Список продукции")
        rows = self.db_service.get_product_list()
        columns = ["Тип продукта", "Продукт", "Артикул", "Минимальная цена", "Основной материал", "Время изготовления"]
        self.tree = ttk.Treeview(frame, columns=columns, show='headings', height=25)
        self.tree.grid(row=0, column=0)
        for col in columns:
            self.tree.heading(col, text=col)
            self.tree.column(col, width=200, anchor=tk.W)
        for row in rows:
            self.tree.insert('', 'end', values=row)
        self.edit_button = ttk.Button(frame, text="Редактировать продукт", command=self.edit_selected, state='disabled')
        self.edit_button.grid(row=1, column=0, padx=10, pady=10)
        self.create_button = ttk.Button(frame, text="Создать новую запись", command=self.go_to_create_screen)
        self.create_button.grid(row=2, column=0, padx=10, pady=10)
        self.tree.bind('<<TreeviewSelect>>', self.on_select)

    def on_select(self, event):
        selected = self.tree.selection()
        if selected:
            self.edit_button['state'] = 'normal'
        else:
            self.edit_button['state'] = 'disabled'

    def edit_selected(self):
        selected = self.tree.selection()
        if selected:
            item = self.tree.item(selected[0])
            print("Редактирование:", item['values'])

    def go_to_create_screen(self):
        self.app.screen = 'create'
        self.app.draw_screen(

## module 4

        # Метод должен принимать идентификатор типа продукции, идентификатор типа материала,
        # количество продукции – целые числа,
        # параметры продукции (два параметра) – вещественные, положительные числа,
        # а возвращать целое число – количество сырья с учетом возможных потерь сырья.

        import mysql.connector

        def create_connection():
            return mysql.connector.connect(
                host="localhost",
                user="root",
                password="1234",
                database="Test1"
            )

        def calc_material(product_id, material_id, amount, param1, param2):

            query = """
            select ((%s * %s + pt.koefficient) + (%s * %s + pt.koefficient) * mt.lost_percent) * %s
                from product p
                left join product_type pt on p.product_type_id = pt.id
                left join material_type mt on p.material_type_id = mt.id and mt.id = %s
            where p.id = %s
            """

            conn = create_connection()
            cursor = conn.cursor()

            cursor.execute(query, [param1, param2, param1, param2, amount, material_id, product_id])
            result = cursor.fetchone()
            if not result:
                return -1
            print(result[0])
            cursor.close()
            conn.close()
            return result[0]

        if __name__ == '__main__':
            calc_material(1, 2, 2, 1.0, 2.0)

## maket like

import tkinter as tk
from tkinter import ttk
import mysql.connector

def db_config():
    return  {
        'host': 'localhost',
        'user': 'root',
        'password': '1234',
        'database': 'Test1'
    }



def draw_text(card_frame, row):
    print(row)
    product_type = row[0]
    product_name = row[1]
    time = row[5]
    sku = row[2]
    min_price = row[3]
    main_material = row[4]
    ttk.Label(card_frame, text=f"{product_type} | {product_name}", font=('Arial', 14)).grid(column=0, row=0, sticky='ew')
    ttk.Label(card_frame, text=f"Время изготовления: {time} ч", font=('Arial', 14)).grid(column=1, row=0, sticky='nw')
    ttk.Label(card_frame, text=f"Артикул: {sku}", font=('Arial', 14)).grid(column=0, row=1, sticky='ew')
    ttk.Label(card_frame, text=f"Минимальная цена: {min_price}", font=('Arial', 14)).grid(column=0, row=3, sticky='ew')
    ttk.Label(card_frame, text=f"Основной материал: {main_material}", font=('Arial', 14)).grid(column=0, row=4, sticky='ew')


def draw_card_frame(table_frame, row, i):
    fake_border_frame = tk.Frame(table_frame, bg='black')
    fake_border_frame.grid(row=i, column=0, padx=15, pady=10)
    card_frame = tk.Frame(fake_border_frame, height=200, borderwidth=5)
    card_frame.pack(padx=4, pady=4, fill='x', expand=True)
    draw_text(card_frame, row)


def get_data():
    query = """
                    SELECT pt.title AS product_type,
                           p.title AS product_name,
                           p.sku AS sku,
                           p.minimal_price AS minimal_price,
                           mt.title AS material_type,
                           ROUND(SUM(pw.production_time), 2) AS production_time
                    FROM product p
                    LEFT JOIN product_type pt ON p.product_type_id = pt.id
                    LEFT JOIN material_type mt ON p.material_type_id = mt.id
                    LEFT JOIN product_workshop pw ON p.id = pw.product_id
                    GROUP BY pt.title, p.title, p.sku, p.minimal_price, mt.title
                    """
    connection = mysql.connector.connect(**db_config())
    cursor = connection.cursor()
    cursor.execute(query)
    rows = cursor.fetchall()
    cursor.close()
    connection.close()
    return rows



def draw_scrollable_table_frame(container):
    canvas = tk.Canvas(container, bg="#dddddd", highlightthickness=0)
    scrollbar = tk.Scrollbar(container, orient="vertical", command=canvas.yview)

    scrollable_frame = tk.Frame(canvas, bg="#dddddd")

    scrollable_frame.bind(
        "<Configure>",
        lambda e: canvas.configure(scrollregion=canvas.bbox("all"))
    )

    canvas_frame = canvas.create_window((0, 0), window=scrollable_frame, anchor="n", width=container.winfo_width())

    def resize_canvas(event):
        canvas.itemconfig(canvas_frame, width=event.width)

    canvas.bind("<Configure>", resize_canvas)

    def _on_mousewheel(event):
        canvas.yview_scroll(int(-1 * (event.delta / 120)), "units")

    canvas.bind_all("<MouseWheel>", _on_mousewheel)  # Windows/macOS
    canvas.bind_all("<Button-4>", lambda e: canvas.yview_scroll(-1, "units"))  # Linux scroll up
    canvas.bind_all("<Button-5>", lambda e: canvas.yview_scroll(1, "units"))   # Linux scroll down

    canvas.configure(yscrollcommand=scrollbar.set)
    canvas.grid(row=0, column=0, sticky="nsew")
    scrollbar.grid(row=0, column=1, sticky="ns")

    container.grid_rowconfigure(0, weight=1)
    container.grid_columnconfigure(0, weight=1)
    scrollable_frame.grid_columnconfigure(0, weight=1)

    data = get_data()

    i = 0
    for row in data:
        draw_card_frame(scrollable_frame, row, i)
        i += 1


def draw_main_frame(root):
    frame = tk.Frame(root, bg='#ffffff')
    frame.grid(row=0, column=0, sticky=tk.NSEW)
    frame.columnconfigure(0, weight=1)
    frame.rowconfigure(0, weight=1)
    draw_scrollable_table_frame(frame)


def main():
    root = tk.Tk()
    root.geometry("1000x800")
    root.title("Test")
    root.grid_rowconfigure(0, weight=1)
    root.grid_columnconfigure(0, weight=1)
    draw_main_frame(root)
    root.mainloop()

if __name__ == '__main__':
    main()

##pillow example
import tkinter as tk
from PIL import Image, ImageTk

# Создаем главное окно
root = tk.Tk()
root.title("PNG в Tkinter")

# Загружаем изображение
original_image = Image.open("your_image.png")  # путь к PNG
resized_image = original_image.resize((200, 200))  # изменяем размер
tk_image = ImageTk.PhotoImage(resized_image)

# Создаем виджет Label с изображением
label = tk.Label(root, image=tk_image)
label.pack()

# Запускаем главный цикл
root.mainloop()

## unit test

import unittest

from screens.create import is_float

class TestCalculator(unittest.TestCase):
    def test_is_float(self):
        self.assertTrue(is_float("2.2"))
    def test_is_not_float(self):
        self.assertFalse(is_float("d"))

if __name__ == '__main__':
    unittest.main()