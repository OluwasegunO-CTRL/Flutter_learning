import 'package:expense_track/model/expense.dart';
import 'package:flutter/material.dart';

class ExpensesItem extends StatelessWidget{
  const ExpensesItem(this.expense, {super.key,
    required this.onDeleteExpense,
  });

  final Expense expense;
  final void Function(Expense expense) onDeleteExpense;


  @override
  Widget build (context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 6
        ),
        child: Column(
          children: [ 
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    expense.title,
                    style: Theme.of(context).textTheme.titleLarge,
                  )
                ),
              
                IconButton(
                  onPressed: () {
                    showDialog(
                      context: context, 
                      builder: (ctx) => AlertDialog(
                        title: const Text('Are you sure?'),
                        content: const Text('Do you want to delete this expense?'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(ctx);
                            }, 
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              onDeleteExpense(expense);
                              Navigator.pop(ctx);
                            }, 
                            child: const Text('Delete',
                            style: TextStyle(
                              color: Colors.red,),
                            ),
                          ),
                        ],
                      )
                    );
                  },
                  icon: Icon(Icons.delete,
                  size: 20 ,)
                )
              ],
            ),
            const SizedBox(height: 4,),
            Row(
              children: [
                Text('\$${expense.amount.toStringAsFixed(2)}'),
                Spacer(),
                Row(
                  children: [
                    Icon(categoryIcons[expense.category]),
                    const SizedBox(width: 8,),
                    Text(expense.formatedDate),
                  ],
                  )
              ],
            )

          ],
        ),
      ),
    );
  }
}