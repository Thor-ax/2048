import Foundation

enum Couleurs: String { 
case noir = "\u{001B}[0;30m"
case rouge = "\u{001B}[0;31m"
case vert = "\u{001B}[0;32m"
case jaune = "\u{001B}[0;33m"
case bleu = "\u{001B}[0;34m"
case magenta = "\u{001B}[0;35m"
case cyan = "\u{001B}[0;36m"
case blanc = "\u{001B}[0;37m"
}


class Cellule{
	var valeur: Int = 0

	init(){
	}


	func dessineCellule() { 

		switch valeur { 
			case let x where x >= 2 && x <= 16:   
			        print(Couleurs.cyan.rawValue + "|\t\(valeur)\t|" + Couleurs.blanc.rawValue, terminator:"") 
			case let x where x >= 32 && x <= 256:             
				print(Couleurs.vert.rawValue + "|\t\(valeur)\t|" + Couleurs.blanc.rawValue, terminator:"") 
			case let x where x >= 512 && x < 2048:             
				print(Couleurs.jaune.rawValue + "|\t\(valeur)\t|" + Couleurs.blanc.rawValue, terminator:"") 
			case let x where x >= 2048:             
				print(Couleurs.rouge.rawValue + "|\t\(valeur)\t|" + Couleurs.blanc.rawValue, terminator:"") 
			default:             
				print(Couleurs.blanc.rawValue + "|\t  \t|", terminator:"")         
		}     
	}
}
