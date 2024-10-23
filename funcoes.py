from tkinter import messagebox

# Função para conectar ao banco de dados e buscar produtos
def fetch_products(condbLocal):
    cursor = condbLocal.cursor()
    cursor.execute("SELECT pr.id, pr.name, p.quantity, p.pallet_number FROM Pallets p INNER JOIN Produtos pr ON p.product_id = pr.id")
    return cursor.fetchall()


# Função para atualizar a quantidade no banco de dados
def update_stock(condbLocal, cod_prod, quantity, person_name, pallet_number):
    cursor = condbLocal.cursor()
    cursor.execute("""
        UPDATE Pallets p
        INNER JOIN Produtos pr ON p.product_id = pr.id
        SET p.quantity = p.quantity - %s
        WHERE pr.id = %s
        AND p.pallet_number = %s
    """, (quantity, cod_prod, pallet_number))
    condbLocal.commit()
    
    cursor.execute("SELECT name FROM produtos WHERE id = %s", (cod_prod,))
    product_name = cursor.fetchone()[0]
    cursor.execute("INSERT INTO retirada_prod (cod_prod, product_name, quantity, person_name, date) VALUES (%s, %s, %s, %s, NOW())", 
                   (cod_prod, product_name, quantity, person_name))
    condbLocal.commit()
    messagebox.showinfo("Sucesso", "Estoque atualizado e retirada registrada com sucesso!")
