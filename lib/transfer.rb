require 'pry'
class Transfer
  attr_accessor :transfer, :status, :sender, :receiver, :amount

  def initialize(sender, receiver, amount)
    @sender, @receiver, @amount = sender, receiver, amount
    @status = "pending"
  end

  def valid?
    @sender.valid? == true && @receiver.valid? == true
  end

  def execute_transaction
    if sender.balance >= @amount && @status == "pending"
      receiver.deposit(amount)
      sender.deposit(-amount)
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      receiver.deposit(-amount)
      sender.deposit(amount)
      @status = "reversed"
    end
  end


end
