import wollok.game.*

class ComederoNormal {
	var property tamanioRacion = 6
	var property pesoMaximo = 300
	var property raciones = 3

	var property position = game.at(3,6)
	const property image = "comedero.gif"

	
	method puedeAtender(animal) {
		return animal.tieneHambre() and animal.peso() <= pesoMaximo
	}	
	
	method atender(animal) {
		self.validarRacionesSuficientes()
		animal.comer(tamanioRacion)
		raciones -= 1
	}
	
	method validarRacionesSuficientes() {
		if (raciones == 0) { 
			self.error("No tengo más comida")
		}
	}
}