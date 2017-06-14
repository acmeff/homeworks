require_relative 'p05_hash_map'

def can_string_be_palindrome?(string)
  odds = []
  tracker = HashMap.new(8)
  string.chars.each do |ch|
    if tracker.include?(ch)
      tracker[ch] += 1
    else
      tracker[ch] = 1
    end
  end

  tracker.each do |k, v|
    odds << k if v.odd?
  end

  return odds.length == 1

end
