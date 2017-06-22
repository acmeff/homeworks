class DynamicProgramming
  def initialize
    @blair_cache = {1 => 1, 2 => 2}
    @frog_cache = {1 => 1, 2 => 2, 3 => 4}
  end

  def blair_nums(n)
    return @blair_cache[n] unless @blair_cache[n].nil?

    ans = blair_nums(n-1) + blair_nums(n-2) + (n*2-1)
    @blair_cache[n] = ans
    ans
  end

  def frog_hops(n)
    cache = frog_cache_builder(n)
    cache[n]
  end

  def frog_cache_builder(n)
    cache = {1 => [[1]], 2 => [[1,1],[2]], 3 => [[1, 1, 1], [1, 2], [2, 1], [3]]}
    return cache if (1..3).include?(n)

    (4..n).each do |num|
      cache[num] = num
    end
    cache
  end

  def frog_hops_top_down(n)
    return @frog_cache[n] unless @frog_cache[n].nil?

    ans = frog_hops_top_down(n-1) + frog_hops_top_down(n-2) + frog_hops_top_down(n-2)
    @frog_cache[n] = ans
    ans
  end

  def super_frog_hops(n, k)

  end

  def make_change(amt, coins)
    return [] if amt == 0
    return nil if coins.empty?
    return nil if amt < coins.first

    best_answer = nil

    coins.each_with_index do |coin, i|
      prev_answer = make_change(amt - coin, coins[0...-1])

      next if prev_answer.nil?

      current_answer = prev_answer << coin

      if best_answer.nil? || best_answer.length > current_answer.length
        best_answer = current_answer
      end
    end
    best_answer
  end

  def maze_solver(maze, start_pos, end_pos, seen = [])
    return [start_pos] if maze[start_pos[0]][start_pos[1]] == 'F'

    moves = [[start_pos[0] + 1, start_pos[1]],
            [start_pos[0] - 1, start_pos[1]],
            [start_pos[0], start_pos[1] + 1],
            [start_pos[0], start_pos[1] - 1]]

    best_path = nil
    seen << start_pos

    moves.each do |move|
      if move[0].between?(0, maze.length-1) && move[1].between?(0, maze[0].length-1) && maze[move[0]][move[1]] != 'X' && !seen.include?(move)

        path = maze_solver(maze, move, end_pos, seen)
        
        unless path.nil?
          path.unshift(start_pos)
          best_path = path if best_path.nil? || best_path.length > path.length
        end
      end
    end
    best_path

  end
end
