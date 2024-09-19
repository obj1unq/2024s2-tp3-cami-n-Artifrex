import cosas.*

object camion {
	const property cosas = #{}
		
	method cargar(unaCosa) {
		cosas.add(unaCosa)
	}

	method descargar(cosa) {
		cosas.remove(cosa)
	}

	method hayAlgunoQuePesa(peso) {
		return cosas.any({cosa => cosa.peso() == peso})
	}

	method elDeNivel(nivel) {
		return cosas.find({cosa => cosa.nivelPeligrosidad() == nivel})
	}

	method pesoTotal() {
		const pesoCamion = 1000
		return cosas.sum({cosa => cosa.peso()}) + pesoCamion
	}

	method excedidoDePeso() {
		const pesoMaximo = 2500
		return self.pesoTotal() > pesoMaximo
	}

	method objetosQueSuperanPeligrosidad(nivel) {
		return cosas.filter({cosa => cosa.nivelPeligrosidad() == nivel})
	}

	method objetosMasPeligrososQue(cosa) {
		return cosas.filter({_cosa => _cosa.nivelPeligrosidad() > cosa.nivelPeligrosidad()})
	}

	method puedeCircularEnRuta(nivelMaximoPeligrosidad) {
		return not self.excedidoDePeso() && self.peligrosidadMaxima() < nivelMaximoPeligrosidad
	}

	method peligrosidadMaxima() {
		return cosas.sum({cosa => cosa.nivelPeligrosidad()})
	}

	method tieneAlgoQuePesaEntre(min, max) {
		return cosas.any({cosa => cosa.peso() >= max && cosa.peso() <= min})
	}

	method cosaMasPesada() {
		return cosas.max({cosa => cosa.peso()})
	}
}
