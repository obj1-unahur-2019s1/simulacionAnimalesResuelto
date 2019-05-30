import wollok.game.*

class Animal {
	var property position = game.at(3,3)
	
	method subir() {
		self.caminar()
		position = position.up(1)
	}
	
	method bajar() {
		self.caminar()
		position = position.down(1)
	}
	
	method izquierda() {
		self.caminar()
		position = position.left(1)
	}

	method derecha() {
		self.caminar()
		position = position.right(1)
	}
	
	method caminar()
}

class Vaca inherits Animal {
	const property image = "vaca.gif"
	
	var property peso = 100
	var property tieneSed = false
	
	method comer(cuanto) {
		if (not self.tieneHambre()) {
			self.error("No tengo hambre che")
		}
		
		peso += cuanto / 2
		tieneSed = true
	}
	
	method beber() {
		peso -= 1
		tieneSed = false
	}
	
	method tieneHambre() {
		return peso < 200
	}
	
	override method caminar() {
		if (peso == 50) { 
			self.error("Ya no puedo caminar, dame de comer primero...")
		}
		
		peso = 50.max(peso * 0.95)
	}
}

class Gallina inherits Animal {
	const property image = "gallina.gif"
	
	const property peso = 4
	var cuantoComio = 0
	method tieneSed() = cuantoComio == 2 || cuantoComio == 5
	
	method comer(cuanto) {
		cuantoComio++
	}
	
	method tieneHambre() {
		return cuantoComio.even()
	}
	
	method beber() {}
	override method caminar() {}
}
