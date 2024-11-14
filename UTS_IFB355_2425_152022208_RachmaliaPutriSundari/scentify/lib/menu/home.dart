import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import '../models/cart_item.dart';
import 'cart_page.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> perfumes = [
    {
      'image': 'assets/2.jpg',
      'name': 'ZARA',
      'price': '\$100',
      'rating': '4.5 ★',
      'basePrice': 100.0,
      'sizes': [50, 100, 150],
    },
    {
      'image': 'assets/3.jpg',
      'name': 'DIOR',
      'price': '\$150',
      'rating': '4.7 ★',
      'basePrice': 150.0,
      'sizes': [50, 100, 150],
    },
    {
      'image': 'assets/4.png',
      'name': 'CHANEL',
      'price': '\$200',
      'rating': '4.8 ★',
      'basePrice': 200.0,
      'sizes': [50, 100, 150],
    },
    {
      'image': 'assets/5.jpg',
      'name': 'GUCCI',
      'price': '\$120',
      'rating': '4.6 ★',
      'basePrice': 120.0,
      'sizes': [50, 100, 150],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Opacity(
            opacity: 0.5,
            child: Image.asset(
              'assets/bg.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.brown.shade900.withOpacity(0.8),
                  ),
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        'Discover Your Signature Scent!',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Explore our exclusive collection with up to 30% off!',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white70,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.brown,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          // Navigate to perfume collection
                        },
                        child: const Text('Shop Now'),
                      ),
                    ],
                  ),
                ),
                Text(
                  'Featured Perfumes',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown.shade900,
                  ),
                ),
                const SizedBox(height: 16),
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 0.7,
                  ),
                  itemCount: perfumes.length,
                  itemBuilder: (context, index) {
                    final perfume = perfumes[index];
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 5,
                      child: Column(
                        children: [
                          Expanded(
                            child: Image.asset(
                              perfume['image'],
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text(
                                  perfume['name'],
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text('Price: ${perfume['price']}'),
                                Text('Rating: ${perfume['rating']}'),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.brown,
                                    foregroundColor: Colors.white,
                                  ),
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return ProductDetailsDialog(
                                          perfume: perfume,
                                        );
                                      },
                                    );
                                  },
                                  child: const Text('View Details'),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProductDetailsDialog extends StatefulWidget {
  final Map<String, dynamic> perfume;

  const ProductDetailsDialog({Key? key, required this.perfume})
      : super(key: key);

  @override
  _ProductDetailsDialogState createState() => _ProductDetailsDialogState();
}

class _ProductDetailsDialogState extends State<ProductDetailsDialog> {
  int quantity = 1;
  int selectedSize = 50;
  double selectedSizePrice = 0;

  @override
  void initState() {
    super.initState();
    selectedSizePrice = (widget.perfume['basePrice'] ?? 0).toDouble();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.perfume['name']),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(widget.perfume['image']),
          const SizedBox(height: 8),
          Text('Price: \$${(selectedSizePrice * quantity).toStringAsFixed(2)}',
              style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          DropdownButton<int>(
            value: selectedSize,
            items: widget.perfume['sizes'].map<DropdownMenuItem<int>>((size) {
              return DropdownMenuItem<int>(
                value: size,
                child: Text('$size ml'),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectedSize = value!;
                selectedSizePrice =
                    (widget.perfume['basePrice'] ?? 0).toDouble() *
                        (selectedSize / 50);
              });
            },
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.remove),
                onPressed: () {
                  setState(() {
                    if (quantity > 1) quantity--;
                  });
                },
              ),
              Text('Quantity: $quantity'),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  setState(() {
                    quantity++;
                  });
                },
              ),
            ],
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            // Add to cart functionality
            final cartItem = CartItem(
              name: widget.perfume['name'],
              image: widget.perfume['image'],
              price: selectedSizePrice,
              quantity: quantity,
              size: selectedSize,
            );
            Provider.of<CartProvider>(context, listen: false).addItem(cartItem);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CartPage()),
            );
          },
          child: const Text('Add to Cart'),
        ),
      ],
    );
  }
}
