require "pry"
module Deck
  SUITS = ['clubs', 'diamonds', 'hearts', 'spades']
  VALUES = {
    'two' => 2,
    'three' => 3,
    'four' => 4,
    'five' => 5,
    'six' => 6,
    'seven' => 7,
    'eight' => 8,
    'nine' => 9,
    'ten' => 10,
    'jack' => 10,
    'queen' => 10,
    'king' => 10,
    'ace' => 11
  }

  attr_reader :deck

  def initialize
    @deck = build
  end

  def build
    SUITS.each_with_object([]) do |suit, collection|
      VALUES.each do |value, points|
        collection << Card.new(value, suit, points)
      end
    end
  end
end

module Displayable
  def display_welcome
    puts "Welcome to #{@game}!"
  end

  def display_play_again
    puts "Let's play again!"
  end

  def display_goodbye
    puts "Thank you for playing #{@game}! See you next time #{@player}!"
  end

  def s_or_no_s
    @points == 1 ? '' : 's'
  end

  def display_final_winner
    if @player.num_to_win?
      puts "You win best of #{Game::WIN}!"
    elsif @computer.num_to_win?
      puts "#{@computer} wins best of #{Game::WIN}!"
    else
      puts "Nobody wins, first player to reach #{Game::WIN} points wins!"
    end
  end

  def display_win
    puts "#{@name} wins the game!"
  end

  def display_names
    puts "You are playing #{@computer} today!"
    puts "Good luck #{@player}!"
  end

  def a_or_an(val)
    ["a", "e", "i", "o", "u"].include?(val.chr) ? "an " : "a "
  end
end

module Interactive
  YES = ['y', 'yes']
  NO = ['n', 'no']
  VALID_ANSWERS = YES + NO

  def handle_rules
    loop do
      display_rules
      break if continue?
      clear_screen
    end
  end

  def continue?
    answer = ''
    loop do
      puts "Got it? ('y'/'n')"
      answer = gets.chomp.downcase.strip
      break if VALID_ANSWERS.include?(answer)
      puts "Invalid answer, please select 'y' or n''"
    end
    YES.include?(answer)
  end

  def clear_screen
    system("clear") || system("cls")
  end

  def pace_game(time)
    Kernel.sleep(time)
  end

  def input_names
    @player.name = choose_player_name
    @computer.name = choose_computer_name
  end

  def choose_player_name
    choice = ''
    loop do
      puts "What's your name?"
      choice = gets.chomp.strip
      break unless invalid_player_name?(choice)
      puts "Invalid input!"
    end
    choice
  end

  def invalid_player_name?(choice)
    choice.empty? || Computer::NAMES.any?(choice)
  end

  def choose_computer_name
    Computer::NAMES.sample
  end

  def play_again?
    answer = ''
    loop do
      puts "Do you want to play another best of #{Game::WIN}? ('y'/'n')"
      answer = gets.chomp.downcase.strip
      break if VALID_ANSWERS.include?(answer)
      puts "Invalid answer, please select 'y' or n'"
    end
    YES.include?(answer)
  end

  def stop_playing?
    answer = ''
    loop do
      puts "Do you want to continue playing? ('y'/'n')"
      answer = gets.chomp.downcase.strip
      break if VALID_ANSWERS.include?(answer)
      puts "Invalid answer, please select 'y' or n''"
    end
    NO.include?(answer)
  end

  def add_point
    @points += 1
  end

  def num_to_win?
    @points == Game::WIN
  end

  def num_points?
    @player.num_to_win? || @computer.num_to_win?
  end

  def handle_screen(time)
    pace_game(time)
    clear_screen
  end
end

class Participant
  attr_reader :hand, :points
  attr_accessor :name

  include Displayable
  include Interactive

  def initialize
    @hand = Hand.new
    @points = 0
  end

  def deal(num)
    num.times do
      hand.cards << deck.sample
      deck.delete(hand.cards.last)
    end
  end

  def moves
    display_hit
    handle_screen(4)
    deal(@deck.cards, Game::HIT_DEAL)
    show_all
    hand.total_points
    hand.handle_bust
  end

  def show_all
    puts "#{name} has #{hand.show_all}"
  end

  def to_s
    name
  end

  def display_hit
    puts "#{@name} hits!"
  end

  def stay
    puts "#{@name} stays!"
    puts "#{@name}'s hand is worth #{@hand.points} points!"
  end

  def display_bust
    puts "#{@name} busted!"
    puts "#{@name}'s hand was worth #{@hand.points} points!"
  end

  def handle_win
    display_win
    add_point
  end

  def display_final_points(other)
    puts "#{@name}'s hand is worth #{@hand.points} points."
    puts "#{other.name}'s hand is worth #{other.hand.points} points."
  end

  def >(other)
    @hand.points > other.hand.points
  end

  def reset_all
    @hand = Hand.new
    @points = 0
  end

  def reset_hand
    @hand = Hand.new
  end

  def display_score
    puts "#{@name} has #{@points} point#{s_or_no_s}."
  end
end

class Player < Participant
  HIT = ['h', 'hit']
  STAY = ['s', 'stay']
  VALID_ANSWERS = HIT + STAY

  def turn
    loop do
      break unless HIT.include?(choice_validation)
      moves
      return display_bust if hand.busted
    end
    stay
  end

  def choice_validation
    choice = ''
    loop do
      puts "Do you want to hit or stay?('h'/'s')"
      choice = gets.chomp.downcase.strip
      break if VALID_ANSWERS.include?(choice)
      puts "Invalid input!"
    end
    choice
  end
end

class Computer < Participant
  MINIMUM = 17
  NAMES = ['Hal', 'C3PO', 'R2D2', 'Marvin']

  def show_one
    puts "#{name} has #{hand.show_one}"
  end

  def turn
    show_all
    loop do
      break if hand.points >= Computer::MINIMUM
      handle_screen(4)
      moves
      return display_bust if hand.busted
    end
    handle_screen(4)
    stay
  end
end

class Hand
  attr_reader :cards, :points, :busted

  def initialize
    @cards = []
    @points = 0
    @busted = false
  end

  def total_points
    max_points = max_sum_points
    if aces?
      num_of_aces.times do
        break if max_points <= Game::MAXIMUM
        max_points -= 10
      end
    end
    @points = max_points
  end

  def max_sum_points
    @cards.reduce(0) { |sum, card| sum + card.points }
  end

  def aces?
    @cards.any? { |card| card.value == 'ace' }
  end

  def num_of_aces
    @cards.count { |card| card.value == 'ace' }
  end

  def show_all(separator = ', ', last = ' and ')
    case @cards.size
    when 2
      @cards.join(last)
    else
      @cards[0..-2].join(separator) + last + @cards[-1].to_s
    end
  end

  def show_one
    @cards.first
  end

  def handle_bust
    @busted = true if @points > Game::MAXIMUM
  end
end

class Card
  attr_reader :value, :points

  include Displayable

  def initialize(value, suit, points)
    @name = a_or_an(value) + value + ' of ' + suit
    @suit = suit
    @value = value
    @points = points
  end

  def to_s
    @name
  end
end

class Game
  INITIAL_DEAL = 2
  HIT_DEAL = 1
  MAXIMUM = 21
  WIN = 5

  include Deck
  include Displayable
  include Interactive

  attr_reader :active_deck

  def initialize
    @game = "Twenty-one"
    @player = Player.new
    @computer = Computer.new
  end

  def play
    display_welcome
    handle_screen(1)
    handle_rules
    clear_screen
    handle_names
    main_game
    display_goodbye
  end

  def display_rules
    puts "The player who scores the closest to 21 wins."
    puts "If you go over 21, you bust!"
    puts "The numbers 2 through 10 are worth their face value."
    puts "The jack, queen, and king are each worth 10."
    puts "The ace can be worth 1 or 11."
    puts "Best of #{WIN} wins the game!"
  end

  def handle_names
    input_names
    clear_screen
    display_names
  end

  def main_game
    loop do
      handle_screen(2)
      binding.pry
      best_of_num
      break unless play_again?
      reset_best_of_num
      display_play_again
    end
  end

  def best_of_num
    loop do
      one_game
      handle_screen(4)
      @player.display_score
      @computer.display_score
      break if num_points? || stop_playing?
      handle_screen(4)
    end
    display_final_winner
  end

  def one_game
    deal_initial_cards
    show_initial_cards
    @player.turn
    handle_screen(4)
    unless @player.hand.busted
      @computer.turn
      handle_screen(4)
    end
    show_final_result
    reset_hands
  end

  def deal_initial_cards
    @player.deal(INITIAL_DEAL)
    @computer.deal(INITIAL_DEAL)
    @player.hand.total_points
    @computer.hand.total_points
  end

  def show_initial_cards
    @player.show_all
    @computer.show_one
  end

  def show_final_result
    if @player.hand.busted
      @computer.handle_win
    elsif @computer.hand.busted
      @player.handle_win
    else
      determine_winner
    end
  end

  def reset_hands
    @deck = Deck.new
    @player.reset_hand
    @computer.reset_hand
  end

  def determine_winner
    @player.display_final_points(@computer)

    if @player > @computer
      @player.handle_win
    elsif @computer > @player
      @computer.handle_win
    else
      puts "It's a tie!"
    end
  end

  def reset_best_of_num
    @deck = Deck.new
    @player.reset_all
    @computer.reset_all
  end
end

Game.new.play
