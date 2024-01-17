import 'package:flutter/material.dart';
import 'package:profile/core/styles/themes.dart';

import '../resources.dart';
import 'app_text_field.dart';

class EnumDropdown<T> extends StatefulWidget {
  final ValueChanged<T?> onChanged;
  final T? initialValue;
  final List<EnumItem<T>> items;

  const EnumDropdown({super.key, required this.onChanged, this.initialValue, required this.items});

  @override
  _EnumDropdownState createState() => _EnumDropdownState<T>();
}

class _EnumDropdownState<T> extends State<EnumDropdown<T>> {
  T? _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: const AppTextField(hint: '').buildInputDecoration,
      child: DropdownButton<T>(
        value: _selectedValue,
        items: widget.items
            .map((item) => DropdownMenuItem<T>(
                  value: item.value,
                  child: AppText(text: item.display, style: meduim14.copyWith(color: Colors.grey)),
                ))
            .toList(),
        onChanged: (T? value) {
          setState(() {
            _selectedValue = value;
            widget.onChanged(value);
          });
        },
        style: meduim14.copyWith(color: Colors.grey, fontFamily: hacen),
        icon: const Icon(Icons.arrow_drop_down),
        iconSize: 24,
        iconEnabledColor: Colors.grey,
        underline: const SizedBox(),
        isExpanded: true,
        isDense: true,
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
        hint: Text(widget.items.isEmpty ? '' : widget.items.first.display),
      ),
    );
  }
}

class EnumItem<T> {
  final T value;
  final String display;

  EnumItem(this.value, this.display);
}
