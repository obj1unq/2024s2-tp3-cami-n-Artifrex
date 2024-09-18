import camion.*

object knightRider {
	method peso() {
		 return 500
	}
	method nivelPeligrosidad() { 
		return 10 
	}
}

object bomblebee {
	var transformacion = auto

	method transformacion(_transformacion) {
		transformacion = _transformacion
	}

	method peso() {
		return 800
	}

	method nivelPeligrosidad() {
		return transformacion.peligrosidad()
	}
}

//Transformaciones de Bomblebee
object auto {
	
	method peligrosidad() {
		return 15
	}
}

object robot {

	method peligrosidad() {
		return 30
	}
}


