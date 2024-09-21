import cosas.*
import almacenYCaminos.*

object camion {
	const property cosas = #{}

	method transportar(destino, camino) {
		self.validarTransporte(destino, camino)
		destino.almacenar(cosas)
		cosas.clear()
	}

	method validarTransporte(destino, camino) {
		if (not camino.puedePasar(self) or self.estaExcedidoEnCarga(destino)) {
			self.error("El peso o la peligrosidad superan el valor soportado")
		}
	}

	method estaExcedidoEnCarga(destino) {
		return self.totalBultos() >= destino.bultosMaximos()
	}

	method cargar(unaCosa) {
		cosas.add(unaCosa)
		unaCosa.transformar()
	}

	method descargar(cosa) {
		cosas.remove(cosa)
	}

	method todoPesoPar() {
		return cosas.all({cosa => cosa.peso().even()})
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
		return cosas.filter({cosa => cosa.nivelPeligrosidad() > nivel})
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
		return cosas.any({cosa => cosa.peso() >= min && cosa.peso() <= max})
		//yo se que hay una mejor forma de hacerla pero no se me ocurre
	}

	method cosaMasPesada() {
		return cosas.max({cosa => cosa.peso()})
	}

	method pesos() {
		return cosas.map({cosa => cosa.peso()})
	}

	method totalBultos() {
		return cosas.sum({cosa => cosa.bulto()})
	}
}
