//: Playground - noun: a place where people can play

import UIKit

enum Velocidades : Int { //Declración de Enumeración
    case Apagado = 0
    case VelocidadBaja = 20
    case VelocidadMedia = 50
    case VelocidadAlta = 120
    init (velocidadInicial : Velocidades){ //Inicializa con velocidadInicial
        self = velocidadInicial
    }
}

class Auto{
    var velocidad : Velocidades //Declara velocidad de tipo Enumeración Velocidades
    init(){
        velocidad=Velocidades(velocidadInicial : .Apagado) //Inicializa en apagado
    }
    func cambioDeVelocidad( ) -> ( actual : Int, velocidadEnCadena: String){ //Función de cambio de velocidad
        var textoVelocidad : String
        switch velocidad { // Compara velocidad
        case .Apagado : //Si esta apagado incrementa la velocidad
            velocidad = .VelocidadBaja
            textoVelocidad="Velocidad Baja"
        case .VelocidadBaja, .VelocidadAlta : //Si es alta o baja la pasa a media
            velocidad = .VelocidadMedia
            textoVelocidad="Velocidad Media"
        case  .VelocidadMedia : // Si es media la incrementa
            velocidad = .VelocidadAlta
            textoVelocidad="Velocidad Alta"
        }
        return (actual : velocidad.rawValue, velocidadEnCadena : textoVelocidad) //regresa la tupla
    }
}

var auto = Auto() //Declar auto de tipo Calse Auto
var tuplaVelocidad : (actual : Int, velocidadEnCadena : String) //Declara tupla que recibe datos de la función
print("\(auto.velocidad.rawValue), \(auto.velocidad)") //Imprime el valor actual antes de incrementar la velocidad
for _ in 1...20 { //Repite 20 veces
    tuplaVelocidad = auto.cambioDeVelocidad() //Ejecuta la función y obtiene los datos de la velocidad actual en la tupla
    print("\(tuplaVelocidad.actual), \(tuplaVelocidad.velocidadEnCadena)") //Imprime los resultados
}
