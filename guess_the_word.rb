def play
  random_word = ["bless", "scruffball", "skillcrush"].sample
  puts random_word.tr('a-z', '*')
  user_guess = ''
  guesses = []
  no_of_guesses = 11
  correct_guess = ''
  while (no_of_guesses > 0) && (user_guess != random_word)
    puts "make a guess"
    user_guess = gets.chomp.downcase
    if random_word.include?(user_guess)
      guesses << user_guess
      puts "you guessed a correct letter"
      user_guess = random_word.tr("^#{guesses}", "*")
      puts user_guess
    else
      puts "you lose a point!"
      puts no_of_guesses -= 1
    end
  end

  if user_guess == random_word
    puts "you win"
    puts "your score is: #{no_of_guesses}"
    continue_playing
  else
    puts "you didn't win, but you should try again!"
    continue_playing
  end

  return no_of_guesses

end

def continue_playing
  puts "do you wanna keep playing? Y/N?"
  keep_playing = gets.chomp.downcase
  if keep_playing == "y"
    puts "let's keep going"
    play
  elsif keep_playing == "n"
    puts "See ya later!"
    return false
  else
    puts "I'll take that as a yes!"
    play
  end
end

play
