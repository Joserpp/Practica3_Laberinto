include Modelo_laberinto
include Controlador_laberinto

#require_relative 'Vista_laberinto'
require_relative 'vista2_laberinto.rb'

modelo = Laberinto.new()
controlador = Controlador.new(modelo)
vista = Vista2_laberinto.new(controlador, modelo)
vista.menu_usuario()