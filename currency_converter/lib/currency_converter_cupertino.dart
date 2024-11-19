import 'package:flutter/cupertino.dart';

class CurrencyConverterCupertinoPage extends StatefulWidget {
  const CurrencyConverterCupertinoPage({super.key});

  @override
  State<CurrencyConverterCupertinoPage> createState() => 
  _CurrencyConverterCupertinoPageState();
}

class _CurrencyConverterCupertinoPageState 
extends State<CurrencyConverterCupertinoPage> {
  double result = 0;
    final TextEditingController textEditingController = TextEditingController();
 
  @override
  Widget build(BuildContext context) {

    return  CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemGrey3,
      navigationBar: const CupertinoNavigationBar(
        backgroundColor: CupertinoColors.systemGrey3,
        middle:  Text('Currency Converter', 
          style: TextStyle(
          color: CupertinoColors.white)
          ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text(
              'N $result', 
              style: const TextStyle(
                fontSize: 45,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 255, 255, 255)
              ),
              ),
            Padding(
              padding: const EdgeInsets.all(10),
                child: CupertinoTextField(
                  controller: textEditingController,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                  ), 
                  decoration: BoxDecoration(
                    color: CupertinoColors.white,
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  placeholder: 'please enter the amount in USD',
                  prefix: const Icon(CupertinoIcons.money_dollar) ,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                    signed: true,
                  ),
                ),
            ),

            Padding(
              padding: const EdgeInsets.all(10),
              child: CupertinoButton(
                onPressed: (){
                  setState(() {
                   result = double.parse(textEditingController.text) * 1500;  
                  });
                },
                color: CupertinoColors.black,
                   
                child: const Text('Convert'),
                ),
              ),
          ],
        ), 
      )
    );
  }
}