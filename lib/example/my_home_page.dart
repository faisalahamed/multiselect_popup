import 'package:flutter/material.dart';
import 'package:multiselect_popup/multiselect_popup.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _showMultiSelect(BuildContext context) async {
    final items = <MultiSelectDialogItem<int>>[
      const MultiSelectDialogItem(1, 'Dog'),
      const MultiSelectDialogItem(2, 'Cat'),
      const MultiSelectDialogItem(3, 'Mouse'),
    ];

    final selectedValues = await showDialog<Set<int>>(
      context: context,
      builder: (BuildContext context) {
        return MultiSelectDialog(
          items: items,
          initialSelectedValues: const <int>{1, 3},
        );
      },
    );

    print(selectedValues);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Multi select Popup'),
      ),
      body: Center(
        child: TextButton(
          onPressed: () => _showMultiSelect(context),
          child: const Text('Select PopUp'),
        ),
      ),
    );
  }
}