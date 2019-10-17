    # Cette classe permet d'initialiser le jeu et 
    #de le lancer avec des valeurs de base
class Game
    def initialize
        @board = Board.new
        @current_player = ""
        @winner = false
        @turn = 0
    end

    # Meth permettant de lancer le jeu et de démarrer la partie
    # et de déterminer l'issue de la partie. On crée de nouveaux
    #joueurs avec des noms récupérés de la Meth 'get_names'

    def start_game
        names = get_names
        @player1 = Player.new(names[0], :X, @board)
        @player2 = Player.new(names[1], :O, @board)
        @current_player = @player1
        @board.show_board
        turn until @winner || @turn == 9
        if @winner
            puts "#{@winner.name} wins ! "
        else
            puts "Draw ! "
        end
    end

    private

    # Le jouer peut entrer un nombre compris entre 1 et 9, 
    # si le nombre n'est pas compris dans cet intervalle,
    # un message s'affiche demandant de redonner une valeur.
    def turn
        puts "#{@current_player.name}\'s turn. Choose your cell (1-9)" 
        choice = gets.chomp.to_i
        if choice > 9 || choice < 1
            puts "Warning : number must be between 1 and 9"
        elsif @current_player.move(choice) != false
        @winner = @current_player if @current_player.winner?
        @turn += 1
        switch_player
        end
    end

    # Méth permettant de mettre en place les changements de joueur
def switch_player
    @current_player = @current_player == @player1 ? @player2 : @player1
end

    # Méth permettant d'obtenir le nom des joueurs, on utilise 'gest.chomp'
def get_names 
    puts "Les joueurs inscrivent tour à tour leur symbole sur une grille\
qui n'a pas de limites ou qui n'a que celles du papier sur lequel on joue.\
Le premier qui parvient à aligner cinq de ses symboles horizontalement,\
verticalement ou en diagonale gagne un point.

Le morpion donne un avantage assez important à celui qui commence.\
Des formes évoluées existent, comme le Gomoku ou la Pente,\
qui ajoutent à la notion d'alignement une notion de prise.\
Le renju prévoit des handicaps pour le joueur qui commence,\
ce qui permet d'équilibrer les chances des deux joueurs.\
Une partie dure environ une minute. "
    puts "Player X name : "
    name1 = gets.chomp
    puts "Player O name : "
    name2 = gets.chomp
    [name1, name2]
end
end
game = Game.new
game.start_game
