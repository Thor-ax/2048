import Foundation

class jeu{
	var n:Int = 0
	var grilleJeu:[[Cellule]]
	var score:Int = 0

	init(){
		self.grilleJeu = [[Cellule]](repeating: [Cellule](repeating:Cellule(), count: 4), count:4)
		self.n = 4
		for i in 0..<4{
			for j in 0..<4{
				self.grilleJeu[i][j] = Cellule()
			}
		}
		self.score = 0
	}

	init(_ n:Int, _ score:Int){
		self.n = n
		self.score = score
		self.grilleJeu = [[Cellule]](repeating: [Cellule](repeating:Cellule(), count: n), count:n)
		for i in 0..<self.n{
			for j in 0..<self.n{
				self.grilleJeu[i][j] = Cellule()
			}
		}
	}

	func affichageCellules(){
		let p:Int = self.grilleJeu.count	//Nombre de lignes
		let q:Int = self.grilleJeu[0].count	//Nombre de colonnes
		for i in 0..<p{
			for j in 0..<q{
				let a:Cellule = self.grilleJeu[i][j]

					//a.valeur = Int(truncating:pow(2,i+j) as NSDecimalNumber)		
				a.valeur = self.grilleJeu[i][j].valeur
				
				a.dessineCellule()
				
			}
			print("")
				
		}
	}

	func mouvement(){
		print("Voulez vous jouer vers :")
		print("g")
		print("d")
		print("b")	
		print("h")
		print("")
		var mouvement = readLine()
		print("Vous avez décidé de jouer vers \(mouvement!).")
		while(MouvementIncorrect(mouvement!)){
			print("Mouvement impossible, soit vous avez fait une erreur de frappe, soit le mouvement que vous demandez n'est pas possible.")
			mouvement = readLine()
		}
		if(mouvement == "g"){
			MouvementGauche()
			MouvementGauche()
			MouvementGauche()
			MouvementGauche()
		}
		else if(mouvement == "d"){
			MouvementDroite()
			MouvementDroite()
			MouvementDroite()
			MouvementDroite()
		}
		else if(mouvement == "b"){
			MouvementBas()
			MouvementBas()
			MouvementBas()
			MouvementBas()
		}
		else if(mouvement == "h"){
			MouvementHaut()
			MouvementHaut()
			MouvementHaut()
			MouvementHaut()
		}
		
	}

	func AjoutCase(){
		let k:Int = Int.random(in:0..<11)
		var m:Int = 0
		if(k<=4){
			m = 2
		}
		else{
			m = 4
		}
		var i:Int = Int.random(in:0..<self.n)
		var j:Int = Int.random(in:0..<self.n)
		
		while(self.grilleJeu[i][j].valeur >= 2){			
			i = Int.random(in:0..<self.n)
			j = Int.random(in:0..<self.n)
		}
		self.grilleJeu[i][j].valeur = m	+ self.grilleJeu[i][j].valeur
	}


	func MouvementDroite(){
		let p:Int = self.n
		let q:Int = self.n
		for i in 1..<p+1{
			for j in 2..<q+1{
				if(self.grilleJeu[p-i][q-j].valeur != 0){
					if(self.grilleJeu[p-i][q-(j-1)].valeur == 0){
						self.grilleJeu[p-i][q-(j-1)].valeur += self.grilleJeu[p-i][q-j].valeur
						self.grilleJeu[p-i][q-j].valeur -= self.grilleJeu[p-i][q-j].valeur
					}
					else if(self.grilleJeu[p-i][q-(j-1)].valeur == self.grilleJeu[p-i][q-j].valeur){
						self.grilleJeu[p-i][q-(j-1)].valeur = self.grilleJeu[p-i][q-(j-1)].valeur + self.grilleJeu[p-i][q-(j-1)].valeur
						self.grilleJeu[p-i][q-j].valeur -= self.grilleJeu[p-i][q-j].valeur
						score = score + self.grilleJeu[p-i][q-(j-1)].valeur
					}
				}
			}
		}
		
	}

	
	func MouvementGauche(){
		let p:Int = self.n
		let q:Int = self.n
		for i in 0..<p{
			for j in 1..<q{
				if(self.grilleJeu[i][j].valeur != 0){
					if(self.grilleJeu[i][j-1].valeur == 0){
						self.grilleJeu[i][j-1].valeur += self.grilleJeu[i][j].valeur
						self.grilleJeu[i][j].valeur -= self.grilleJeu[i][j].valeur
					}
					else if(self.grilleJeu[i][j-1].valeur == self.grilleJeu[i][j].valeur){
						self.grilleJeu[i][j-1].valeur = self.grilleJeu[i][j-1].valeur + self.grilleJeu[i][j-1].valeur
						self.grilleJeu[i][j].valeur -= self.grilleJeu[i][j].valeur
						score = score + self.grilleJeu[i][j-1].valeur
					}
				}
			}
		}
		
	}


	func MouvementHaut(){
		let p:Int = self.n
		let q:Int = self.n
		for i in 1..<p{
			for j in 0..<q{
				if(self.grilleJeu[i][j].valeur != 0){
					if(self.grilleJeu[i-1][j].valeur == 0){
						self.grilleJeu[i-1][j].valeur += self.grilleJeu[i][j].valeur
						self.grilleJeu[i][j].valeur -= self.grilleJeu[i][j].valeur
					}
					else if(self.grilleJeu[i-1][j].valeur == self.grilleJeu[i][j].valeur){
						self.grilleJeu[i-1][j].valeur = self.grilleJeu[i-1][j].valeur + self.grilleJeu[i-1][j].valeur
						self.grilleJeu[i][j].valeur -= self.grilleJeu[i][j].valeur
						score = score + self.grilleJeu[i-1][j].valeur
					}
				}
			}
		}
	
	}

	func MouvementBas(){
		let p:Int = self.n
		let q:Int = self.n
		for i in 2..<p+1{
			for j in 1..<q+1{
				if(self.grilleJeu[p-i][q-j].valeur != 0){
					if(self.grilleJeu[p-(i-1)][q-j].valeur == 0){
						self.grilleJeu[p-(i-1)][q-j].valeur += self.grilleJeu[p-i][q-j].valeur
						self.grilleJeu[p-i][q-j].valeur -= self.grilleJeu[p-i][q-j].valeur
					}
					else if(self.grilleJeu[p-(i-1)][q-j].valeur == self.grilleJeu[p-i][q-j].valeur){
						self.grilleJeu[p-(i-1)][q-j].valeur = self.grilleJeu[p-(i-1)][q-j].valeur + self.grilleJeu[p-(i-1)][q-j].valeur
						self.grilleJeu[p-i][q-j].valeur -= self.grilleJeu[p-i][q-j].valeur
						score = score + self.grilleJeu[p-(i-1)][q-j].valeur
					}
				}
			}
		}
	}


	func JeuPasTermine() ->Bool{			// Le jeu est-il terminé ou pas ?
		let p:Int = self.grilleJeu.count	//Nombre de lignes
		let q:Int = self.grilleJeu[0].count	//Nombre de colonnes


		for i in 0..<p{
			for j in 0..<q{
				if(self.grilleJeu[i][j].valeur == 0){
					return true			//-> Une case vide -> Le jeu n'est pas terminé
				}
			}
				
		}
		if(MouvementGauchePossible()){
			return true
		}
		if(MouvementDroitePossible()){
			return true
		}
		if(MouvementHautPossible()){
			return true
		}
		if(MouvementBasPossible()){
			return true
		}
		return false
		
	}

	func MouvementIncorrect(_ s:String) -> Bool{	//Vérifie si la commande entrée est reconnue
		if(s == "g" && MouvementGauchePossible()){
			return false
		}
		else if(s == "d" && MouvementDroitePossible()){
			return false
		}
		else if(s == "b" && MouvementBasPossible()){
			return false
		}
		else if(s == "h" && MouvementHautPossible()){
			return false
		}
		return true
	}

	func MouvementGauchePossible() -> Bool{	//Vérifie si un mouvement vers la gauche encore possible
		let p:Int = self.grilleJeu.count	//Nombre de lignes
		let q:Int = self.grilleJeu[0].count	//Nombre de colonnes
		for i in 0..<p{
			for j in 1..<q{
				if(self.grilleJeu[i][j].valeur != 0){
					if(self.grilleJeu[i][j-1].valeur == 0){
						return true
					}
					else if(self.grilleJeu[i][j-1].valeur == self.grilleJeu[i][j].valeur){
						return true
					}
				}
			}
		}
		return false
		 
	}

	func MouvementDroitePossible() -> Bool{
		let p:Int = self.n
		let q:Int = self.n
		for i in 1..<p+1{
			for j in 2..<q+1{
				if(self.grilleJeu[p-i][q-j].valeur != 0){
					if(self.grilleJeu[p-i][q-(j-1)].valeur == 0){
						return true
					}
					else if(self.grilleJeu[p-i][q-(j-1)].valeur == self.grilleJeu[p-i][q-j].valeur){
						return true
					}
				}
			}
		}
		return false
	}

	func MouvementHautPossible() -> Bool{
		let p:Int = self.n
		let q:Int = self.n
		for i in 1..<p{
			for j in 0..<q{
				if(self.grilleJeu[i][j].valeur != 0){
					if(self.grilleJeu[i-1][j].valeur == 0){
						return true
					}
					else if(self.grilleJeu[i-1][j].valeur == self.grilleJeu[i][j].valeur){
						return true
					}
				}
			}
		}
		return false
	}

	func MouvementBasPossible() -> Bool{
		let p:Int = self.n
		let q:Int = self.n
		for i in 2..<p+1{
			for j in 1..<q+1{
				if(self.grilleJeu[p-i][q-j].valeur != 0){
					if(self.grilleJeu[p-(i-1)][q-j].valeur == 0){
						return true
					}
					else if(self.grilleJeu[p-(i-1)][q-j].valeur == self.grilleJeu[p-i][q-j].valeur){
						return true
					}
				}
			}
		}
		return false
	}


}
		
		
