import 'package:dart_bank/enums/account_type.dart';
import 'package:dart_bank/models/account.dart';

class SimpleAccount implements Account {
  String name;
  int number;
  double balance;

  SimpleAccount(this.name, this.number, this.balance);

  @override
  void addBalance(double value) {
    balance += value;
  }

  @override
  double getBalance() {
    return balance;
  }

  @override
  double getCashBack() {
    return 0.0;
  }

  @override
  String getInfo() {
    // TODO: implement getInfo
    throw UnimplementedError();
  }

  @override
  AccountType getType() {
    return AccountType.simple;
  }

  @override
  void removeBalance(double value) {
    balance -= value;
  }
}
