import 'dart:io';

void main() {
  const double smallPrice = 5;
  const double mediumPrice = 7;
  const double largePrice = 10;

  bool ordering = true;

  while (ordering) {
    print('\n=== Pizza Order Calculator ===');
    print('Small: \$${smallPrice.toStringAsFixed(2)} USD');
    print('Medium: \$${mediumPrice.toStringAsFixed(2)} USD');
    print('Large: \$${largePrice.toStringAsFixed(2)} USD');

    stdout.write('Enter pizza size (small, medium, large): ');
    String size = stdin.readLineSync()?.toLowerCase().trim() ?? '';

    if (size == 'exit') {
      ordering = false;
      continue;
    }

    stdout.write('Enter quantity: ');
    int? quantity = int.tryParse(stdin.readLineSync() ?? '');

    if (quantity == null || quantity <= 0) {
      print('Invalid quantity. Please enter a positive number.');
      continue;
    }

    double price;

    switch (size) {
      case 'small':
        price = smallPrice;
        break;
      case 'medium':
        price = mediumPrice;
        break;
      case 'large':
        price = largePrice;
        break;
      default:
        print('Invalid pizza size. Please try again.');
        continue;
    }

    double total = price * quantity;

    print('Pizza size: $size');
    print('Quantity: $quantity');
    print('Total payment: \$${total.toStringAsFixed(2)} USD');

    stdout.write('Order again? (yes/no): ');
    String answer = stdin.readLineSync()?.toLowerCase().trim() ?? '';

    if (answer != 'yes') {
      ordering = false;
    }
  }

  print('Thank you for ordering!');
}
