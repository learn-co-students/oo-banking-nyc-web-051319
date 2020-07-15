require 'pry'

class Transfer
  attr_accessor :sender, :receiver, :amount, :status
  # your code here

  @@all = []

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
    @@all << self
  end

  def valid?
    if sender.valid? && receiver.valid?
      return true
    end
    return false
  end

  def sender_pays(sender, amount)
    new_balance = sender.balance - amount
    sender.balance = new_balance
  end

  def receiver_gets_paid(receiver, amount)
    new_balance = receiver.balance + amount
    receiver.balance = new_balance
  end

  def totally_valid?
    if valid? && @status != "complete"
      return true
    end
    return false
  end

  def execute_transaction
    flag_phrase = "Transaction rejected. Please check your account balance."
    if totally_valid?
      sender_pays(sender, amount)
      receiver_gets_paid(receiver, amount)
      if valid?
        @status = "complete"
      else
        @status = "rejected"
        return flag_phrase
      end
    else
      return flag_phrase
    end
  end

  def reverse_transfer
    if @status == "complete"
      sender_pays(receiver, amount)
      receiver_gets_paid(sender, amount)
      @status = "reversed"
    end
  end
end
