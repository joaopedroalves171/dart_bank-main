import 'package:dart_bank/enums/account_type.dart';

abstract class Account {
  double getBalance();
  void addBalance(double value);
  void removeBalance(double value);
  String getInfo();
  AccountType getType();
  double getCashBack();
}
