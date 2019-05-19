class BankAccount

attr_accessor :balance, :status
attr_reader :name

@@all=[]

def initialize(name)
  @name, @balance, @status = name, 1000, "open"
  @@all<<self
end

def deposit(money)
@balance+=money

end

def display_balance
   "Your balance is $#{balance}."
end

def valid?
 if status==="open" && balance>0
    return true
  else
    false
 end
end

def close_account
  self.status="closed"

end

end
