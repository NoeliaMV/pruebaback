# Vistas para la arquitectura API REST
from flask import jsonify

from main import app
from componentes.modelos import Platillo

@app.route('/api-prueba_back/platillo')
def mostrar_platillos():
    platillos = Platillo.obtener()
    dicc_platillos = [d.__dict__ for d in platillos]
    return jsonify(dicc_platillos)