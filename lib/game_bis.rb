require "pry" 

positions = Array.new # Comme il n'y a que 9 cases à remplir, je les stocke dans un array.

class Game    # 
	attr_accessor :positions, :name

	 def initialize(name, player1, player2)   # On lance la partie, d'office on crée un plateau, et les neuf cases sont "vides"

	 	@name = name
	 	@player1 = player1
	 	@player2 = player2
	 	@positions = Array[" "," "," "," "," "," "," "," "," "] # @positions[0..8] ==> " "
	 end

	 def rules

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
			gets
	 end

	 def visual_game(positions)  # On affiche le plateau actualisé
	 	puts "                1   2   3  "
	 	puts "               ___ ___ ___ "
		puts "              |   |   |   |"
		puts "           A  | #{@positions[0]} | #{@positions[1]} | #{@positions[2]} |"
		puts "              |___|___|___|"
		puts "              |   |   |   |"
		puts "           B  | #{@positions[3]} | #{@positions[4]} | #{@positions[5]} |"
		puts "              |___|___|___|"
		puts "              |   |   |   |"
		puts "           C  | #{@positions[6]} | #{@positions[7]} | #{@positions[8]} |"
		puts "              |___|___|___|"

	 end

	 def menu(player)         # On affiche les différents choix qui se propose au joueur
    	puts "                                                                             "  
    	puts "         Senior #{player.name},                                              "   
    	puts " on a pas la vie devant nous hein ? Je te rappelle que pendant que tu te branles, ils éborgnent des manifestants !!"
    	puts " Alors maintenant, il s'agirait d'agir...Qu'est-ce qu'on fait ?? "
    	puts "> tape A1, si tu veux placer ton gros symbole en A1"
    	puts "> tape B1, si tu veux placer ton enooooorme symbole en B1"   #jusque là ça va....
    	puts "> t'as compris !!"

     end

     def user_check(action)           # On vérifie que le rigolo n'ait pas décidé de rigoler...
     
       while  action != "A1" && action != "A2" && action != "A3" && action != "B1" && action != "B2" && action !="B3" && action !="C1" && action !="C2" && action != "C3"

   	 		puts "C'est ton doigt qu'a ripé ou t'es juste très drôle ??!" 
	 		print"> "
	 		action = gets.chomp.to_s
	 			if @positions.include? action && @positions[action] != " " then
					puts "Cette fois c'est à toi que je parle, t'as un ami-sphère qu'a pas l'air bien fini...tu fais un effort por fa ?" 
	 				print"> "
	 				action = gets.chomp.to_s end
	   end
	 	return action
     end

	 def menu_choice(action, player)  # On récupère la saisie du joueur (une fois nétoyée) et on l'enregistre

		@positions[action] = player.symbol    
     end

	 def party_still_going? # Vérifie à chaque coup que la partie n'est pas déjà gagné par l'un des joueurs



	 end

end