require_relative 'oystercard'

class Journey
  attr_reader :in_journey, :card

  MIN_BALANCE = 1

  def initialize
    @in_journey = []
    @card = Oystercard.new
  end

  def in_journey?
    true if (in_journey.include?(card))
  end

  def touch_in(card=@card)
    fail 'You have insufficient funds' if (card.balance < MIN_BALANCE)
    in_journey.push(card)
  end

  def touch_out
    in_journey.pop
  end
end
