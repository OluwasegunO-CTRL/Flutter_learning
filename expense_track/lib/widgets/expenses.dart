import 'package:expense_track/widgets/chart/chart.dart';
import 'package:expense_track/widgets/expenses_list/expenses_list.dart';
import 'package:expense_track/model/expense.dart';
import 'package:expense_track/widgets/new_expenses.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}


class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Shoe',
      amount: 19.15, 
      date: DateTime.now(), 
      category: Category.work,
    ),

    Expense(
      title: 'Amala',
      amount: 10, 
      date: DateTime.now(), 
      category: Category.food,
    ),
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      useRootNavigator: true,
      context: context,
      builder: (ctx) => 
      Center(child: NewExpenses(onAddExpense: _addExpense)
      ),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
      Navigator.pop(context);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseindex = _registeredExpenses.indexOf(expense);
    
    setState(() {
      _registeredExpenses.remove(expense);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 4 ),
        content: Text('You have deleted ${expense.title}'),
        action: SnackBarAction(
          label: 'Undo', 
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseindex, expense);
            });
          }
        ),
      )
    );
  }


  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    Widget mainContent = const Center(
      child: Text('No expenses found. Start adding some!'),
    );

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        onRemoveExpense: _removeExpense,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter ExpensesTracker'),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay, 
            icon: Icon(Icons.add),
          )
        ],
        // backgroundColor: Colors.purple,
      ),
      body: width < 600 ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Chart(expenses: _registeredExpenses),
            Expanded(
              child: mainContent
            )
            
          ],
          ) : Row(
            children: [
              Expanded(child: Chart(expenses: _registeredExpenses)),
              Expanded(
                child: mainContent
            )
            ],
          ),  
    );
  }
}