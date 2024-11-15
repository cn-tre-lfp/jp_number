import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[\u0030-\u0039\uFF10-\uFF19\u002E]')), // 允许半角数字、全角数字、小数点
        FullWidthToHalfWidthFormatter(), // 转换全角数字为半角数字

      ],
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        labelText: '请输入数字',
        border: OutlineInputBorder(),
      ),
    );
  }
}

class FullWidthToHalfWidthFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // 将全角数字转换为半角数字
    final text = newValue.text.replaceAllMapped(RegExp(r'[０-９]'), (match) {
      final fullWidthChar = match.group(0)!;
      return String.fromCharCode(fullWidthChar.codeUnitAt(0) - 0xFEE0);
    });

    return TextEditingValue(
      text: text,
      selection: newValue.selection.copyWith(
        baseOffset: text.length,
        extentOffset: text.length,
      ),
    );
  }
}