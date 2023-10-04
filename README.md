
# Expense Tracker App Documentation

## App Architecture

The Expense Tracker app is designed using the Flutter framework, which follows a widget-based architecture. The key architectural components are as follows:

### 1. Widgets
- The app is built primarily using various widgets, which are the building blocks of the user interface.
- Widgets are organized into a hierarchical structure to create complex UIs.
- The main screen of the app is the `Expenses` widget, which serves as the entry point.

### 2. Data Models
- The app defines a data model called `Expense` to represent individual expenses.
- Expenses are categorized into categories, and each expense has a unique identifier (`id`).
- Expenses are grouped into categories using the `categoryItems` list.

### 3. Business Logic
- Business logic for adding, removing, and managing expenses is implemented within the widgets.
- The `NewExpense` widget handles the addition of new expenses.
- The `ExpensesList` widget displays a list of expenses and allows users to remove them.
- The `Chart` widget displays a visual representation of expenses by category.

### 4. UI Components
- UI components such as `Card`, `ListView`, and various form input fields are used to build the user interface.
- Custom UI elements, like the `ChartBar`, are also implemented to visualize data.

## User Stories

The Expense Tracker app addresses the following user stories:

1. **Add Expense**
    - As a user, I want to add a new expense with a title, amount, date, and category.
    - I want to save the expense and have it displayed in the list of expenses.

2. **Remove Expense**
    - As a user, I want to remove an existing expense from the list.
    - I want to have the option to undo the removal in case of accidental deletion.

3. **View Expenses**
    - As a user, I want to view a list of all my expenses.
    - I want to see each expense's title, amount, category, and date.

4. **Visualize Expenses**
    - As a user, I want to see a visual representation (chart) of my expenses grouped by category.
    - I want to understand the distribution of expenses across different categories.

## Specifications

The Expense Tracker app has the following specifications:

- **Themes**: The app supports both light and dark themes, with color schemes tailored for each theme.
- **Date Formatting**: Dates are displayed in the "month/day/year" format.
- **Expense Categories**: Expenses can belong to one category. Default categories: Food, Travel, Leisure, and Work.
- **Category Management**: The app allows users to add, remove, and manage expense categories.
- **Category Icons**: Each category has a icon associated with it.
- **Expense Addition**: The app allows users to add new expenses.
- **Expense Input**: The app allows users to input expense titles, amounts, dates, and categories.
- **Expense Removal**: The app allows users to remove existing expenses.
- **Undo Feature**: When an expense or category is deleted, the app allows the user to undo the deletion within a certain time frame.
- **Expense List**: The app displays a list of expenses, with each expense showing its title, amount, date, and category.
- **Expense Chart**: The app provides a chart that visually represents expenses by category using colored bars.
- **Validation**: Expense input is validated to ensure that titles, amounts, dates, and categories are provided correctly.

## File and Folder Structure

The app's code is organized into folders and files as follows:

- `lib/` (Root Directory)
    - `models/` (Folder for Data Models)
        - `expense.dart` (Definition of the `Expense` data model)
    - `widgets/` (Folder for Custom Widgets)
        - `chart/` (Subfolder for Chart-related Widgets)
            - `chart.dart` (Definition of the `Chart` widget)
            - `chart_bar.dart` (Definition of the `ChartBar` widget)
        - `expenses_list/` (Subfolder for Expenses List-related Widgets)
            - `expense_item.dart` (Definition of the `ExpenseItem` widget)
            - `expenses_list.dart` (Definition of the `ExpensesList` widget)
        - `category_page.dart` (Definition of the `CategoryPage` widget)
        - `expenses.dart` (Definition of the main `Expenses` widget)
        - `new_expense.dart` (Definition of the `NewExpense` widget)
    - `main.dart` (Entry point of the application)

The file and folder structure is designed to keep code organized, making it easier to maintain and extend the app's functionality.


## Class Diagram
```mermaid
classDiagram
    class Expense
    Expense : +id String
    Expense : +title String
    Expense : +amount double
    Expense : +date DateTime
    Expense : +category CategoryItem
    Expense o-- CategoryItem
    Expense : +formattedDate String


    class ExpenseBucket
    ExpenseBucket : +category CategoryItem
    ExpenseBucket o-- CategoryItem
    ExpenseBucket : +expenses List~Expense~
    ExpenseBucket : +totalExpenses double

    class CategoryPage
    CategoryPage : +onRemoveCategory void FunctionCategoryItem
    CategoryPage o-- void FunctionCategoryItem
    CategoryPage : +createState() State<CategoryPage>
    StatefulWidget <|-- CategoryPage

    class CategoryItem
    CategoryItem : +category String
    CategoryItem : +icon IconData
    CategoryItem o-- IconData

    class _CategoryPageState
    _CategoryPageState : -_icon Icon?
    _CategoryPageState o-- Icon
    _CategoryPageState : -_addNewCategory() void
    _CategoryPageState : -_pickIcon() dynamic
    _CategoryPageState : +build() Widget
    State <|-- _CategoryPageState

    class Chart
    Chart : +expenses List~Expense~
    Chart : +buckets List~ExpenseBucket~
    Chart : +maxTotalExpense double
    Chart : +build() Widget
    StatelessWidget <|-- Chart

    class ChartBar
    ChartBar : +fill double
    ChartBar : +build() Widget
    StatelessWidget <|-- ChartBar

    class Expenses
    Expenses : +createState() State<Expenses>
    StatefulWidget <|-- Expenses

    class _ExpensesState
    _ExpensesState : -_registeredExpenses List~Expense~
    _ExpensesState : -_openAddExpenseOverlay() void
    _ExpensesState : -_addExpense() void
    _ExpensesState : -_removeExpense() void
    _ExpensesState : +build() Widget
    State <|-- _ExpensesState

    class ExpensesList
    ExpensesList : +expenses List~Expense~
    ExpensesList : +onRemoveExpense void FunctionExpense
    ExpensesList o-- void FunctionExpense
    ExpensesList : +build() Widget
    StatelessWidget <|-- ExpensesList

    class ExpenseItem
    ExpenseItem : +expense Expense
    ExpenseItem o-- Expense
    ExpenseItem : +build() Widget
    StatelessWidget <|-- ExpenseItem

    class NewExpense
    NewExpense : +onAddExpense void FunctionExpense
    NewExpense o-- void FunctionExpense
    NewExpense : +createState() State<NewExpense>
    StatefulWidget <|-- NewExpense

    class _NewExpenseState
    _NewExpenseState : -_titleController TextEditingController
    _NewExpenseState o-- TextEditingController
    _NewExpenseState : -_amountController TextEditingController
    _NewExpenseState o-- TextEditingController
    _NewExpenseState : -_selectedDate DateTime?
    _NewExpenseState : -_selectedCategory CategoryItem
    _NewExpenseState o-- CategoryItem
    _NewExpenseState : -_presentDatePicker() void
    _NewExpenseState : -_removeCategory() void
    _NewExpenseState : -_submitExpenseData() void
    _NewExpenseState : +dispose() void
    _NewExpenseState : +build() Widget
    State <|-- _NewExpenseState
```





## Screenshots

The following screenshots show the app's user interface:

![Main Page](doc/screenshots/mainPage.png)
![New Expense](doc/screenshots/newExpense.png)
![Categories](doc/screenshots/categories.png)
![Add Category](doc/screenshots/addCategory.png)
![Icon Chooser](doc/screenshots/iconPicker.png)