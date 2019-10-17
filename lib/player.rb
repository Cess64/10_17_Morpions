require "pry"                    



class Player              # class méthodes et options correspondant aux joueurs "fictif"
	attr_accessor :name, :symbol

  def initialize(name, symbol)    # initialisation U!t avec un nuom et un symbole, choisit via le app.rb
    @name = name
    @symbol = symbol

  end

end