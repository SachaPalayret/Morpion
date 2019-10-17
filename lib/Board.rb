    # Class du plateau de jeu 
class Board
    attr_accessor :cells
    # Permet de mettre à jour le tableau en fonction des inputs du joueur
    # Tout en garantissant que la cellule soit vide
    def initialize
        @cells = [
            "1", "2", "3",
            "4", "5", "6",
            "7", "8", "9"
        ]
    end

    # Affichage du corps du tableau (base values + vertical & horizontal lines)
    def updates_cells(number, color)
        if cell_free?(number)
            self.cells[number - 1] = color.to_s
            show_board
        else
            puts "Cell pas vide ! Choisis une autre Cell."
            return false
        end
    end

    # Permet de remplacer les cellules par le signe du joueur en checkant si elles
    # Sont vides, sinon la cellule n'est pas complétée
    def show_board 
        hline = "\u2502"
        vline = "\u2500"
        cross = "\u253C" 
        row1 = " " + self.cells[0..2].join(" #{hline} ")
        row2 = " " + self.cells[3..5].join(" #{hline} ")
        row3 = " " + self.cells[6..8].join(" #{hline} ")
        separator = vline * 3 + cross + vline * 3 + cross + vline * 3
        system("clear")
        puts row1
        puts separator
        puts row2
        puts separator
        puts row3
    end

      private
      # Remplacer les cellules par le signe du joueur en checkant si la case est vide
    def cell_free?(number)
        cell = self.cells[number - 1]
        if cell == "X" ||  cell == "O"
          false
        else
          true
        end
    end

end