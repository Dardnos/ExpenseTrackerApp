import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() {
    return _CategoryPageState();
  }
}

/// Define a class to represent expense categories with icons
class CategoryItem {
  final String category;
  final IconData icon;

  CategoryItem(this.category, this.icon);
}

List<CategoryItem> categoryItems = [
  CategoryItem("Food", Icons.lunch_dining),
  CategoryItem("Travel", Icons.flight_takeoff),
  CategoryItem("Leisure", Icons.movie),
  CategoryItem("Work", Icons.work),
];

class _CategoryPageState extends State<CategoryPage> {

  void _addNewCategory(String newCategory) {
    setState(() {
      categoryItems.add(
        CategoryItem(newCategory, Icons.category),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Category'),
      ),
      body: ListView.builder(
        itemCount: categoryItems.length,
        itemBuilder: (context, index) {
          final categoryItem = categoryItems[index];
          return ListTile(
            leading: Icon(categoryItem.icon),
            title: Text(categoryItem.category.toString().split('.').last), // Extract the enum value
            onTap: () {
              // Handle category selection
              // You can navigate to a detailed view or perform any other action here
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Show a dialog or a form to allow users to add a new category
          showDialog(
            context: context,
            builder: (context) {
              String newCategoryName = ''; // Store the user's input
              return AlertDialog(
                title: const Text('Add Category'),
                content: TextField(
                  onChanged: (value) {
                    // Capture the user's input for the new category name
                    newCategoryName = value;
                  },
                ),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      if (newCategoryName.isNotEmpty) {
                        // Add the new CategoryItem to the list
                        _addNewCategory(newCategoryName);
                        Navigator.of(context).pop(); // Close the dialog
                      }
                    },
                    child: const Text('Add'),
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}