require 'pry'
class Transfer
  # your code here
  attr_accessor :transfer, :status, :sender, :receiver, :amount

  @@all = []

  def initialize(sender, receiver, amount)
    @sender, @receiver, @amount,@status = sender, receiver, amount,'pending'
    @@all << self
  end

  def valid?
    sender.valid?
    receiver.valid?
  end

  def execute_transaction
    if sender.balance >= @amount && self.status == "pending"
      receiver.balance += self.amount
      sender.balance -= self.amount
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      receiver.balance -= self.amount
      sender.balance += self.amount
      self.status = "reversed"
    end
  end

end
