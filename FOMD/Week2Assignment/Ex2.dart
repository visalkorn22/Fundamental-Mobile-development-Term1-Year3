class BankAccount {
    // TODO
    //​ decided attribute 
    final String _accountOwner;
    double _balance;
    final int _accountNumber;
    

    // constructor 
    BankAccount({
      required String accountOwner,
      required int accountNumber,
       double balance  = 100
      
    }): this._accountOwner = accountOwner,
        this._accountNumber = accountNumber,
        this._balance = balance;

    @override
    String toString(){
      return 'AccountOwer:$_accountOwner,AccountNumber:$_accountNumber,Balance:$_balance';
    }

    // getter 
    String get accountOwner => _accountOwner;
    int get accountNumber =>_accountNumber;
    double get balance =>_balance;

    // Q2: Implement the following methods
     double Balance(){
      return _balance;

     }
     // withdraw 
     void withdraw(double amount){
      if(amount<=0){
        throw Exception('The balance must be greater than 0');
      }else if(_balance - amount <0){
        throw  Exception('Your Balance is smaller than amount you want to withdraw!');

      }else{
        _balance -= amount;
        print('Withdraw Success! Current Balance:\$$_balance');

      }

     }
     // Credit 
     void credit(double amount){
      if(amount <=0){
        throw Exception('The credit amount must be greater than 0');
      }else{
        _balance += amount;
        
        print('Credit Successfull! Current Balance:\$$_balance');
      }
     }

    
  

    
}

class Bank {
    // TODO
    final String _name;
    final Map<int ,BankAccount> accounts ={};

    Bank({
      required String name,
    }): this._name = name;
     void bankDetails(){
      print('Name:$_name');
    }


   // Q4: Implement the following method 
   BankAccount createAccount (int accountId, String accountOwner){
    print('AccountID:$accountId, AccountOwner:$accountOwner');
    // Ensure that the account ID is uniqe
    if(accounts.containsKey(accountId)){
      throw Exception('The account $accountId already exit.');
    }
  
    
    // start account with balance 0.0
    BankAccount  newAccount = BankAccount(accountOwner:accountOwner, accountNumber: accountId, balance:0.0);
    print('Default Balance:');
   
   
   void addAccount(){
     accounts[accountId] = newAccount;

   }
  
    return newAccount;

    

    

    
}
   
   
}
 
void main() {

   Bank myBank = Bank(name: "CADT Bank");
   myBank.bankDetails();
   BankAccount kannikaAccount = myBank.createAccount(100, 'Kannika');
  

   print(kannikaAccount._balance); // Balance: $0
   kannikaAccount.credit(100);
   print('Credit:\$${kannikaAccount._balance}'); // Balance: $100
  kannikaAccount.withdraw(50);
   print('Withdraw:\$${kannikaAccount._balance}'); // Balance: $50

   print('My Firend Account: ');


   BankAccount SomawateyAccount = myBank.createAccount(200,'Somawatey');
   print(SomawateyAccount._balance); // Balance: $0
   SomawateyAccount.credit(200);
   print('Credit:\$${SomawateyAccount._balance}'); // Balance: $100
  SomawateyAccount.withdraw(100);
   print('Withdraw:\$${SomawateyAccount._balance}'); // Balance: $50


   try {
     kannikaAccount.withdraw(75); // This will throw an exception
   } catch (e) {
     print(e); // Output: Insufficient balance for withdrawal!
   }

   try {
     myBank.createAccount(100, 'Honlgy'); // This will throw an exception
   } catch (e) {
     print(e); // Output: Account with ID 100 already exists!
   }
}