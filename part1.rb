class BankAccount
  @@interest_rate = 1
  @@accounts = []

  def initialize
    @balance = 0
  end

  def balance
    @balance
  end

  def change_balance(number)
    @balance = number
  end


  def deposit(number)
    @balance += number
  end

  def withdraw(number)
    @balance -= number
  end

  def self.create
    new_bank = BankAccount.new
    @@accounts << new_bank
    return new_bank
    new_bank = nil
  end

  def self.total_funds
    @@total_funds = 0
    @@accounts.map do |account|
    @@total_funds += account.balance
    end
    return @@total_funds
  end

  def self.interest_time
    @@accounts.map do |account|
    account.change_balance(account.balance*(1+@@interest_rate.to_f/100))
    end
  end


  def self.accounts
    @@accounts
  end
end

my_account = BankAccount.create
your_account = BankAccount.create
puts my_account.balance # 0
puts BankAccount.total_funds # 0
my_account.deposit(200)
your_account.deposit(1000)
puts my_account.balance # 200
puts your_account.balance # 1000
puts BankAccount.total_funds # 1200
BankAccount.interest_time
# puts BankAccount.total_funds # 1200

puts my_account.balance # 202.0
puts your_account.balance # 1010.0
puts BankAccount.total_funds # 1212.0
my_account.withdraw(50)
puts my_account.balance # 152.0
puts BankAccount.total_funds # 1162.0
