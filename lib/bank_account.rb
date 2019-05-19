class BankAccount
attr_accessor  :balance, :status
attr_reader :name

@@all = []

def initialize(name)
  @name = name
  @balance = 1000
  @status = 'open'

  @@all << self
end

def self.all
  @@all
end

def deposit(deposit_amount)
  @balance += deposit_amount #adding deposit_amount to balance
end

def display_balance
  "Your balance is $#{@balance}."  #doing self.balance is equivalent to this bc @ is indicating the class of BankAccount
end

def valid?
  self.status == "open" && balance > 0
#status is already set to open so confirm that it's set to open & greater than 0
end

def close_account
   self.status = 'closed' #based off spec just set it to close 
end




end
