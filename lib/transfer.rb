class Transfer
  # your code here

  attr_accessor :receiver,:sender,:status, :amount

  def initialize(sender, receiver, amount)
    @status="pending"
    @sender, @receiver,@amount =sender, receiver,amount
  end

  def valid?
    if @sender.valid? && @receiver.valid?
      true
    else
      false
    end
  end
  def execute_transaction
    if sender.balance>=@amount &&self.status=="pending"
      receiver.balance+=@amount
      sender.balance-=@amount
      self.status= "complete"
    else
      self.status="rejected"
      "Transaction rejected. Please check your account balance."
end
end
def reverse_transfer
if status=="complete"
  receiver.balance-=@amount
  sender.balance+=@amount
self.status="reversed"
end

end
end
