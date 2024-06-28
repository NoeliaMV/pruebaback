# Vistas para la arquitectura API REST
from flask import jsonify
from flask import render_template
from flask import request


from main import app
from componentes.modelos import Platillo
from componentes.modelos import Cliente
from componentes.modelos import Valoracion
from componentes.modelos import Imagen

#GET
@app.route("/api-prueba_back/platillo", methods=['GET'])
def api_platillo():
    platillos = Platillo.obtener()
    datos = [platillo.__dict__ for platillo in platillos]

    return jsonify(datos)

@app.route("/api-preuba_back/cliente", methods=['GET'])
def api_cliente():
    clientes = Cliente.obtener()
    datos = [cliente.__dict__ for cliente in clientes]

    for dato in datos:
        dato["platillo"] = Platillo.obtener('id', dato['platillo_id']).__dict__["platillo"]
        dato["valoracion"] = Valoracion.obtener('id', dato['valoracion_id']).__dict__["valoracion"]
        imagenes = Imagen.obtener('platillo_id', dato["id"])
        dato["imagenes"] = []

        if type(imagenes) == list:
            for img in imagenes:
                i = img.__dict__
                dato["imagenes"].append(i)

        else:
            dato["imagens"].append(imagenes.__dict__)

        del dato["platillo_id"]
        del dato["valoracion_id"]

    return jsonify(datos)

@app.route("/api-prueba_back/valoracion", methods=['GET'])
def api_valoracion():
    valoraciones = Valoracion.obtener()
    datos = [valoracion.__dict__ for valoracion in valoraciones]

    for dato in datos:
        dato["platillo"] = Platillo.obtener('id', dato['platillo_id']).__dict__["platillo"]

        del dato["platillo_id"]

    return jsonify(datos) 
   
@app.route("/api-prueba_back/imagen", methods=['GET'])
def api_imagen():
    imagenes = Imagen.obtener()
    datos = [imagen.__dict__ for imagen in imagenes]

    for dato in datos:
        dato["platillo"] = Platillo.obtener('id', dato['platillo_id']).__dict__["platillo"]

        del dato["platillo_id"] 

    return jsonify(datos)   
  