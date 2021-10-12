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
    
    mutating func deposit (diMoney : Int, newBalanc: Int ) {
        let newBalanc = diMoney + balance
        let makeTransctionReport = Transaction(tranID: Int.random(in: 300...100000), tranDate: Date(), tranAmount: diMoney, typeOfTran: .deposit)
        self.customerTransaction.append(makeTransctionReport)
        print ("You successfully deposit amount of : \(newBalanc)")
        
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
    
    
    func LicenseTerms (){
        print (" 1.for the bank to take the form of a local joint stock company \n 2.The founders have the following:\n -Experience and knowledge in the financial sector \n -Appropriate experience and knowledge related to technology \n -Eligibility,Ability and financial solvency to support the establishment of a digital bank \n 3.The applicants should have a team of individuals with expertise in their fields, in order to discuss the relevant aspects of the submitted application.") }
    
    
}



var alrajhi = SaudiBanks(bankName: "Al Rajhi", bankBalancce: 1000)
alrajhi.createNewAccount(customer: CustomerInformation(customName: "Raghad", customID: 1, gender: .Female, balance: 10000))
alrajhi.numOfCustom
alrajhi.customers[0].balance
alrajhi.customers[0].withdraw(moneyDraw: 3000)
alrajhi.customers[0].balance
alrajhi.customers[0].customerTransaction
alrajhi.branches["Medina"] = 22
alrajhi.branches["meca"] = 12
alrajhi.bankBalance = 200000000
//alrajhi.LicenseTerms()











//class AlrajhiBank : SaudiBanks {
//    var branches: Dictionary <String,Int> = ["midena": 10,"meca": 15,"ryidah": 22, "jeddah":25,"Abha":16]
//    }
//
//class AlahliBank : SaudiBanks {
//    var branches: Dictionary <String,Int> = ["midena": 10,"meca": 11,"ryidah": 24, "jeddah":25,"Abha":14]
//    }
//class AlbladBank : SaudiBanks {
//    var branches: Dictionary <String,Int> = ["midena": 20,"meca": 12,"ryidah": 8, "jeddah":11,"Abha":20]
//    }
//class Alarbi : SaudiBanks {
//    var branches: Dictionary <String,Int> = ["midena": 13,"meca": 12,"ryidah": 11, "jeddah":17,"Abha":16]
//    }
//


