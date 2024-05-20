import wollok.game.*


class  Bounds{/*Control límites de pantalla*/
	
	method right(objeto)=objeto.position().x()<20
	
	method left(objeto)=objeto.position().x()>0
	
	method down(objeto)=objeto.position().y()>0
	
	method up(objeto)=objeto.position().y()<9
		
	method control(objeto){
		return self.right(objeto)and self.left(objeto)and self.up(objeto) and self.down(objeto)
	}
}

object boundsP1 inherits Bounds{//Límites player uno pantalla división media
	override method right(objeto){
		return objeto.position().x()<10	
	}
}

object boundsP2 inherits Bounds{//Límites player dos pantalla división media
	override method left(objeto){
		return objeto.position().x()>10	
	}
}



// Los dejo x si quieren usarlos despues
class Nivel{
	
}

//Nivel 1
class NivelUno inherits Nivel
{
	
}

//Nivel 2
class NivelDos inherits Nivel {
	
}

//Nivel 3
class NivelTres inherits Nivel {
	
}

//Nivel 4
class NivelCuatro inherits Nivel {
	
}
