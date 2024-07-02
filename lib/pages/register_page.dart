import 'package:ayurr/constant.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final List<Map<String, dynamic>> _items = [
    {
      'title': 'Vikram Singh',
      'subtitle': 'Couple Combo Package (Rejuven...',
      'date': '31/01/2024',
      'therapist': 'Jithesh',
    },
    {
      'title': 'Vikram Singh',
      'subtitle': 'Couple Combo Package (Rejuven...',
      'date': '31/01/2024',
      'therapist': 'Jithesh',
    },
    {
      'title': 'Vikram Singh',
      'subtitle': 'Couple Combo Package (Rejuven...',
      'date': '31/01/2024',
      'therapist': 'Jithesh',
    },
  ];

  String _sortBy = 'Date';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search for treatments',
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    // Perform search functionality
                  },
                  child: const Text('Search'),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Sort by:'),
                DropdownButton<String>(
                  value: _sortBy,
                  items: ['Date', 'Therapist'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _sortBy = newValue!;
                    });
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _items.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  margin: const EdgeInsets.all(8),
                  padding: const EdgeInsets.all(8),
                  child: ListTile(
                    leading: const Icon(Icons.person),
                    title: Text(
                      ' ${index + 1}  ${_items[index]['title']}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(_items[index]['subtitle']),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(Icons.calendar_today),
                            const SizedBox(width: 4),
                            Text(_items[index]['date']),
                            const SizedBox(width: 16),
                            const Icon(Icons.person),
                            const SizedBox(width: 4),
                            Text(_items[index]['therapist']),
                          ],
                        ),
                      ],
                    ),
                    trailing: const Icon(Icons.arrow_forward),
                    onTap: () {
                      // Handle item tap
                    },
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                // Handle register button press
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(15),
                backgroundColor: AppColors.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Register Now',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
