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

    
    for dato in datos:
        imagenes = Imagen.obtener('platillo_id', dato["id"])
        dato["imagenes"] = []
    
        if type(imagenes) == list:
            for img in imagenes:
                i = img.__dict__
                dato["imagenes"].append(i)

        else:
            dato["imagenes"].append(imagenes.__dict__)


    return jsonify(datos)

@app.route("/api-preuba_back/cliente", methods=['GET'])
def api_cliente():
    clientes = Cliente.obtener()
    datos = [cliente.__dict__ for cliente in clientes]

    for dato in datos:
        dato["platillo"] = Platillo.obtener('id', dato['platillo_id']).__dict__["platillo"]
        dato["valoracion"] = Valoracion.obtener('id', dato['valoracion_id']).__dict__["valoracion"]
        

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
   
#@app.route("/api-prueba_back/imagen", methods=['GET'])
#def api_imagen():
    imagenes = Imagen.obtener()
    datos = [imagen.__dict__ for imagen in imagenes]

    for dato in datos:
        dato["platillo"] = Platillo.obtener('id', dato['platillo_id']).__dict__["platillo"]

        del dato["platillo_id"] 

    return jsonify(datos)   
  
  #POST
@app.route("/api-prueba_back/cliente", methods=['POST'])
def crear_cliente():

    if request.method == 'POST':
        datos = request.json["datos"]
        cliente_nuevo = Cliente(
            datos['nombre'],
            datos['apellido'],
            datos['correo'],
            datos['platillo_id'],
            datos['valoracion_id'],
        )

        respuesta = {}
        rta_bbd = cliente_nuevo.guardar_db()

        if not rta_bbd:
            respuesta['mensaje'] = 'No se pudo enviar los datos!'
            respuesta['status'] = 409
        else:
            cliente_nuevo.guardar_db()
            respuesta['mensaje'] = 'Datos enviados con exito!'
            respuesta['status'] = 200

    else:
        respuesta['mensaje'] = 'No se recibieron datos'
        respuesta['status'] = 204

    return jsonify(respuesta)

@app.route("/api-prueba_back/valoracion", methods=['POST'])
def crear_valoracion():

    if request.method == 'POST':
        datos = request.json["datos"]
        nva_valoracion = Valoracion(
            datos['platillo_id'],
            datos['comentario'],
            datos['valoracion'],
        )

        respuesta = {}
        rta_bbd = nva_valoracion.guardar_db()

        if not rta_bbd:
            respuesta['mensaje'] = 'No se pudo enviar los datos!'
            respuesta['status'] = 409
        else:
            nva_valoracion.guardar_db()
            respuesta['mensaje'] = 'Datos enviados con exito!'
            respuesta['status'] = 200

    else:
        respuesta['mensaje'] = 'No se recibieron datos'
        respuesta['status'] = 204

    return jsonify(respuesta)