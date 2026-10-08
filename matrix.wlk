object neo{
    var esElElegido = true
    method esElElegido(){
        return esElElegido
    }
    method cambiarEsElElegido(){
        esElElegido = !esElElegido
    }

    var energia = 100
    method saltar(){
        energia = energia / 2
    }
    method vitalidad(){
        return energia * 0.10
    }
}
object morfeo{
    var esElElegido = false
    method esElElegido(){
        return esElElegido
    }
    method cambiarEsElElegido(){
        esElElegido = !esElElegido
    }
    var vitalidad = 8
    var estaCansado = false
    method vitalidad(){
        return vitalidad
    }
    method cambiarVitalidad(nuevaVitalidad){
        vitalidad = nuevaVitalidad
    }
    method saltar(){
        estaCansado = !estaCansado
        vitalidad = vitalidad - 1
    }
}
object trinity{
    var esElElegido = false
    method esElElegido(){
        return esElElegido
    }
    method cambiarEsElElegido(){
        esElElegido = !esElElegido
    }
    method vitalidad(){
        return 0
    }
    method saltar(){noHaceNada}
}
object noHaceNada{}
object nave{
    const pasajeros = [trinity, morfeo, neo]
    method subirPasajero(pasajero){
        pasajeros.add(pasajero)
    }
    method bajarPasajero(pasajero){
        pasajeros.remove(pasajero)
    }
    method cantidadPasajeros(){
        return pasajeros.size()
    }
    method pasajeroConMayorVitalidad(){
        return pasajeros.max({ pasajero => pasajero.vitalidad() })
    }
    method vitalidadEquilibrada(){
        return pasajeros.isEmpty() ||
            pasajeros.max({ pasajero => pasajero.vitalidad() }).vitalidad() <=
            pasajeros.min({ pasajero => pasajero.vitalidad() }).vitalidad() * 2
    }
    method elElegidoEstaEnLaNave(){
        return pasajeros.any({ pasajero => pasajero.esElElegido() })
    }
    method pasajerosQueNoSonElElegido(){
        return pasajeros.filter({ pasajero => !pasajero.esElElegido() })
    }
    method chocar(){
        pasajeros.forEach({ pasajero => pasajero.saltar() })
        pasajeros.clear()
    }
    method acelerar(){
        self.pasajerosQueNoSonElElegido().forEach({ pasajero => pasajero.saltar() })
    }
}