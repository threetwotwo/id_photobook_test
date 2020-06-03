import 'package:flutter/material.dart';
import 'package:idphotobooktest/constants/app_colors.dart';

class ButtonKupon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Button(
      color: AppColors.goldenTainoi,
      text: Column(
        children: <Widget>[
          Text('Kupon Saya'),
          Text('Tidak Ada'),
        ],
      ),
      textStyle: TextStyle(
        color: Colors.black,
        fontSize: 13,
      ),
      icon: Padding(
        padding: const EdgeInsets.only(right: 5.0),
        child: Icon(Icons.loyalty, color: Colors.white),
      ),
      height: 60.0,
      width: MediaQuery.of(context).size.width / 2 - 20,
      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      onPressed: () {},
    );
  }
}

class Button extends StatelessWidget {
  final Color color;
  final Color disabledColor;
  final Function onPressed;
  final EdgeInsetsGeometry padding;
  final dynamic text;
  final TextStyle textStyle;
  final bool disabled;
  final Widget icon;
  final bool iconRight;
  final double width;
  final double height;
  final bool outline;
  final BorderRadius borderRadius;
  final double borderWidth;
  final bool raised;

  Button(
      {Key key,
      this.color,
      this.disabledColor,
      this.onPressed,
      this.padding,
      this.text,
      this.textStyle,
      this.disabled: false,
      this.icon,
      this.iconRight,
      this.width,
      this.height,
      this.outline: false,
      this.borderRadius,
      this.borderWidth: 2.0,
      this.raised: false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    if (text is Widget) {
      children.add(text);
    }
    if (text is String) {
      children.add(Text(text,
          textAlign: TextAlign.center,
          style: textStyle != null
              ? textStyle
              : TextStyle(fontSize: 12.0, color: Colors.black)));
    }

    if (icon != null) {
      iconRight != null ? children.add(icon) : children.insert(0, icon);
    }

    return Container(
      constraints:
          BoxConstraints(minHeight: height ?? 30, minWidth: width ?? 50),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius:
              borderRadius != null ? borderRadius : BorderRadius.circular(4.0),
          side: BorderSide(
              color: outline ? AppColors.torchRed : Colors.transparent,
              width: outline ? borderWidth : 0),
        ),
        elevation: raised ? 3 : 0,
        onPressed: disabled ? null : onPressed,
        disabledColor: disabledColor ?? Colors.transparent,
        color: outline ? Colors.transparent : color,
        padding: padding,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          textBaseline: TextBaseline.alphabetic,
          children: children,
        ),
      ),
    );
  }
}
