class Card
  attr_reader :rank, :suit
  include Comparable

  VALUES = { 'Jack' => 11, 'Queen' => 12, 'King' => 13, 'Ace' => 14 }

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def to_s
    "#{rank} of #{suit}"
  end

  def value
    VALUES.fetch(@rank, @rank)
  end

  def <=>(other_card)
    value <=> other_card.value
  end
end

class Deck
  RANKS = (2..10).to_a + %w(Jack Queen King Ace).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze
  
  def initialize
    create_deck
  end
  
  def draw
    reset if @cards.empty?
    @cards.shuffle!.pop
  end
  
  def reset
    create_deck
  end
  
  def create_deck
    @cards = []
    RANKS.each do |rank|
      SUITS.each do |suit|
        @cards.push(Card.new(rank, suit))
      end
    end
  end
  
end

deck = Deck.new
drawn = []
52.times { drawn << deck.draw }
p drawn
puts drawn.count { |card| card.rank == 5 } == 4
puts drawn.count { |card| card.suit == 'Hearts' } == 13

drawn2 = []
52.times { drawn2 << deck.draw }
puts drawn != drawn2 # Almost always.