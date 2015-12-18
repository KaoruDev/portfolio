module Projects
  class ConnectFour
    NUM_COLUMNS = 7
    NUM_ROWS = 6
    NUM_TO_WIN = 4

    WINNING_COMBINATIONS = Array.new

    # VERTICAL WINS ==============================
    (NUM_COLUMNS).times do |column|
      (0..(NUM_ROWS - NUM_TO_WIN)).each do |edge|
        combo = []
        (edge..(edge + NUM_TO_WIN - 1)).each do |row|
          combo << [column, row]
        end
        WINNING_COMBINATIONS << combo
      end
    end

    # HORIZONTAL WINS ==============================
    (NUM_ROWS).times do |row|
      (0..(NUM_COLUMNS - NUM_TO_WIN)).each do |edge|
        combo = []
        (edge..(edge + NUM_TO_WIN - 1)).each do |column|
          combo << [column, row]
        end
        WINNING_COMBINATIONS << combo
      end
    end

    # FORWARD (/) DIAGONAL WINS ==============================

    (NUM_TO_WIN - 1).times do |edge|
      ((NUM_TO_WIN - 1)...NUM_COLUMNS).each do |column|
        combo = []
        (edge...(edge + NUM_TO_WIN)).each_with_index do |row, idx|
          combo << [column - idx, row]
        end
        WINNING_COMBINATIONS << combo
      end
    end

    # BACKWARD (\) DIAGONAL WINS ==============================

    (0..(NUM_COLUMNS - NUM_TO_WIN)).each do |column|
      (NUM_TO_WIN - 1).times do |row|
        combo = []
        4.times do |edge|
          combo << [column + edge, row + edge]
        end
        WINNING_COMBINATIONS << combo
      end
    end

    (0...NUM_TO_WIN).each do |edge|
    end
  end
end
