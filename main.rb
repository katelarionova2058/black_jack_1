require_relative 'interface'
require_relative 'player'
require_relative 'hand'
require_relative 'deck'

class Main
  def initialize(interface)
    @interface = interface
    interface.get_name
    player = gets.chomp
    @player = Player.new player
    @diller = Player.new ('Diller')
    @deck = Deck.new
    start
  end

  def start
    @interface.play
    new_play
    2.times do
      @deck.create_card
      @diller.hand.cards << @deck.random_card
      @deck.create_card
      @player.hand.cards << @deck.random_card
    end
    bank_change(@player)
    bank_change(@diller)
    @diller.hand.check = @diller.hand.count(@diller.hand.cards)
    @player.hand.check = @player.hand.count(@player.hand.cards)
    choose_turn
	end

    def new_play
      @diller.hand.check = 0
      @diller.hand.cards = []
      @player.hand.check = 0
      @player.hand.cards = []
    end

    def bank_change(player)
      if player.bank > 10
        player.bank -= 10
      else
	interface.game_over
	exit
      end
    end

   def choose_turn
    @interface.choice_menu(@player.hand.cards, @player.hand.check, @player.bank, @diller.bank)
    input = gets.chomp.to_i
    action(input)
  end

  def action(input)
    exit if input.zero?
    open_cards if (@player.hand.cards.size == 3 && @diller.hand.cards.size == 3 )
    get_turn('Dealer') if input == 3
    open_cards if input == 2
    if input == 1
      if @player.hand.cards.size < 3
      	third_card(@player.name)
      else
        @interface.max_cards
	diller_move
      end
    end
  end

  def third_card(name)
    if name == @player.name
      @deck.create_card
      @player.hand.cards << @deck.random_card
      @player.hand.check = @player.hand.count(@player.hand.cards)
      @interface.added_card
      diller_move
    else
      @deck.create_card
      @diller.hand.cards << @deck.random_card
      @diller.hand.check = @diller.hand.count(@diller.hand.cards)
      choose_turn
    end
  end

  def get_turn(name)
    if name.nil?
      choose_turn
    else
      diller_move
    end
  end

  def diller_move
    if @diller.hand.check >= 17
      @interface.dealer_skips
      get_turn(nil)
    else
      @diller.hand.check < 17 || @diller.hand.cards.size < 3
      third_card('Diller')
    end
  end

  def open_cards
    @interface.player_info(@player.name, @player.hand.cards, @player.hand.check)
    @interface.dealer_info(@diller.hand.cards, @diller.hand.check)
    if @diller.hand.check == @player.hand.check
      @interface.draw(@player.bank)
      @diller.bank += 10
      @player.bank += 10
    elsif (@player.hand.check > 21) || (@diller.hand.check > @player.hand.check && @diller.hand.check <= 21)
      @diller.bank += 20
      @interface.you_lost(@player.bank)
    else
      @player.bank += 20
      @interface.you_win(@player.bank)
    end
    @interface.menu(@player.bank)
    choice = gets.chomp.to_i
    if choice == 1
      start
    else
      exit
    end
  end
end

interface = Interface.new
Main.new(interface)
