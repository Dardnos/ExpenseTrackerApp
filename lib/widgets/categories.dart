import 'package:flutter/material.dart';

class EditCategoryPage extends StatefulWidget {
  const EditCategoryPage({Key? key}) : super(key: key);

  @override
  State<EditCategoryPage> createState() {
    return _EditCategoryPageState();
  }
}
/// Define an enumeration 'Category' to represent expense categories
enum Category { food, travel, leisure, work }

/// Define icons for each expense category
const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
};

/// Define a class to represent expense categories with icons
class CategoryItem {
  final String category;
  final IconData icon;

  CategoryItem(this.category, this.icon);
}

List<CategoryItem> categoryItems = [
  CategoryItem("food", Icons.lunch_dining),
  CategoryItem("travel", Icons.flight_takeoff),
  CategoryItem("leisure", Icons.movie),
  CategoryItem("work", Icons.work),
];

class _EditCategoryPageState extends State<EditCategoryPage> {

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