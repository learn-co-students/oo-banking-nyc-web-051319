require 'pry'

class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  @@all = []

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    @sender.valid?
    @receiver.valid?
  end

  def execute_transaction
    @sender.balance -= self.amount
    if @sender.valid? == true && @@all.include?(self) == false
      @receiver.balance += self.amount
      @status = "complete"
      @@all << self
    else
      @sender.balance += self.amount
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.execute_transaction
      @receiver.balance -= @@all.last.amount
      @sender.balance += @@all.last.amount
      @@all.tap(&:pop)
      @status = "reversed"
    end
  end
end
