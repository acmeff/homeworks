class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14) {Array.new}
    place_stones
    @name1, @name2 = name1, name2
    end

  def place_stones
    cups.each_with_index do |cup, i|
      next if i == 6 || i == 13

      4.times {cup << :stone}
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" unless start_pos.between?(1,14)
  end

  def make_move(start_pos, current_player_name)

    start_pos -= 1 if start_pos.between?(1,6)
    num_stones = cups[start_pos].length
    cups[start_pos] = []
    next_cup_idx = start_pos
    while num_stones > 0
      next_cup_idx += 1
      next_cup_idx %= 14
      unless current_player_name == @name1 && next_cup_idx == 13 ||
        current_player_name == @name2 && next_cup_idx == 6
        cups[next_cup_idx] << :stone
        num_stones -= 1
      end

    end
    render
    next_turn(next_cup_idx)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
    case
    when ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    when cups[ending_cup_idx].count == 1
      :switch
    when cups[ending_cup_idx].count > 0
      ending_cup_idx
    end


  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    cups[0..5].all? {|cup| cup.empty?} || cups[7..12].all? {|cup| cup.empty?}
  end

  def winner
    if cups[6] == cups[13]
      :draw
    elsif cups[6].size > cups[13].size
      @name1
    else
      @name2
    end
  end
end
