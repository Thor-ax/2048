import Foundation


class GestionDuJeu{

	init(){
	}

	func DeroulementDuJeu(){
		print("Choisissez la taille de votre grille de jeu :")
		let mouvement = readLine()
		let z = Int(mouvement!)
		let a:jeu = jeu(z!, 0)
		var x:Int = a.score
		var s1:String = String(x)
		x = a.score
		s1 = String(x)
		print("Votre score est de :" + " " + s1)
		print("")
		a.AjoutCase();
		a.AjoutCase();
		while(a.JeuPasTermine()){
			x = a.score
			s1 = String(x)
			print("Votre score est de :" + " " + s1)
			a.affichageCellules()
			a.mouvement()
			a.AjoutCase();
			print("")
		}
		x = a.score
		s1 = String(x)
		a.affichageCellules()
		print("Jeu terminé ! Votre score est de :" + s1)
	}

}
