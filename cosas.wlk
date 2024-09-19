import camion.*

object knightRider {
	method peso() {
		 return 500
	}
	method nivelPeligrosidad() { 
		return 10 
	}

	method bulto() {
		return 1
	}

	method transformar() {
		
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
	
	method bulto() {
		return 2
	}

	method transformar() {
		self.transformacion(robot)
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

	method bultos() {
		if(cantLadrillos <= 100) {
			return 1
		} else if(cantLadrillos.between(101, 300)) {
			return 2
		} else {return 3}
	}

	method transformar() {
		self.peso() + 15
	}
}

object arenaGranel {
	var property peso = 1

	method nivelPeligrosidad() {
		return 1
	}
	
	method bulto() {
		return 1
	}

	method transformar() {
		peso + 20
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
	
	method bulto() {
		return if (tieneMisiles) 2 else 1
	}
	
	method transformar() {
		self.tieneMisiles(true)
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

	method bultos() {
		return 1 + cosas.sum({cosa => cosa.bulto()})
	}

	method transformar() {
		cosas.forEach({cosa => cosa.transformar()})
	}
}

object residuosRadioactivos {
	var property peso = 0
	
	method nivelPeligrosidad() {
		return 200
	}

	method bultos() {
		return 1
	}
	method transformar() {
		self.peso() + 15
	}
}

object embalaje {
	var cosaQueEnvuelve = arenaGranel

	method cosaQueEnvuelve(_cosaQueEnvuelve) {
		cosaQueEnvuelve = _cosaQueEnvuelve
	}

	method peso() {
		return cosaQueEnvuelve.peso()
	}

	method nivelPeligrosidad() {
		return cosaQueEnvuelve.nivelPeligrosidad() / 2
	}
	
	method bulto() {
		return 2
	}
	method transformar() {
		
	}
}

