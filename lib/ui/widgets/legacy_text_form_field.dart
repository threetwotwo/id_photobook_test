import 'package:flutter/material.dart';

class LegacyTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final String label;
  final String subtitle;
  final String hint;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;

  final Function(String) validator;
  final bool obscureText;
  final bool shouldShowSuffix;
  final VoidCallback onSuffixTapped;

  const LegacyTextFormField(
      {Key key,
      this.controller,
      this.focusNode,
      this.label,
      this.subtitle,
      this.hint,
      this.keyboardType,
      this.textInputAction,
      this.validator,
      this.obscureText,
      this.shouldShowSuffix = false,
      this.onSuffixTapped})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      focusNode: focusNode,
      controller: controller,
      keyboardType: keyboardType,
      textInputAction: textInputAction ?? TextInputAction.next,
      onEditingComplete: () => FocusScope.of(context).nextFocus(),
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        labelText: label,
//        enabledBorder: OutlineInputBorder(
//          borderSide: BorderSide(
//            color: Colors.grey,
//            width: 1,
//          ),
//        ),
//        border: OutlineInputBorder(
//          borderSide: BorderSide(
//            color: Colors.grey,
//            width: 1,
//          ),
//        ),
//        contentPadding: const EdgeInsets.all(9),
        hintText: hint,
        suffixIcon: shouldShowSuffix
            ? IconButton(
                onPressed: onSuffixTapped,
                icon: obscureText
                    ? Icon(Icons.visibility_off)
                    : Icon(Icons.visibility),
              )
            : SizedBox(),
      ),
    );
  }
}
