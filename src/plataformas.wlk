import wollok.game.*
class Plataforma {
	const property position
	method image() = "plataforma.png"
	method subir(nave)
	{
		nave.estaEnElSuelo()
		nave.position(nave.position().up(1))
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
		nave.direccion().repelerADireccionOpuesta(nave)
	}
}

class DivisionVertical inherits Pared{
	override method image()="invisible.png"	
}

class Techo inherits Pared
{
	override method repeler(nave){
		nave.position(nave.position().down(1))
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
	method nuevoSuelo(){
		plataformas.forEach({p => game.addVisual(p)})			
	}
	
	method divisionVertical(inicio,fin,posicionEnX){
		(inicio..fin).forEach({numero => plataformas.add(new DivisionVertical(position=game.at(posicionEnX,numero)))})
	}
	
	method limitesInvisibles(){
		self.crearTecho()
		self.crearPared(0,game.height(),-1)
		self.crearPared(0,game.height(),game.width())
		self.divisionVertical(game.height(),-1,10)
		}
}

//Nivel 1
class NivelUno inherits Nivel
{
	method creoPlataformas()
	{
		self.limitesInvisibles()
		self.crearPlataforma(0,game.width(),0)
		self.crearPlataforma(game.center().x()-2,game.center().x()+2,5)
		self.nuevoSuelo()
	}
}

//Nivel 2
class NivelDos inherits Nivel {
	method creoPlataformas()
	{
		self.limitesInvisibles()
		self.crearPlataforma(0,game.width(),0)
		self.crearPlataforma(game.center().x()-1,game.center().x()-3,3)
		self.crearPlataforma(game.center().x()+7,game.center().x()+4,3)
		self.nuevoSuelo()
	}
}

//Nivel 3
class NivelTres inherits Nivel {
	method creoPlataformas()
	{
		self.limitesInvisibles()
		self.crearPlataforma(0,game.width(),0)
		self.crearPlataforma(game.center().x()-4,game.center().x()-2,7)
		self.crearPlataforma(game.center().x()+4,game.center().x()+2,7)
		self.crearPlataforma(game.center().x()-2,game.center().x()+2,2)
		self.nuevoSuelo()
	}
}

//Nivel 4
class NivelCuatro inherits Nivel {
	method creoPlataformas()
	{
		self.limitesInvisibles()
		self.crearPlataforma(0,game.width(),0)
		self.crearPlataforma(1,game.center().x(),2)
		self.crearPlataforma(game.center().x(),game.width()-2,2)
		self.crearPlataforma(0,game.center().x()-2,4)
		self.crearPlataforma(game.center().x()+2,game.width()-1,4)
		self.crearPlataforma(1,game.center().x(),6)
		self.crearPlataforma(game.center().x(),game.width()-2,6)
		self.crearPlataforma(0,game.center().x()-2,8)
		self.crearPlataforma(game.center().x()+2,game.width()-1,8)
		self.crearPared(0,game.height(),game.center().x())
		self.nuevoSuelo()
	}
}
