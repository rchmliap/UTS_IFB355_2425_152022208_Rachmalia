import 'package:flutter/material.dart';

class TypeOfPerfumePage extends StatefulWidget {
  const TypeOfPerfumePage({Key? key}) : super(key: key);

  @override
  State<TypeOfPerfumePage> createState() => _TypeOfPerfumePageState();
}

class _TypeOfPerfumePageState extends State<TypeOfPerfumePage> {
  String searchQuery = '';
  String selectedSort = 'None';

  final List<Map<String, dynamic>> perfumes = [
    {'image': 'assets/2.jpg', 'name': 'ZARA', 'price': 100, 'rating': 4.5},
    {'image': 'assets/3.jpg', 'name': 'DIOR', 'price': 150, 'rating': 4.7},
    {'image': 'assets/4.png', 'name': 'CHANEL', 'price': 200, 'rating': 4.8},
    {'image': 'assets/5.jpg', 'name': 'GUCCI', 'price': 120, 'rating': 4.6},
  ];

  @override
  Widget build(BuildContext context) {
    // Apply search filter and sorting
    List<Map<String, dynamic>> filteredPerfumes = perfumes
        .where((perfume) =>
            perfume['name'].toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    if (selectedSort == 'Price: Low to High') {
      filteredPerfumes.sort((a, b) => a['price'].compareTo(b['price']));
    } else if (selectedSort == 'Price: High to Low') {
      filteredPerfumes.sort((a, b) => b['price'].compareTo(a['price']));
    } else if (selectedSort == 'Rating') {
      filteredPerfumes.sort((a, b) => b['rating'].compareTo(a['rating']));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Type of Perfumes'),
        backgroundColor: Colors.brown,
      ),
      body: Stack(
        children: [
          // Background image with transparency
          Opacity(
            opacity: 0.5, // Adjust opacity for desired transparency
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'assets/bg.jpg'), // Replace with your background image
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // Main content
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Search Bar
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Search Perfumes',
                    prefixIcon: Icon(Icons.search, color: Colors.brown),
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setState(() {
                      searchQuery = value;
                    });
                  },
                ),
                const SizedBox(height: 16),

                // Sorting Dropdown
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Sort by:',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    DropdownButton<String>(
                      value: selectedSort,
                      items: [
                        'None',
                        'Price: Low to High',
                        'Price: High to Low',
                        'Rating',
                      ].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedSort = value!;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Perfume Grid
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 0.7,
                  ),
                  itemCount: filteredPerfumes.length,
                  itemBuilder: (context, index) {
                    final perfume = filteredPerfumes[index];
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
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Price: \$${perfume['price']}',
                                  style: const TextStyle(fontSize: 14),
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.star,
                                        color: Colors.amber, size: 16),
                                    const SizedBox(width: 4),
                                    Text(
                                      '${perfume['rating']}',
                                      style: const TextStyle(fontSize: 14),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.brown,
                                    foregroundColor: Colors.white,
                                  ),
                                  onPressed: () {
                                    // Action for viewing details
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
