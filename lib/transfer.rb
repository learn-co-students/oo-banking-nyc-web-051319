#require_relative '/bank_account'

require "pry"

class Transfer
  # your code here

  attr_accessor :sender, :receiver, :amount, :status

  @counter = 0

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    if @sender.valid? == true && @receiver.valid? == true
      true
    else
      false
    end
  end

  def execute_transaction
    if @status == "pending" && self.valid? == true && @sender.balance > @amount
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end

end

#avi = BankAccount.new("Avi")
#amanda = BankAccount.new("Amanda")
#transfer = Transfer.new(amanda, avi, 50)

#binding.pry

#"lol"
