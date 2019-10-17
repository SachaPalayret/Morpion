    # Class Player to choose his name and his colors/mark/jeton
class Player

    attr_accessor :name, :mark

    # Initialise la classe Player avec des valeurs de bases

    def initialize (name, mark, board)
        @name = name
        @mark = mark
        @board = board
    end

    # Permet mettre à jour les emplacements déterminés par le Gamer

    def move(cell)
        @board.updates_cells(cell, self.mark)
    end

    # Déf des combinaisons GAGNANTES
    # permet de faire une boucle sur toutes les combinaisons gagnantes
    # et de s'assurer que la @color est identique

    def winner?
        wins = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8],
                [0, 4, 8], [2, 4, 6]]
        wins.each do |win|
            values = [cells[win[0]], cells[win[1]], cells[win[2]]]
            return true if values.include?(self.mark.to_s) &&
            ((values[0] == values[1]) && (values[1] == values[2]))
        end
        false
    end

    private 
    # Permet de lier les cellules à la class Player
    def cells 
        @board.cells
    end

end