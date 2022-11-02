
require_relative 'controlador_laberinto/Controlador'
require_relative 'modelo_laberinto/laberinto'
# include Controlador_laberinto
#require_relative 'Vista_laberinto'
require_relative 'vista2_laberinto'
modelo = Modelo_laberinto::Laberinto.new()
controlador = Controlador_laberinto::Controlador.new(modelo)
vista = Vista2_laberinto.new(controlador, modelo)
vista.menu_usuario()