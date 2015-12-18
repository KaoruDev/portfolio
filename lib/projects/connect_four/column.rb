module Projects
  class ConnectFour
    class Column

      def initialize(number=0)
        @number = number
        @spaces = Array.new(ConnectFour::NUM_ROWS, 0)
        @next_space = 5
      end

      def piece_at(row)
        @spaces[row]
      end

      def add_piece(piece)
        return if filled?
        @spaces[@next_space] = piece
        @next_space -= 1
      end

      def filled?
        @next_space < 0
      end

    end
  end
end
