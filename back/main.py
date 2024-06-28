from flask import Flask

app = Flask(__name__)

# Importar las vistas
from componentes.vistas_api import *
from componentes.vistas_web import *

# Lo siguiente solo en desarrollo, no en produccion
if __name__ == '__main__':
    app.run()