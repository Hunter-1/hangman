word = File.readlines('words.txt').sample
art_files = Dir.entries('art')
art_files.shift
art_files.shift
$complete = false
$word_array = word.split('')
puts $word_array.length
$picked_letters = []
$mistakes = 0

def render_art(file)
  file = "art/#{file}"
  read_data = File.open(file).read
  puts read_data
end

def underscore_array
  $complete = true
  output = ''
  (0..$word_array.length-2).each do |i|
    letter = $word_array[i]
    if $picked_letters.include? letter
      output += letter
    else
      output += "_"
      $complete = false
    end
  end
  output
end

def word_input
  input = gets.chomp
  if $picked_letters.include? input
    puts 'Letter has been already picked'
    word_input
  elsif (/\b[a-zA-Z]\b/).match(input)
    input.downcase
  else
    puts 'Please write a single letter'
    word_input
  end
end

def add_letter(input)
  unless $picked_letters.include? input
    $picked_letters.push(input)
    unless $word_array.include? input
      $mistakes += 1
    end
  end

end

def hangman (art_files)
  if !($mistakes == art_files.length)
    render_art(art_files.at($mistakes))
    puts 'Hangman'
    puts underscore_array
    if $complete
      puts "You Win"
      exit(1)
    end
    if $mistakes + 1 == art_files.length
      puts 'Last Chance'
    end
    puts 'Insert A Single Letter:'
    add_letter(word_input)
    hangman(art_files)
  else
    puts 'You Lose'
  end
end

hangman(art_files)