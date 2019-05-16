require_relative "transfer.rb"

class BankAccount
  attr_accessor :balance, :status
  attr_reader :name

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit(amount)
    self.balance += amount
  end

  def display_balance
    "Your balance is $#{@balance}."
  end

  def valid?
    if @balance > 0 && @status == "open"
      true
    else
      false
    end
  end

  def close_account
    @status = "closed"
  end
end

# avi = BankAccount.new("Avi")
# amanda = BankAccount.new("Amanda")
# transfer = Transfer.new(amanda,avi,50)
# bad_transfer = Transfer.new(amanda, avi, 4000)
# bad_transfer.execute_transaction
