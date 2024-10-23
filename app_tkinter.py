import tkinter as tk
from funcoes import *
from conexao import conexaoLocal

condbLocal = conexaoLocal()






# Função para realizar a retirada
def process_withdrawal():
    num_pallet = num_pallet_var.get()
    cod_prod = cod_prod_var.get()
    quantity = int(quantity_var.get())
    person_name = person_var.get()
    update_stock(condbLocal, cod_prod, quantity, person_name, num_pallet)
    load_products()  # Recarrega a lista de produtos

# Função para carregar os produtos na interface
def load_products():
    product_list.delete(0, tk.END)
    products = fetch_products(condbLocal)
    for prod in products:
        product_list.insert(tk.END, f"{prod[0]} - Nome: {prod[1]} - Quantidade: {prod[2]} - N° Pallet: {prod[3]}")

# Interface gráfica
root = tk.Tk()
root.title("Retirada de Produtos")

cod_prod_var = tk.StringVar()
product_var = tk.StringVar()
num_pallet_var = tk.StringVar()
quantity_var = tk.StringVar()
person_var = tk.StringVar()

tk.Label(root, text="Produtos no estoque").pack()

product_list = tk.Listbox(root, width=100)
product_list.pack()

tk.Label(root, text="Cód. Produto").pack()
cod_prod_entry = tk.Entry(root, textvariable=cod_prod_var)
cod_prod_entry.pack()

tk.Label(root, text="Nº Pallet").pack()
num_pallet_entry = tk.Entry(root, textvariable=num_pallet_var)
num_pallet_entry.pack()

tk.Label(root, text="Quantidade a retirar").pack()
quantity_entry = tk.Entry(root, textvariable=quantity_var)
quantity_entry.pack()

tk.Label(root, text="Nome de quem retira").pack()
person_entry = tk.Entry(root, textvariable=person_var)
person_entry.pack()

tk.Button(root, text="Realizar Retirada", command=process_withdrawal).pack()

# Carregar produtos ao iniciar
load_products()

root.mainloop()
