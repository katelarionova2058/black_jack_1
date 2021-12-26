class Hand
	attr_accessor :cards, :check

  def initialize
    @cards = []
    @check = 0
  end

  def count(cards)
    @cards = cards
    @check = 0
    @cards.each do |card|
      @check += 10 if card.value =~ /J|Q|K/
      @check += 1 if (@check + 11) > 21 && card.value =~ /A/
      @check += 11 if (@check + 11) <= 21 && card.value =~ /A/
      @check += card.value.to_i if card.value =~ /1|2|3|4|5|6|7|8|9|10/
    end
    @check
  end
end