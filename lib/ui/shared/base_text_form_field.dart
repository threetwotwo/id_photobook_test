import 'package:flutter/material.dart';
import 'package:idphotobooktest/constants/styles.dart';

class BaseTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final String title;
  final String subtitle;
  final String hint;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;

  const BaseTextFormField({
    Key key,
    @required this.controller,
    @required this.title,
    this.hint,
    this.subtitle,
    this.keyboardType,
    this.textInputAction,
    this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
//        Row(
//          children: <Widget>[
//
//            Text(subtitle ?? '', style: Styles.b12Normal)
//          ],
//        ),
        RichText(
          maxLines: 2,
          text: TextSpan(
            children: [
              TextSpan(
                text: title + ' ',
                style: Styles.h14Normal,
              ),
              TextSpan(
                text: subtitle ?? '',
                style: Styles.b12Normal,
              ),
            ],
          ),
        ),
        SizedBox(height: 5),
        TextFormField(
          focusNode: focusNode,
          controller: controller,
          style: Styles.h14Bold,
          keyboardType: keyboardType,
          textInputAction: textInputAction ?? TextInputAction.next,
          onEditingComplete: () => FocusScope.of(context).nextFocus(),
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey,
                width: 1,
              ),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey,
                width: 1,
              ),
            ),
            contentPadding: const EdgeInsets.all(9),
            hintText: hint,
            hintStyle: Styles.h14Normal.copyWith(color: Colors.grey),
          ),
        ),
      ],
    );
  }
}
