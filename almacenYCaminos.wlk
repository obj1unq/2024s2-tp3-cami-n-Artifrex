import camion.*
import cosas.*

object almacen {

    const property almacen = #{}

    method almacenar(cosas) {
    //    self.validarCarga(vehiculo) -> forma que no me convence, porque el almacen no tendria porqué saber del vehiculo
        almacen.addAll(cosas)
    }

//    method validarCarga(vehiculo) {
//        if (vehiculo.totalBultos() >= self.bultosMaximos()) {
//            self.error("La carga del vehículo no caben en el almacen")
//        }
//    }

    method bultosMaximos() {
        return 3
    }
}

object ruta9 {

    method puedePasar(vehiculo) {
        return vehiculo.puedeCircularEnRuta(self.nivelPeligrosidad())
    }

    method nivelPeligrosidad() {
        return 11
    }
}

object caminoVecinal {
    var pesoMaximo = 0
 
    method puedePasar(vehiculo) {
        return pesoMaximo > vehiculo.pesoTotal()
    }

    method pesoMaximo(_pesoMaximo) {
        pesoMaximo = _pesoMaximo
    }

}