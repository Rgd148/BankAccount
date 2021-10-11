import UIKit

//
//
//struct Transaction {
//    var customerID : Int
//    var tranID : Int
//    var trandate: Data
//    var tranamount :Int
//    var tranbankReceipient : String
//    var typeOfTran: String
//}

struct CustomerInformation {
   var customName : String
    var customID : Int
    enum Gender {
        case Female
        case Male
    }
//    var customerTransaction: [Transaction]
    var balance = 0
    mutating func withdraw (moneyDraw : Int) {
        if ( moneyDraw <= balance ){
            self.balance -= moneyDraw
            print ("You successfully withdraw : \(moneyDraw)")
            }
        else if (moneyDraw > balance) {
            print ("We are sorry Your balance is not enough, As your balance is \(balance)") }  }
    
    mutating func deposit (diMoney : Int, newBalanc: Int ) {
       let newBalanc = diMoney + balance
            print ("You successfully deposit amount of : \(newBalanc)")
            
    }
    
}


protocol BankLicense {
    func LicenseTerms ()
}


class SaudiBanks : BankLicense {
    
    var bankName : String
    var numOfClinet : Int?
//    var bankBalance = 0
    
//    var transactions: [Transaction]
    var customers : [CustomerInformation] = []
    
    init (bankName : String, numOfClinet : Int) {
        self.bankName  = bankName
        self.numOfClinet = numOfClinet
//        self.balance = balance
    }
    
    func LicenseTerms (){
        print (" 1.for the bank to take the form of a local joint stock company \n 2.The founders have the following:\n -Experience and knowledge in the financial sector \n -Appropriate experience and knowledge related to technology \n -Eligibility,Ability and financial solvency to support the establishment of a digital bank \n 3.The applicants should have a team of individuals with expertise in their fields, in order to discuss the relevant aspects of the submitted application.") }
}

var alrajhi = SaudiBanks(bankName: "Al Rajhi", numOfClinet: 0)
alrajhi.customers.append(CustomerInformation(customName: "Raghad", customID: 1, balance: 10000))
alrajhi.customers[0].balance
alrajhi.customers[0].withdraw(moneyDraw: 5000)
alrajhi.customers[0].balance


extension SaudiBanks {

}



class AlrajhiBank : SaudiBanks {
    var branches: Dictionary <String,Int> = ["midena": 10,"meca": 15,"ryidah": 22, "jeddah":25,"Abha":16]
    }

class AlahliBank : SaudiBanks {
    var branches: Dictionary <String,Int> = ["midena": 10,"meca": 11,"ryidah": 24, "jeddah":25,"Abha":14]
    }
class AlbladBank : SaudiBanks {
    var branches: Dictionary <String,Int> = ["midena": 20,"meca": 12,"ryidah": 8, "jeddah":11,"Abha":20]
    }
class Alarbi : SaudiBanks {
    var branches: Dictionary <String,Int> = ["midena": 13,"meca": 12,"ryidah": 11, "jeddah":17,"Abha":16]
    }



