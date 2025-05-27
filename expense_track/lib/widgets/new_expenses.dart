import 'package:flutter/material.dart';
import 'package:expense_track/model/expense.dart';

class NewExpenses extends StatefulWidget {
  const NewExpenses({super.key, required this.onAddExpense});

 final void Function(Expense expense) onAddExpense;

  @override
  State<NewExpenses> createState() => _NewExpensesState();
}

class _NewExpensesState extends State<NewExpenses> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.food;

  void _presentDatePicker() async{
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
   final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate, 
      lastDate: now,
    );
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _submitExpenseData () {
    final enteredAmount = double.tryParse(_amountController.text);
    final amountIsInvalid = enteredAmount == null || enteredAmount == 0;
    if(_titleController.text.trim().isEmpty ||
     amountIsInvalid || 
     _selectedDate == null) {
      showDialog(
        context: context, 
        builder: (ctx) => AlertDialog(
          title: Text('Invalid Input'),
          content: Text('Please make sure a valid, title, amount and date was entered'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: Text('Okay'),
            ),
          ],
        ),
      );
    }

    widget.onAddExpense(
      Expense(
        title: _titleController.text, 
        amount: enteredAmount!, 
        date: _selectedDate!, 
        category: _selectedCategory
      ),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
      super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;
    
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 48, 16, keyboardSpace + 16),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: InputDecoration(
              label: Text('Title')
            ),
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: _amountController,
                  decoration: InputDecoration(
                    label: Text('Amount'),
                    prefix: Text('\$ '),
                  ),
                ),
              ),
            SizedBox(width: 10,),
               Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text( _selectedDate == null ? 'No Date Selected' : formatter.format(_selectedDate!)),
                  IconButton(
                    onPressed: _presentDatePicker, 
                    icon: Icon(Icons.calendar_month),
                    ),
                ],
              )
    
            ],
          ),
          SizedBox(height: 16,),
          Row(
            children: [
              DropdownButton(
                value: _selectedCategory,
                items: Category.values.map((category) => DropdownMenuItem(
                  value: category,
                  child: Text(
                    category.name.toUpperCase()
                    ),
                    ),
                    ).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedCategory = value!;
                  });
                },
                ),
                Spacer(),
              TextButton(
                onPressed: (){
                  Navigator.pop(context);
                }, 
                child: Text('Cancel'),
                ),
              
             ElevatedButton(
              onPressed: () {
               _submitExpenseData();
              },
              child: Text('Save Expense'),
              ), 
            ],
          ),
        ],
      ),
    );
  }
}