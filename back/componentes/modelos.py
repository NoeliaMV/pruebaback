# Clases que corresponden a entidades en la BBDD
from base_db.config_db import conexion as con
from base_db.dml import Tabla
#from auxiliares.cifrado import encriptar

class Platillo(Tabla):  
    tabla = 'platillo'
    conexion = con
    campos = ('id', 'plato', 'descripcion', 'precio')
    
    def __init__(self, *args, de_bbdd=False):
        super().crear(args, de_bbdd)

class Cliente(Tabla):
    tabla = 'cliente'     
    campos = ('id', 'nombre','apellido', 'correo', 'platillo_id', 'valoracion_id') 
    conexion = con 

    def __init__(self, *args, de_bbdd=False):
        super().crear(args, de_bbdd)

class Valoracion(Tabla):
    tabla = 'valoracion'     
    campos = ('id', 'platillo_id','comentario', 'valoracion') 
    conexion = con 

    def __init__(self, *args, de_bbdd=False):
        super().crear(args, de_bbdd)     

class Imagen(Tabla):
    tabla = 'imagen' 
    campos = ('id', 'platillo_id', 'url_img', 'texto_alt')
    conexion = con

    def __init__(self, *args, de_bbdd=False):
       super().crear(args, de_bbdd)