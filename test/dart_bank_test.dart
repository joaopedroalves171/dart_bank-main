import 'package:dart_bank/models/premium_account.dart';
import 'package:dart_bank/models/simple_account.dart';
import 'package:dart_bank/services/transfer_service.dart';
import 'package:test/test.dart';
import 'package:dart_bank/models/account.dart';

void main() {
  group('transferService', () {
    late Account account1;
    late Account account2;

    setUp(() {
      account1 = SimpleAccount('Diego', 1001, 1000.0);
      account2 = PremiumAccount(
        'Arthur',
        1002,
        500.0,
        cashBack: 10.0,
      );
    });

    test('should transfer money from one simple account to premium account', () {
      transferService(account1, account2, 200.0);

      expect(account1.getBalance(), 800.0);
      expect(account2.getBalance(), 700.0);
    });

    test('Não transferir para contas iguais', () {
      expect(() => transferService(account1, account1, 200.0), throwsException);
    });

    test('Não transferir valor maior que o saldo da conta de origem', () {
      expect(() => transferService(account1, account2, 2000.0), throwsException);
    });

    test('O valor transferido nao pode ser igual a zero ou número negativo', () {
      expect(() => transferService(account1, account2, 0.0), throwsException);
      expect(() => transferService(account1, account2, -100.0), throwsException);
    });
  });
}

void transferService(Account from, Account to, double amount) {
  if (from == to) {
    throw Exception('Não transferir para contas iguais');
  }
  if (amount <= 0) {
    throw Exception('O valor transferido nao pode ser igual a zero');
  }
  if (from.getBalance() < amount) {
    throw Exception('Saldo insuficiente');
  }
  from.withdraw(amount);
  to.deposit(amount);
}
