import 'package:dart_bank/enums/account_type.dart';
import 'package:dart_bank/models/account.dart';
import 'package:dart_bank/models/simple_account.dart';

class PremiumAccount extends SimpleAccount implements Account {
  double cashBack;

  PremiumAccount(
    super.name,
    super.number,
    super.balance, {
    this.cashBack = 5.0,
  });

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
    return cashBack;
  }

  @override
  String getInfo() {
    // TODO: implement getInfo
    throw UnimplementedError();
  }

  @override
  AccountType getType() {
    return AccountType.premium;
  }

  @override
  void removeBalance(double value) {
    double cashBackValue = value * (cashBack / 100);
    balance -= value;
    balance += cashBackValue;
  }
}
