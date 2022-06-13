import 'package:flutter/material.dart';

import 'package:zapdart/colors.dart';

import 'config.dart';

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
        visible: testnet(),
        child:
            Text('TESTNET', style: TextStyle(color: ZapWarning, fontSize: 8)),
      ),
      Text('Server: ${server()}',
          style: TextStyle(color: ZapOnBackgroundLight, fontSize: 8)),
      Visibility(
          visible: GitSha != 'GIT_SHA_REPLACE',
          child: Text('Build: ${GitSha.substring(0, 5)} - $BuildDate',
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
      this.holePunch = false})
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
  final bool holePunch;

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
    if (icon != null && holePunch)
      throw ArgumentError('Can only use "icon" parameter OR "holePunch"');
    if (icon != null) {
      var row = Row(
          children: [Icon(icon, color: textColor, size: 14), text],
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround);
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
                  children: holePunch
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
