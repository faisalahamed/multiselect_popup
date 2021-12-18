import 'package:flutter/material.dart';

class MultiSelectDialogItem<V> {
  const MultiSelectDialogItem(this.value, this.label);

  final V value;
  final String label;
}

class MultiSelectDialog<V> extends StatefulWidget {
  const MultiSelectDialog(
      {Key? key, required this.items, required this.initialSelectedValues,required this.title})
      : super(key: key);

  final List<MultiSelectDialogItem<V>> items;
  final Set<V> initialSelectedValues;
  final String title;

  @override
  State<StatefulWidget> createState() => _MultiSelectDialogState<V>();
}

class _MultiSelectDialogState<V> extends State<MultiSelectDialog<V>> {
  Set<V> selectedValues = <V>{};

  @override
  void initState() {
    super.initState();

    selectedValues.addAll(widget.initialSelectedValues);
  }

  void _onItemCheckedChange(V itemValue, bool checked) {
    setState(() {
      if (checked) {
        selectedValues.add(itemValue);
      } else {
        selectedValues.remove(itemValue);
      }
    });
  }

  void _onCancelTap() {
    Navigator.pop(context);
  }

  void _onSubmitTap() {
    Navigator.pop(context, selectedValues);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title:  Text(widget.title),
      contentPadding: const EdgeInsets.only(top: 12.0),
      content: SingleChildScrollView(
        child: ListTileTheme(
          contentPadding: const EdgeInsets.fromLTRB(14.0, 0.0, 24.0, 0.0),
          child: ListBody(
            children: widget.items.map(_buildItem).toList(),
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('CANCEL'),
          onPressed: _onCancelTap,
        ),
        TextButton(
            child: const Text('Add'),
            onPressed: () => Navigator.of(context).pushNamed('/categorylist')),
        TextButton(
          child: const Text('OK'),
          onPressed: _onSubmitTap,
        )
      ],
    );
  }

  Widget _buildItem(MultiSelectDialogItem<V> item) {
    final checked = selectedValues.contains(item.value);
    return CheckboxListTile(
      value: checked,
      title: Text(item.label),
      controlAffinity: ListTileControlAffinity.leading,
      onChanged: (checked) {
        if (checked != null) {
          _onItemCheckedChange(item.value, checked);
        }
      },
    );
  }
}
