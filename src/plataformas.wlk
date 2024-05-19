import wollok.game.*

class Plataforma {
	const property position
	method subir(nave)
	{
		nave.estaEnElSuelo()
		//nave.position(nave.position().up(1))
	}
	method interaccionCon(jugador)
	{
		const nave = jugador.nave()
		self.subir(nave)
	}
}

class Pared inherits Plataforma{
	override method interaccionCon(jugador){
		const nave = jugador.nave()
		self.repeler(nave)
	}
	method repeler(nave){
		nave.direccion().repeler(nave)
	}
}

class DivisionVertical inherits Pared{
	override method repeler(nave){
		nave.direccion().repelerADireccionOpuesta(nave)
	}
}

class Techo inherits Pared
{
	override method repeler(nave){
		nave.position(nave.position().down(1))
	}
}

class Suelo inherits Pared
{
	override method repeler(nave){
		nave.position(nave.position().up(1))
	}
}

class Nivel{
	
	const plataformas = []
	
	method crearPlataforma(inicio,fin,altura){
		(inicio..fin).forEach({numero => plataformas.add(new Plataforma(position=game.at(numero,altura)))})
	}
	
	method crearPared(inicio,fin,posicionEnX){
		(inicio..fin).forEach({numero => plataformas.add(new Pared(position=game.at(posicionEnX,numero)))})
	}
	
	method crearTecho(){
		(0..game.width()).forEach({numero => plataformas.add(new Techo(position=game.at(numero,game.height())))})
	}
	
	method crearSuelo(){
		(0..game.width()).forEach({numero => plataformas.add(new Suelo(position=game.at(numero,-1)))})
	}
	
	method agregarPlataformas(){
		plataformas.forEach({p => game.addVisual(p)})			
	}
	
	method divisionVertical(inicio,fin,posicionEnX){
		(inicio..fin).forEach({numero => plataformas.add(new DivisionVertical(position=game.at(posicionEnX,numero)))})
	}
	
	method limitesInvisibles(){
		self.crearTecho()
		self.crearSuelo()
		self.divisionVertical(game.height(),0,10)
		self.crearPared(-1,game.height(),-1)
		self.crearPared(-1,game.height(),game.width())
		
		}
}

//Nivel 1
class NivelUno inherits Nivel
{
	method creoPlataformas()
	{
		self.limitesInvisibles()
		self.agregarPlataformas()
		
	}
}

//Nivel 2
class NivelDos inherits Nivel {
	method creoPlataformas()
	{
		self.limitesInvisibles()
		self.agregarPlataformas()
		
	}
}

//Nivel 3
class NivelTres inherits Nivel {
	method creoPlataformas()
	{
		self.limitesInvisibles()
		self.agregarPlataformas()		
	}
}

//Nivel 4
class NivelCuatro inherits Nivel {
	method creoPlataformas()
	{
		self.limitesInvisibles()
		self.agregarPlataformas()
	}
}
