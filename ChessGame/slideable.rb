
module SlideablePiece
    def moves
      result = []
      move_dirs.each do |dir|
        (1..7).to_a.each do |num|
          new_pos = grow_unblocked_moves_in_dir(dir[0] * num, dir[1] * num)
          valid_move?(new_pos) ? result << new_pos : break
        end
      end
      result
    end

    def valid_move?(pos)
      return false unless (0..7).to_a.include?(pos[0]) && (0..7).to_a.include?(pos[1])
      board[pos].is_a?(NullPiece)
    end

    def diagonal_dirs
      [[1,1], [1,-1], [-1,1], [-1,-1]]
    end

    def horizontal_dirs
      [[0,1], [1,0], [0,-1], [-1,0]]
    end

    def grow_unblocked_moves_in_dir(dx, dy)
      result = self.pos.dup
      result[0] += dx
      result[1] += dy
      result
    end
end
