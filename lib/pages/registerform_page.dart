import 'package:flutter/material.dart';

class RegForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Register'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {},
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () {},
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Name',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter your full name',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Whatsapp Number',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter your Whatsapp number',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Address',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter your full address',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Location',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  value: 'Choose your location',
                  items: const [
                    DropdownMenuItem(
                      value: 'Choose your location',
                      child: Text('Choose your location'),
                    ),
                    DropdownMenuItem(
                      value: 'Location 1',
                      child: Text('Location 1'),
                    ),
                    DropdownMenuItem(
                      value: 'Location 2',
                      child: Text('Location 2'),
                    ),
                  ],
                  onChanged: (value) {},
                ),
                const SizedBox(height: 16),
                const Text(
                  'Branch',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  value: 'Select the branch',
                  items: const [
                    DropdownMenuItem(
                      value: 'Select the branch',
                      child: Text('Select the branch'),
                    ),
                    DropdownMenuItem(
                      value: 'Branch 1',
                      child: Text('Branch 1'),
                    ),
                    DropdownMenuItem(
                      value: 'Branch 2',
                      child: Text('Branch 2'),
                    ),
                  ],
                  onChanged: (value) {},
                ),
                const SizedBox(height: 16),
                const Text(
                  'Treatments',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      const Text(
                        '1.',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Male'),
                    ),
                    const Text('2'),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Female'),
                    ),
                    const Text('2'),
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: const Text(
                    '+ Add Treatments',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
