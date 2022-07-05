import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

import 'package:zapdart/colors.dart';

import 'config.dart' as cfg;

class SpacedVisibility extends StatelessWidget {
  // Visibility widget with VerticalSpacer placed above child Widget in Column
  // Intention is to space out BronzeFormInput widgets on certain pages
  final Widget child;
  final bool visible;
  SpacedVisibility(this.visible, this.child);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: this.visible,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[VerticalSpacer(), this.child],
      ),
    );
  }
}

class VerticalSpacer extends StatelessWidget {
  final double height;
  VerticalSpacer({this.height = 15});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height);
  }
}

class BronzeFormInput extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final FormFieldValidator<dynamic>? validator;
  final String? labelText;
  final bool? obscureText;
  final Icon? icon;
  final Widget? suffixIcon;
  final String? suffixText;
  BronzeFormInput(this.controller,
      {this.validator,
      this.keyboardType,
      this.obscureText,
      this.labelText,
      this.suffixIcon,
      this.suffixText,
      this.icon})
      : super();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: this.controller,
        decoration: InputDecoration(
          prefixIcon: this.icon == null
              ? null
              : Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: this.icon,
                ),
          suffixIcon: this.suffixIcon,
          contentPadding: const EdgeInsets.symmetric(vertical: 25.0),
          fillColor: Color(0xFFFFFFFF).withOpacity(0.1),
          filled: true,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          labelText: this.labelText ?? null,
          suffixText: this.suffixText,
          constraints: BoxConstraints(
              minWidth: cfg.ButtonWidth, maxWidth: cfg.ButtonWidth),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
        ),
        keyboardType: this.keyboardType ?? null,
        obscureText: this.obscureText ?? false,
        validator: this.validator ?? null);
  }
}

class BronzeValueInput extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final FormFieldValidator<dynamic>? validator;
  final String? labelText;
  final String? suffixText;
  final bool? readOnly;

  BronzeValueInput(
      {this.controller,
      this.labelText,
      this.keyboardType,
      this.validator,
      this.readOnly,
      this.suffixText});

  @override
  Widget build(BuildContext context) {
    return RoundedEdgeBox(
        borderColor: Colors.white,
        dottedBorder: true,
        color: ZapSurface,
        child: TextFormField(
          controller: this.controller,
          readOnly: this.readOnly ?? false,
          decoration: InputDecoration(
              suffixText: this.suffixText,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              labelText: this.labelText),
          keyboardType: this.keyboardType,
          validator: this.validator,
        ));
  }
}

class ColumnView extends StatelessWidget {
  final Widget? child;
  final bool scrollChild;
  ColumnView({this.child, this.scrollChild = false});

  @override
  Widget build(BuildContext context) {
    var center = Center(
        child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: cfg.MaxColumnWidth),
            child: child));
    if (scrollChild) return SingleChildScrollView(child: center);
    return center;
  }
}

class RoundedEdgeBox extends StatelessWidget {
  final Widget? child;
  final Gradient? gradient;
  final Color? color;
  final double borderRadius;
  final bool dottedBorder;
  final double borderWidth;
  final Color? borderColor;
  final EdgeInsets padding;

  RoundedEdgeBox(
      {this.child,
      this.gradient,
      this.color,
      this.borderRadius = 10,
      this.dottedBorder = false,
      this.borderWidth = 2,
      this.borderColor,
      this.padding = const EdgeInsets.all(8)});

  Widget _dbox({bool drawBorder: false}) {
    return DecoratedBox(
        decoration: BoxDecoration(
            gradient: gradient,
            color: color,
            border: drawBorder
                ? Border.all(
                    color: borderColor ?? Colors.black, width: borderWidth)
                : null,
            borderRadius: BorderRadius.circular(borderRadius)),
        child: Padding(padding: padding, child: child));
  }

  @override
  Widget build(BuildContext context) {
    if (dottedBorder)
      return DottedBorder(
          padding: EdgeInsets.zero,
          borderType: BorderType.RRect,
          strokeWidth: borderWidth,
          radius: Radius.circular(borderRadius),
          color: borderColor ?? Colors.black,
          child: _dbox(drawBorder: false));
    return _dbox(drawBorder: true);
  }
}

class BigLogoContainer extends StatelessWidget {
  final List<Widget>? children;
  BigLogoContainer({this.children});

  @override
  Widget build(BuildContext context) {
    var kids = List<Widget>.from(children ?? []);
    kids.insert(
        0,
        Image.asset(
          'assets/new-logo.png',
          height: 200,
          fit: BoxFit.fitHeight,
        ));
    return Container(
        padding: EdgeInsets.all(20),
        child: Center(child: Column(children: kids)));
  }
}

class DebugInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Visibility(
        visible: cfg.testnet(),
        child:
            Text('TESTNET', style: TextStyle(color: ZapWarning, fontSize: 8)),
      ),
      Text('Server: ${cfg.server()}',
          style: TextStyle(color: ZapOnBackgroundLight, fontSize: 8)),
      Visibility(
          visible: cfg.GitSha != 'GIT_SHA_REPLACE',
          child: Text('Build: ${cfg.GitSha.substring(0, 5)} - ${cfg.BuildDate}',
              style: TextStyle(color: ZapOnBackgroundLight, fontSize: 8)))
    ]);
  }
}

class WordDivider extends StatelessWidget {
  final String word;
  final Color color;
  final double lineLength;
  final double lineThickness;
  final double lineHeight;

  const WordDivider(
      {this.word = ' OR ',
      this.color = Colors.white,
      this.lineLength = 140,
      this.lineHeight = 4,
      this.lineThickness = 2});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(
            width: lineLength,
            child: Divider(
                height: lineHeight, color: color, thickness: lineThickness)),
        Text(word, style: TextStyle(color: color)),
        SizedBox(
            width: lineLength,
            child: Divider(
                height: lineHeight, color: color, thickness: lineThickness))
      ],
    );
  }
}

class BronzeRoundedButton extends StatelessWidget {
  BronzeRoundedButton(this.onPressed, this.textColor, this.fillColor,
      this.fillGradient, this.title,
      {this.icon,
      this.borderColor,
      this.width = 88,
      this.height = 35,
      this.fwdArrow = false})
      : super();

  final VoidCallback onPressed;
  final Color textColor;
  final Color fillColor;
  final Gradient? fillGradient;
  final String title;
  final IconData? icon;
  final Color? borderColor;
  final double width;
  final double height;
  final bool fwdArrow;

  @override
  Widget build(BuildContext context) {
    var radius = BorderRadius.circular(40.0);
    var buttonStyle = ElevatedButton.styleFrom(
        primary: fillGradient == null ? fillColor : Colors.transparent,
        side: fillGradient == null
            ? BorderSide(color: borderColor != null ? borderColor! : fillColor)
            : null,
        shape: RoundedRectangleBorder(borderRadius: radius),
        shadowColor: Colors.transparent);
    var decoration = BoxDecoration(
      color: fillColor,
      border: borderColor != null ? Border.all(color: borderColor!) : null,
      gradient: fillGradient,
      borderRadius: radius,
      boxShadow: kElevationToShadow[3],
    );
    var text = Text(title, style: TextStyle(color: textColor, fontSize: 14));
    Widget btn;
    if (icon != null && fwdArrow)
      throw ArgumentError('Can only use "icon" parameter OR "fwdArrow"');
    if (icon != null) {
      var row = Row(
          children: [
            Icon(icon, color: textColor, size: 12),
            SizedBox(width: 8),
            text
          ],
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center);
      btn = Container(
          width: width,
          height: height,
          margin: EdgeInsets.all(5),
          child: DecoratedBox(
              decoration: decoration,
              child: ElevatedButton(
                  onPressed: onPressed, child: row, style: buttonStyle)));
    } else {
      btn = Container(
          width: width,
          height: height,
          margin: EdgeInsets.all(5),
          child: DecoratedBox(
              decoration: decoration,
              child: ElevatedButton(
                onPressed: onPressed,
                style: buttonStyle,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: fwdArrow
                      ? <Widget>[
                          text,
                          Icon(Icons.arrow_forward_ios, size: 15.0),
                        ]
                      : <Widget>[
                          text,
                        ],
                ),
              )));
    }
    return btn;
  }
}
