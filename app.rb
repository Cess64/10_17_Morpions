require 'bundler'   # lignes qui appellent les gems du Gemfile.
Bundler.require

require_relative 'lib/game'   # lignes qui appellent les fichiers contenus dans lib (il n'y en a que deux, pas besoin de changer de manip)
require_relative 'lib/player'


	players = Array.new       # l'array avec les deux players
system 'clear'   # faute de lui clearer le cerveau, je lui clear au moins l'écran...le message n'en sera que plus clair
	    puts "============= L'instant Culture G(spot), by Cess64 ================================================================================"
	    puts "                                                                                                                                   "
        puts "===== Alors que l’opinion publique s’émeut de la situation précaire du panda géant ou du tigre de Sibérie, personne ne pleure sur la"
        puts "quasi-disparition de Pthirus pubis, mieux connu sous le nom de «morpion». Depuis une dizaine d’années, les médecins ont remarqué une"
        puts "baisse importante des effectifs de cet insecte  suceur de sang qui élit domicile dans les poils pubiens  des humains. Quelle  est la"
        puts "cause de ce fulgurant déclin?"
        puts " Comme c’est le cas pour la majorité des espèces menacées, il s’agit de la perte d’habitat. En effet, les morpions se raréfient en "
        puts "raison de la mode qui incite femmes et hommes à s’épiler (partiellement ou en totalité) le pubis."
        puts "                                                                                                                                   "
        puts " Pour vous laisser le temps nécessaire à la prise de connaissance de cette affreuse nouvelle, je vous laisse le soin de cliquer sur"
        puts "Entrée pour apprécier la suite ! "              
        puts "                                                                                      Cess64, une quelqu'une qui vous veut du bien."
        gets
        system 'clear'
	    puts "                                                                                                                                   "
	    puts "                                                                                                                                   "
     	puts "Pas que je sois ultra-friande au jambon des tempéraments schyzo... Je me vois néanmoins dans l'obligation de vous demander, pour le "
     	puts "beau jeu..., de scinder cette grosse teté sur vos zépaules, en deux petites teté(s) de tailles équivalentes !"
     	puts "Aussitôt fait, clique sur Entrée !!"
     	gets

     	nouveau_jeu = "Y"                                                                   # ça sert à recommencer une partie si tel est ton désir...petit sacripand !
     	while nouveau_jeu == "Y"
		puts "Quel est ton nom, Ami-shpère Gauche ?"
		print "> "
		nom1 = gets.chomp.to_s                                                              # Obtention du nom du player 1
		puts "Dis moi quel symbole te représente le mieux.... le X ou le O ?"
		print "> "
		symbol1 = gets.chomp.to_s                                                           # Obtention du symbole du player 1
			if symbol1 != "X" && symbol1 != "O"
			then puts "   Je vois qu'on a affaire à un marrant... Qu'il en soit ainsi !" end
		player1 = Player.new(nom1,symbol1)
		players << player1

		puts "Ami-sphère Ultra-gauche, quel est ton nom ?"
		print "> "
		nom2 = gets.chomp.to_s                                                               # Obtention du nom du player 2
			if symbol1 =="X" then symbol2 ="O"
				puts "Tu seras donc représenté par le O !!" 
			player2 = Player.new(nom2,symbol2) end

			if symbol1 =="O" then symbol2 ="X"
				puts "Tu seras donc représenté par le X !!" 
			player2 = Player.new(nom2,symbol2) end

			if symbol1 != "X" && symbol1 != "O"
				then puts "Toi aussi t'as décidé d'être drôle ??! Lâche-toi gros !! Balance ton sein-bol !"
				print "> "
			symbol2 = gets.chomp.to_s end                                                   # Obtention du symbole du player 2

		player2 = Player.new(nom2,symbol2)
        players << player2                                                                  # Je les rentre dans un array qui sera utile pour coder ma boucle


first_game = Game.new("morpion", player1, player2)                                          # Création d'un Game !

puts "Un petit coup sur Entrée, ça va bien se passer !"
gets
system 'clear'
first_game.rules                                                                            # Présentation des règles

n=0                                        # C'est pour ma boucle... j'ai fait ça pour que la partie s'arrête si personne n'a gagné !
action_array = Array.new                                                                    # Je fabrique une array "action" ce qui me servira lorsque le 
                                                                                            # joueur veut se positionner dans une case déjà prise !
while n < 4

	  players.each {|player| 

        first_game.visual_game(@positions)           # 1er : on présente le jeu au moment m au joueur 

	if first_game.positions["A1"] == first_game.positions["A2"] && first_game.positions["A1"] == first_game.positions["A3"] && first_game.positions["A1"] != " " then break end
	if first_game.positions["B1"] == first_game.positions["B2"] && first_game.positions["B1"] == first_game.positions["B3"] && first_game.positions["B1"] != " " then break end
	if first_game.positions["C1"] == first_game.positions["C2"] && first_game.positions["C1"] == first_game.positions["C3"] && first_game.positions["C1"] != " " then break end
	if first_game.positions["A1"] == first_game.positions["B1"] && first_game.positions["A1"] == first_game.positions["C1"] && first_game.positions["A1"] != " " then break end
	if first_game.positions["A2"] == first_game.positions["B2"] && first_game.positions["A2"] == first_game.positions["C2"] && first_game.positions["A2"] != " " then break end
	if first_game.positions["A3"] == first_game.positions["B3"] && first_game.positions["A3"] == first_game.positions["C3"] && first_game.positions["A3"] != " " then break end
	if first_game.positions["A1"] == first_game.positions["B2"] && first_game.positions["A1"] == first_game.positions["C3"] && first_game.positions["A1"] != " " then break end
	if first_game.positions["A3"] == first_game.positions["B2"] && first_game.positions["A3"] == first_game.positions["C1"] && first_game.positions["A3"] != " " then break end

        first_game.menu(player)                     # 2eme : on lui propose, et lui explique comment jouer
              
        action = gets.chomp.to_s                    # 3eme : on récupère sa réponse

        if action_array.include? action             # 4eme : on vérifie qu'il s'agit d'une case jouable
        	then puts "Seriously, il y en a qui sont passés en God mode, et qui ont pas le temps pour ces conneries...!"
                 print "> "
                action = gets.chomp.to_s end        # ...... auquel cas, on lui demande de re-choisir, sans politesse, je te l'accorde !

        action_array << action                      # 5eme : on stocke l'info pour cette case qui ne sera plus disponible

        first_game.user_check(action)               # 6eme : ça c'est pour les réponses type DD (même si j'aime bien au DD !!)

        first_game.menu_choice(action, player)}     # 7eme : on tient compte de sa réponse

   n+=1                                             # 8eme : on incrémente n pour passer à l'étape suivante
   if n > 4 then     
    puts ""
    puts ""                                         
   	puts ""
   	puts "   Voila qui témoigne d'un beau partage d'Ami-sphère cérébraux. Toutes mes félicitations, vous avez Gagné/Perdu ensemble !" end
end


first_game.end                                     # petit affichage de fin

	   puts ""
       puts ""  
       puts " WANNA PLAY MORE MORE-PIONS !!? Y or N ?!"

       nouveau_jeu = gets.chomp

     end

