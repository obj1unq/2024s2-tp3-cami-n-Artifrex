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

object paqueteLadrillos {
	var cantLadrillos = 20

	method cantLadrillos(_cantLadrillos) {
		cantLadrillos = _cantLadrillos
	}

	method peso() {
		return 2 * cantLadrillos
	}

	method nivelPeligrosidad() {
		return 2
	}
}

object arenaGranel {
	var peso = 1

	method peso(_peso) {
		peso = _peso
	}

	method nivelPeligrosidad() {
		return 1
	}
}

object bateriaAntiarea {
	var tieneMisiles = false

	method peso() {
		return if (tieneMisiles) 300 else 200
	}

	method tieneMisiles(_tieneMisiles) {
		tieneMisiles = _tieneMisiles
	}

	method nivelPeligrosidad() {
		return if (tieneMisiles) 100 else 0
	}
}

object contenedorPortuario {
	const cosas = #{}

	method agregarCosas(cosa) {
		cosas.add(cosa)
	}

	method peso() {
		return 100 + self.pesoDeCosas()
	}

	method pesoDeCosas() {
		return cosas.sum({cosa => cosa.peso()})
	}

	method nivelPeligrosidad() {
		return cosas.max({cosa => cosa.nivelPeligrosidad()})
	}
}

object residuosRadioactivos {
	var property peso = 0
	
	method nivelPeligrosidad() {
		return 200
	}
}

object embalaje {
	var cosaQueEnvuelve = arenaGranel

	method peso() {
		return cosaQueEnvuelve.peso()
	}

	method nivelPeligrosidad() {
		return cosaQueEnvuelve.nivelPeligrosidad() / 2
	}
}

