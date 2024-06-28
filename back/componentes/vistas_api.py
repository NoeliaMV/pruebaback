# Vistas para la arquitectura API REST
from flask import jsonify

from main import app
from componentes.modelos import Platillo
from componentes.modelos import Cliente
from componentes.modelos import Valoracion

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

        del dato["platillo_id"]
        del dato["valoracion_id"]

    return jsonify(datos) 

@app.route("/api-prueba_back/valoracion", methods=['GET'])
def api_valoracion():
    valoraciones = Valoracion.obtener()
    datos = [valoracion.__dict__ for valoracion in valoraciones]
  