import 'package:flutter/material.dart';
import 'package:w13_quiz/data/mock_grocery_repository.dart';

class GrocerySearch extends StatefulWidget {
  const GrocerySearch({super.key});

  @override
  State<GrocerySearch> createState() => _GrocerySearchState();
}

class _GrocerySearchState extends State<GrocerySearch> {
  String result = '';

  @override
  Widget build(BuildContext context) {
    final foundResult = dummyGroceryItems.where((grocery) {
      return grocery.name.toLowerCase().contains(result.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Search Groceries')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                hintText: 'Search',
                border: OutlineInputBorder(),
                filled: true,
              ),
              onChanged: (value) {
                setState(() {
                  result = value;
                });
              },
            ),
            const SizedBox(height: 16),
            Expanded(
              child: foundResult.isEmpty
                  ? const Center(
                      child: Text('not found', style: TextStyle(fontSize: 16)),
                    )
                  : ListView.builder(
                      itemCount: foundResult.length,
                      itemBuilder: (context, index) {
                        final grocery = foundResult[index];
                        return ListTile(
                          leading: Container(
                            width: 15,
                            height: 15,
                            color: grocery.category.color,
                          ),
                          title: Text(grocery.name),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
