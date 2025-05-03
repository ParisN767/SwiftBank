struct SwiftBank {
  private let name: String
  private let password: String
  private var balance: Double = 0
  static let depositBonusRate = 0.01

  init(password: String, initialDeposit: Double, name: String) {
    self.password = password
    self.name = name
    firstDeposit(firstDepositAmount: initialDeposit)
  }

  private func isValid(_ enteredPassword: String) -> Bool {
    if enteredPassword == password {
      return true
    } else {
      return false
    }
  }

  private func finalDepositWithBonus(deposit: Double) -> Double {
    return (deposit * SwiftBank.depositBonusRate) + deposit
  }

  mutating func firstDeposit(firstDepositAmount: Double) {
    if firstDepositAmount > 0 {
      if firstDepositAmount >= 1000 {
        let depositWithBonus = finalDepositWithBonus(deposit: firstDepositAmount)

        print("Hello \(name), thank you for choosing Swift Bank! Congratulations on opening your account.")

        print("You’ve made a first deposit of $ \(firstDepositAmount) with a bonus rate of \(SwiftBank.depositBonusRate). The final amount deposited is $ \(depositWithBonus)")

        balance += depositWithBonus
      } else {
        balance += firstDepositAmount

        print("Hello \(name), thank you for choosing Swift Bank! Congratulations on opening your account.")

        print("You’ve just made your first deposit of $ \(firstDepositAmount)")
      }
    } else {
      print("Error: You must deposit more than 0.")
    }
  }

  mutating func makeDeposit(depositAmount: Double) {
    if depositAmount > 0 {
      print("You just made a deposit of $ \(depositAmount)")

      balance += depositAmount
    } else {
      print("Error: You must deposit more than 0.")
    }
  }

  func displayBalance(password: String) {
    if isValid(password) {
      print("Your current balance is $ \(balance)")
    } else {
      print("Error: Invalid password. Cannot retrieve balance.")
      return
    }
  }
  mutating func makeWithdrawal(withdrawalAmount: Double, password: String) {
    if isValid(password) {
      if withdrawalAmount <= balance {
        if withdrawalAmount > 0 {
          balance -= withdrawalAmount
          print("You just made a withdrawal of $ \(withdrawalAmount)")
        } else {
          print("Error: Your withdrawal must be greater than 0")
        }
      } else {
        print("Error: Not enough money in balance to make withdrawal.")
      }
    } else {
      print("Error: Invalid password. Cannot make withdrawal")
      return
    }
  }
  
  private func displayLowBalanceMessage() {
    if balance < 100 {
      print("Alert: Your balance is under $100")
    }
  }
}

// var myAccount = SwiftBank(password: "ParisNaseri", initialDeposit: 100, name: "Paris Naseri")
// myAccount.makeDeposit(depositAmount: 1000)
// myAccount.makeWithdrawal(withdrawalAmount: 200, password: "ParisNaseri")
// myAccount.displayBalance(password: "ParisNaseri")
