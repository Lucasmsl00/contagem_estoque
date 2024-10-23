from mysql.connector import connect

def conexaoLocal():
    condb = connect(
        host = 'localhost',
        user = 'root',
        password = '',
        database = 'estoque_emporio')
    return condb