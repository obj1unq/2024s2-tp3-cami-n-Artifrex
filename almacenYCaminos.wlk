import camion.*
import cosas.*

object almacen {

    const almacen = #{}

    method almacenar(cosas) {
        almacen.addAll(cosas)
    }

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