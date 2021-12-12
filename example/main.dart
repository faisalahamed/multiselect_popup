import 'package:flutter/material.dart';
import 'package:multiselect_popup/multiselect_popup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ///make a list
  void _showMultiSelect(BuildContext context) async {
    final items = <MultiSelectDialogItem<int>>[
      const MultiSelectDialogItem(1, 'Dog'),
      const MultiSelectDialogItem(2, 'Cat'),
      const MultiSelectDialogItem(3, 'Mouse'),
    ];

    ///call the function
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
