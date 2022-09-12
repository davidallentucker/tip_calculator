// ignore_for_file: unused_element, non_constant_identifier_names, prefer_typing_uninitialized_variables, use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields, unused_field, sort_child_properties_last, unnecessary_null_comparison

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return argument();
  }
}

class argument extends State<MyApp> {
  // 4. add the controller that will save the data from the text field
  // then in the TextField  add the controller argument
  final controller = TextEditingController();

  // 9.5 add list of booleand for the tip percent amount
  List<bool> _selection = [true, false, false];

  // 16. add state property that hangs on to the tip amount
  String tip = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Center(
        // 1. refactor the Column with a center widget
        child: Column(
          // 2. now add main axis alignment to put it in the middle
          mainAxisAlignment: MainAxisAlignment.center,
          //3. add the text field to enter data
          //4.5 add the controller:controller
          children: [
            // 18. add the text box & padding to display the amount of the tip up top
            if (tip != null)
              Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  tip,
                  style: TextStyle(fontSize: 30),
                ),
              ),

            Text('Total Amount'),
            // 8. refactor the textField w widget, then replace the word widget with SizedBox, add the width of 70
            SizedBox(
              width: 70,
              child: TextField(
                controller: controller,
                // 5. center the text box
                textAlign: TextAlign.center,
                // 6. Add a hint, prefix the $ with a back slash
                decoration: InputDecoration(hintText: '\$100.00'),
                // 7. change the keyboard type
                keyboardType: TextInputType.numberWithOptions(decimal: true),
              ),
            ),
            // 9. Add toggle buttons for the tip percentage amount,
            // so this will just be Toggle Buttons with out the child stuff that, got added when we wrapped it for padding
            // 13. wrap the toggle button in some padding, refactor as widget, replace the word widget with padding
            Padding(
              padding: EdgeInsets.all(20),
              child: ToggleButtons(
                  children: [Text('10%'), Text('15%'), Text('20%')],
                  isSelected: _selection,
                  // 10. add onPressed
                  onPressed: updateSelection),
            ),
            // 14. add the button for calculating the tip
            TextButton(
              //15.5 get rid of the parentheses and what not and put in calculateTip()
              //onPressed: () {},
              onPressed: calculateTip,
              child: Text('Calculate Tip'),
              style: TextButton.styleFrom(
                  primary: Colors.white, backgroundColor: Colors.green),
            )
          ],
        ),
      ),
    ));
  }

// 11. add the function for selecting the tip percentage
  void updateSelection(int selectedIndex) {
    // 12. wrap this loop in a set state
    setState(() {
      // this loop sets the booleans for the tip percentage list
      for (int i = 0; i < _selection.length; i++) {
        _selection[i] = selectedIndex == i;
      }
    });
  }

// 15. create the calculate tip function
  void calculateTip() {
    // grab what the user entered in and convert it to a double
    final totalAmount = double.parse(controller.text);
    // loop through and grab whichever one is true
    final selectedIndex = _selection.indexWhere((element) => element);
    // this looks at the selectedIndex's index and assigns the proper amount
    final tipPercentage = [0.1, 0.15, 0.2][selectedIndex];

    final tipTotal = (totalAmount * tipPercentage).toStringAsFixed(2);

    // 17. to the state stuff and save it to the tip variable
    setState(() {
      tip = '\$$tipTotal';
    });
  }
}
