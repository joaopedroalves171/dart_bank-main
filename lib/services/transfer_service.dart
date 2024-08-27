import 'package:dart_bank/models/account.dart';

void transferService(Account origin, Account destination, double value) {
  origin.removeBalance(value);
  destination.addBalance(value);
}
