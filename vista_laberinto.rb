require_relative 'controlador_laberinto/Controlador'
require_relative 'controlador_laberinto/Estado_juego'
require_relative 'modelo_laberinto/laberinto'

class Vista_laberinto

    def initialize(controlador)
        @controlador=controlador
    end

    def menu_usuario()
        estado=@controlador.estado
        
        case estado
            when Controlador_laberinto::Estado_juego::EN_ENTRADA_LABERINTO
                puts "Estamos fuera del laberinto y vivos"

                puts "Introducta el numero de vidas"
                vidas=gets.chomp.to_i
                while(vidas <= 0 || vidas > 10)
                    puts "Valor de vidas incorrecto"
                    puts "Introducta el numero de vidas"
                    vidas=gets.chomp
                end
                puts "El número de vidas es: " + vidas.to_s
                @controlador.entrar(vidas.to_i)
                
            when Controlador_laberinto::Estado_juego::DENTRO_VIVO

                puts informe_dentro(@controlador.habitacion_usuario,@controlador.vidas).to_s

                puts "Pulse una tecla"
                st= gets.chomp
                movimiento=@controlador.intentar_avanzar()
                
                puts "Se ha movido hacia: " + Lista_direcciones[movimiento]

            when Controlador_laberinto::Estado_juego::EN_SALIDA_LABERINTO
                puts "¡HAS GANADO!"
                puts informe_final(@controlador.vidas)
                exit 0
            
            when Controlador_laberinto::Estado_juego::DENTRO_MUERTO
                puts informe_final(@controlador.vidas)
                exit 0
        end
        menu_usuario
    end

    def informe_dentro(habitacion,vidas)
       puts "Estamos en la habitación : " + habitacion.to_s
       puts "Tenemos " + vidas.to_s + " vidas" 
    end

    def informe_final(vidas)
        puts "Tenemos " + vidas.to_s + " vidas"
    end
end