class Transfer
  attr_accessor :receiver, :sender, :status, :amount
  attr_reader :name

  @@all = []

def initialize(sender, receiver, amount) #put it in the correct order bc it'll be in ref to spec
  @name = name
  @status = 'pending'
  @sender = sender
  @receiver = receiver
  @amount = amount

  @@all << self
end

def valid?
  sender.valid? #returns true or false
  receiver.valid?  #returns true or false
#we're testing status & balance from bank account -- if status is open and balance is 0 = true ** the info will be sent back to transfer
end

def self.all
  @@all
end

def execute_transaction
    if sender.balance >= @amount && @status == "pending"
      self.status = "complete"
        receiver.balance += self.amount
          sender.balance -= self.amount
        else
          self.status = "rejected"
          "Transaction rejected. Please check your account balance."

        end
      end


#use @ more

    # if self.amount > 0 #bc transfer doesnt have balance, it has amount -- so amount is  the amount we're sending eachother -- so if it's greater than 0 its successful
    #
    #       self.status = 'complete'
    #         else
    #           puts "Transaction rejected. Please check your account balance."
    #         end



  # if sender.balance = @balance
  # 'complete'
  #   else receiver.balance =
  #   'rejected'
  #

  def reverse_transfer
    if self.status == "complete"
      receiver.balance -= self.amount
      sender.balance += self.amount #reversing transfer so getting money back into account.
      self.status = "reversed"

  end
end

end
