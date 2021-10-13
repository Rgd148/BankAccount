import Foundation

enum Gender {
    case Female
    case Male
}

enum TypeOfTransction {
    case withdraw
    case deposit
}


struct Transaction {
    var tranID : Int
    var tranDate: Date
    var tranAmount :Int
    var typeOfTran: TypeOfTransction
}


struct CustomerInformation {
    var customName : String
    var customID : Int
    var gender : Gender
    var customerTransaction: [Transaction] = []
    var balance = 0
    
    
    mutating func withdraw (moneyDraw : Int) {
        if ( moneyDraw <= balance ){
            self.balance -= moneyDraw
            let makeTransctionReport = Transaction(tranID: Int.random(in: 300...100000), tranDate: Date(), tranAmount: moneyDraw, typeOfTran: .withdraw)
            self.customerTransaction.append(makeTransctionReport)
            print ("You successfully withdraw : \(moneyDraw)")
        }
        else if (moneyDraw > balance) {
            print ("We are sorry Your balance is not enough, As your balance is \(balance)") }  }
    
    mutating func deposit (diMoney : Int ) {
        let newBalanc = diMoney + balance
        let makeTransctionReport = Transaction(tranID: Int.random(in: 300...100000), tranDate: Date(), tranAmount: diMoney, typeOfTran: .deposit)
        self.customerTransaction.append(makeTransctionReport)
        print ("You successfully deposit amount of : \(newBalanc)")
        
    }
    
    func showTransaction(){
        for transaction in self.customerTransaction {
            print("TransID: \(transaction.tranID), Type: \(transaction.typeOfTran), \(transaction.tranAmount)")
        }
    }
    
}


protocol BankLicense {
    func LicenseTerms ()
}


class SaudiBanks : BankLicense {
    var branches: Dictionary <String,Int> = [:]
    var customers : [CustomerInformation] = []
    var bankName : String
    var bankBalance = 0
    var numOfCustom : Int = 0
    
    
    
    //    var trans : [Transaction] = []
    
    init (bankName : String,  bankBalancce : Int ) {
        self.bankName  = bankName
        self.bankBalance = bankBalancce
        
    }
    
    func createNewAccount(customer: CustomerInformation) {
        self.customers.append(customer)
        self.numOfCustom += 1
    }
    func showCustomersByGender(gender: Gender) {
        let filterArray = self.customers.filter({$0.gender == gender})
        for customer in filterArray {
            print(customer.customName, customer.gender)
        }
    }
    
    func LicenseTerms (){
        print (" 1.for the bank to take the form of a local joint stock company \n 2.The founders have the following:\n -Experience and knowledge in the financial sector \n -Appropriate experience and knowledge related to technology \n -Eligibility,Ability and financial solvency to support the establishment of a digital bank \n 3.The applicants should have a team of individuals with expertise in their fields, in order to discuss the relevant aspects of the submitted application.") }
    
    
}


//
//var alrajhi = SaudiBanks(bankName: "Al Rajhi", bankBalancce: 1000)
//alrajhi.createNewAccount(customer: CustomerInformation(customName: "Raghad", customID: 1, gender: .Female, balance: 10000))
//alrajhi.numOfCustom
//alrajhi.customers[0].balance
//alrajhi.customers[0].withdraw(moneyDraw: 3000)
//alrajhi.customers[0].withdraw(moneyDraw: 500)
//alrajhi.customers[0].deposit(diMoney: 10000)
//alrajhi.customers[0].balance
//alrajhi.customers[0].customerTransaction
//alrajhi.customers[0].showTransaction()
//alrajhi.showCustomersByGender(gender: .Male)
//alrajhi.branches["Medina"] = 22
//alrajhi.branches["meca"] = 12
//alrajhi.bankBalance = 200000000
//alrajhi.LicenseTerms()
//alrajhi.numOfCustom
//
//
//
//var alahli = SaudiBanks(bankName: "alahli", bankBalancce: 1000000)
//alahli.createNewAccount(customer: CustomerInformation(customName: "Aziz", customID: 1, gender: .Male))
//alahli.customers[0]


