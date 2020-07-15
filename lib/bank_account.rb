class BankAccount
  attr_accessor :balance, :status
  attr_reader :name

  @@all = []

  def initialize(name)
    @name = name
    @balance = 1000
    @status = 'open'
    @@all << self
  end

  def deposit(deposit)
    @balance += deposit
  end

  def display_balance
    "Your balance is $#{@balance}."
  end

  def valid?
    self.status == 'open' && @balance > 0
  end

  def close_account
    self.status = 'closed'
  end
end

# chris = BankAccount.new('Chris')
# yana = BankAccount.new('Yana')
# transfer = Transfer.new("Chris", "Yana", 2500)
# @@all = [["Chris", 1000, 'open'], ["Yana", 100] ]
