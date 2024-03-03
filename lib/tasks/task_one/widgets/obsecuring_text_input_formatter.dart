import 'package:flutter/services.dart';

class ObscuringTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String newText = '';
    for (int i = 0; i < newValue.text.length; i++) {
      // Replace each character with your desired Character (in this case 'Asterisk')
      newText += '*'; 
    }
    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}