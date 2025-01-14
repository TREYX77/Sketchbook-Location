class BankAccount {
  String accountNumber;
  float balance;
  String owner;
  

  BankAccount(String accountNumber, String owner, float initialBalance) {
    this.accountNumber = accountNumber;
    this.owner = owner;
    this.balance = initialBalance;
  }
  
  void deposit(float amount) {
    if (amount > 0) {
      balance += amount;
      println("€" + amount + " gekregen " + accountNumber + ". Nieuw saldo: €" + balance);
    } else {
      println("Fout:niet genoeg");
    }
  }
  
  void withdraw(float amount) {
    if (amount > 0 && amount <= balance) {
      balance -= amount;
      println("€" + amount + " opgenomen van rekening " + accountNumber + ". Nieuw saldo: €" + balance);
    } else if (amount > balance) {
      println("Fout: niet genoeg");
    } else {
      println("Fout: niet genoeg");
    }
  }
  

  void showBalance() {
    println("Rekeningnummer: " + accountNumber + ", Eigenaar: " + owner + ", Saldo: €" + balance);
  }
}

void setup() {

  BankAccount account = new BankAccount("NL01BANK0123456789", "HELP MIJJJJJJ", 9999999.0);
  
  account.showBalance();
  account.deposit(69.0);
  account.withdraw(690.0);
  account.withdraw(6969.0);
  account.showBalance();
}

//yt filmpjes redden mij
