class Transfer
  # your code here
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender, @receiver, @amount = sender, receiver, amount
    @status = "pending"
  end

  def valid?
    @sender.valid? && @receiver.valid? ? true : false
  end

  def execute_transaction
    if @status == "pending" && @sender.balance > amount
      @sender.deposit(-@amount)
      @receiver.deposit(@amount)
      @status = "complete"
    elsif @sender.balance < amount
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      @sender.deposit(@amount)
      @receiver.deposit(-@amount)
      @status = "reversed"
    end
  end

end
