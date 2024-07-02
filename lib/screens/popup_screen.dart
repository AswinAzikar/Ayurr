import 'package:ayurr/constant.dart';
import 'package:ayurr/providers/genderCounter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PopupScreen extends StatelessWidget {
  const PopupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Choose Treatment',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                hintText: 'Choose preferred treatment',
              ),
              items: ['Treatment 1', 'Treatment 2', 'Treatment 3']
                  .map((String value) => DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      ))
                  .toList(),
              onChanged: (String? newValue) {},
            ),
            const SizedBox(height: 24),
            const Text(
              'Add Patients',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8),
                          color: AppColors.dimGrey),
                      padding: const EdgeInsets.all(12),
                      child: const Text(
                        "Male",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 1,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            context.read<GenderProvider>().incrementMale();
                          },
                          icon: const Icon(
                            Icons.add_circle,
                            color: AppColors.primaryColor,
                          ),
                          iconSize: 45,
                        ),
                        const SizedBox(
                          width: 1,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(8),
                              color: const Color.fromARGB(73, 158, 158, 158)),
                          padding: const EdgeInsets.all(15),
                          child: Text(
                            context.watch<GenderProvider>().male.toString(),
                            style: const TextStyle(fontSize: 20),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            context.read<GenderProvider>().decrementMale();
                          },
                          icon: const Icon(
                            Icons.remove_circle,
                            color: AppColors.primaryColor,
                          ),
                          iconSize: 45,
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8),
                          color: AppColors.dimGrey),
                      padding: const EdgeInsets.all(12),
                      child: const Text(
                        "Female",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 1,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            context.read<GenderProvider>().incrementFemale();
                          },
                          icon: const Icon(
                            Icons.add_circle,
                            color: AppColors.primaryColor,
                          ),
                          iconSize: 45,
                        ),
                        const SizedBox(
                          width: 1,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(8),
                              color: const Color.fromARGB(73, 158, 158, 158)),
                          padding: const EdgeInsets.all(15),
                          child: Text(
                            context.watch<GenderProvider>().female.toString(),
                            style: const TextStyle(fontSize: 20),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            context.read<GenderProvider>().decrementFemale();
                          },
                          icon: const Icon(
                            Icons.remove_circle,
                            color: AppColors.primaryColor,
                          ),
                          iconSize: 45,
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 6,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Save data
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(15),
                    backgroundColor: AppColors.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Save',
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
    );
  }
}
