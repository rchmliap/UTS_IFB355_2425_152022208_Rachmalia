import 'package:flutter/material.dart';

class InvoicePage extends StatelessWidget {
  final List cartItems; // List of items selected for checkout
  final double totalPrice; // Total price of the selected items

  InvoicePage({required this.cartItems, required this.totalPrice});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Invoice - Scentify'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Invoice Summary',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  final item = cartItems[index];
                  return ListTile(
                    title: Text(item.name),
                    subtitle: Text('Qty: ${item.quantity} x IDR ${item.price}'),
                    trailing: Text('IDR ${item.quantity * item.price}'),
                  );
                },
              ),
            ),
            Divider(),
            Text(
              'Total: IDR $totalPrice',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add logic for payment or returning to the main screen
              },
              child: Text('Proceed to Payment'),
            ),
          ],
        ),
      ),
    );
  }
}
