import 'package:ayurr/constant.dart';
import 'package:ayurr/providers/genderCounter.dart';
import 'package:ayurr/screens/popup_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegForm extends StatelessWidget {
  final int male;
  final int female;
  const RegForm({super.key, required this.male, required this.female});

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
                const SizedBox(height: 8),
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 240, 235, 235),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const SizedBox(width: 8),
                          const Expanded(
                              child: Text("to implement treatment provider")),
                          IconButton(
                            icon: const Icon(Icons.close),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Male : ",
                                    style: TextStyle(
                                        color: AppColors.fontColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(8),
                                        color: const Color.fromARGB(
                                            73, 158, 158, 158)),
                                    padding: const EdgeInsets.all(8),
                                    child: Text(
                                      context
                                          .watch<GenderProvider>()
                                          .male
                                          .toString(),
                                      style: const TextStyle(fontSize: 20),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Female : ",
                                    style: TextStyle(
                                        color: AppColors.fontColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(8),
                                        color: const Color.fromARGB(
                                            73, 158, 158, 158)),
                                    padding: const EdgeInsets.all(8),
                                    child: Text(
                                      context
                                          .watch<GenderProvider>()
                                          .female
                                          .toString(),
                                      style: const TextStyle(fontSize: 20),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const PopupScreen();
                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(15),
                        backgroundColor: AppColors.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
