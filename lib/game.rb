require "pry" 

positions = Hash.new # Comme il n'y a que 9 cases à remplir, je les stocke dans un hash, le symbol servira de value !

class Game    # 
	attr_accessor :positions, :name

	 def initialize(name, player1, player2)   # On lance la partie, d'office on crée un plateau: positions, et les deux players (créés dans le app.rb)

	 	@name = name            # utile dans le app.rb pour pouvoir appeler toutes les fonctions suivantes
	 	@player1 = player1      # créé dans le app.rb
	 	@player2 = player2      # créé dans le app.rb
	 	@positions = Hash["A1"," ","A2"," ","A3"," ","B1"," ","B2"," ","B3"," ","C1"," ","C2"," ","C3"," "] # @positions["A1"] ==> " "
	 end

	 def rules   # un petit affichage juste pour rappeler les règles (et pour moi aussi !)

	 		puts "Voici l'arène, gladiateur. Ton objectif est de positionner 3 symboles alignés, type :"

            puts "               diagonale :                  ou                      ligne :"
            puts "                                                                               "
	 		puts "                1   2   3                                           1   2   3  "
	 		puts "               ___ ___ ___                                         ___ ___ ___ "    
			puts "              |   |   |   |                                       |   |   |   |"
			puts "          A   | O |   |   |                                  A    | X | X | X |"  
			puts "              |___|___|___|                                       |___|___|___|"   
			puts "              |   |   |   |                                       |   |   |   |" 
			puts "          B   |   | O |   |                                  B    |   |   |   |"                             
			puts "              |___|___|___|                                       |___|___|___|" 
			puts "              |   |   |   |                                       |   |   |   |"    
			puts "          C   |   |   | O |                                  C    |   |   |   |"  
			puts "              |___|___|___|                                       |___|___|___|"
			puts "                                                                                   "
			puts "Ok, je suppute que tu as bien saisi les règles, reste plus qu'a bien séparer tes Ami-sphère cérébraux, LET'S GO !!"
	    	puts "Aussitôt sues, clique sur Entrée !!"
    
			gets
	 end

	 def visual_game(positions)  # Pour afficher le plateau actualisé
	 	puts "                1   2   3  "
	 	puts "               ___ ___ ___ "
		puts "              |   |   |   |"
		puts "           A  | #{@positions["A1"]} | #{@positions["A2"]} | #{@positions["A3"]} |"
		puts "              |___|___|___|"
		puts "              |   |   |   |"
		puts "           B  | #{@positions["B1"]} | #{@positions["B2"]} | #{@positions["B3"]} |"
		puts "              |___|___|___|"
		puts "              |   |   |   |"
		puts "           C  | #{@positions["C1"]} | #{@positions["C2"]} | #{@positions["C3"]} |"
		puts "              |___|___|___|"

	 end

	 def menu(player)         # Pour afficher les différents choix qui se propose au joueur
    	puts "                                                                             "  
    	puts "     Senior #{player.name},                                                  "   
    	puts "                                                                             "
    	puts " 	Je ne vais pas y aller par 4 chemins sans issues... Au moment où je te parle, tes potentielles blagues de geek ne sont pas"
    	puts "encore toutes résolues. Et elles ne le seront peut être pas au moment où tu joueras... Commence sérieux, tu joueras les "
    	puts "inspecteurs dans un second temps, i.e. futur (== ture-fu pour les hipsters && - 16 ans !)"
    	puts "                                                                                                   "
    	puts " Alors comment ça va se passer.... "
    	puts "> tape A1, si tu veux placer ton gros symbole en A1"
    	puts "> tape B1, si tu veux placer ton enooooorme symbole en B1"   
    	puts "> tape C1, blablabla t'as compris !!!"
        puts "                                                                             "  
     end

     def user_check(action)           # On vérifie que le rigolo n'ait pas décidé de rigoler...


     
       while  action != "A1" && action != "A2" && action != "A3" && action != "B1" && action != "B2" && action !="B3" && action !="C1" && action !="C2" && action != "C3" && @position[action] != " "

   	 		puts "C'est ton doigt qu'a ripé ou t'es juste très drôle ??!" 
	 		print"> "
	 		action = gets.chomp.to_s

	 	return action
	   end
	 	return action       # je return l'action pour être sur que la fonction menu_choice soit appliquée à un action qui a du sens...
     end

	 def menu_choice(action, player)  # On récupère la saisie du joueur (une fois nétoyée) et on l'enregistre

		@positions[action] = player.symbol    
     end

	 def party_already_done? # était sensé vérifier que la partie ne soit pas déjà finie. Mais ça ne fonctionnait pas, les conditions ont été replacées dans
                             # le app.rb, je l'ai laissé, car même s'il renvoie systématiquement false, il me sert dans la boucle, j'ai pas le temps de faire
	 	victory ="45"        # autrement !
	 	case victory

	 	when @positions["A1"] == @positions["A2"] && @positions["A1"] == @positions["A3"] && @positions["A1"] != " " then return true

	 	when @positions["B1"] == @positions["B2"] && @positions["B1"] == @positions["B3"] && @positions["B1"] != " " then return true

	 	when @positions["C1"] == @positions["C2"] && @positions["C1"] == @positions["C3"] && @positions["C1"] != " " then return true

	 	when @positions["A1"] == @positions["B1"] && @positions["A1"] == @positions["C1"] && @positions["A1"] != " " then return true

	 	when @positions["A2"] == @positions["B2"] && @positions["A2"] == @positions["C2"] && @positions["A2"] != " " then return true

	 	when @positions["A3"] == @positions["B3"] && @positions["A3"] == @positions["C3"] && @positions["A3"] != " " then return true

	 	when @positions["A1"] == @positions["B2"] && @positions["A1"] == @positions["C3"] && @positions["A1"] != " " then return true

	 	when @positions["A3"] == @positions["B2"] && @positions["A3"] == @positions["C1"] && @positions["A3"] != " " then return true

	 	else return false
	 		
	 	end

	 end

	 def end
	 	
    puts "                                                                                                                "  
    puts "                                                                                                                "   
    puts "<==============================================================================================================>"
    puts "          <<<<<<<<<<<<<<>>>>>>>>>>>>>>          GAME OVER            <<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>          "
    puts "<==============================================================================================================>"

	 end

end