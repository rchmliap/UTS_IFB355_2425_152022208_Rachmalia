import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import 'invoice.dart'; // Import the invoice page

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // Track selected items for checkout
  List<int> selectedItems = [];

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: cart.items.isEmpty
                ? Center(child: Text('No items in cart'))
                : ListView.builder(
                    itemCount: cart.items.length,
                    itemBuilder: (context, index) {
                      final cartItem = cart.items[index];
                      return ListTile(
                        leading: Image.asset(cartItem.image),
                        title: Text(cartItem.name),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Size: ${cartItem.size} ml'),
                            Text(
                                'Price: IDR ${cartItem.price}'), // Updated for IDR
                          ],
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Qty: ${cartItem.quantity}'),
                            Checkbox(
                              value: selectedItems.contains(index),
                              onChanged: (value) {
                                setState(() {
                                  if (value == true) {
                                    selectedItems.add(index);
                                  } else {
                                    selectedItems.remove(index);
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: selectedItems.isEmpty
                  ? null
                  : () {
                      // Create a list of selected items to pass to InvoicePage
                      List selectedCartItems = selectedItems
                          .map((index) => cart.items[index])
                          .toList();

                      // Calculate the total price for selected items
                      double totalPrice = selectedCartItems.fold(
                        0,
                        (sum, item) => sum + (item.price * item.quantity),
                      );

                      // Navigate to the InvoicePage and pass the selected items and total price
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => InvoicePage(
                            cartItems: selectedCartItems,
                            totalPrice: totalPrice,
                          ),
                        ),
                      );
                    },
              child: Text('Checkout (${selectedItems.length})'),
            ),
          ),
        ],
      ),
    );
  }
}
