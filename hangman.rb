word = File.readlines('words.txt').sample
$word_array = word.split('')
$picked_letters = []
$mistakes = 0
$art_files = Dir.entries('art')
$art_files.shift
$art_files.shift

def render_art(file)
  file = "art/#{file}"
  read_data = File.open(file).read
  puts read_data
end

def underscore_array(array)
  output = ''
  (0..array.length).each do |i|
    output += '_'
  end
  output
end

def word_input
  input = gets.chomp
  if (/\b[a-zA-Z]\b/).match(input)
    input
  elsif $picked_letters.include? input
    puts 'Letter has been already picked'
    word_input
  else
    puts 'Please write a single letter'
    word_input
  end
end

def add_letter(input)
  $picked_letters.push(input)
end

def hangman
  render_art($art_files.at($mistakes))
  to_be_filled = underscore_array($word_array)
  puts 'Hangman'
  puts to_be_filled
  puts 'Insert A Single Letter:'
  add_letter(word_input)
end

hangman