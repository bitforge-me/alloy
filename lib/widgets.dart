import 'package:flutter/material.dart';
import 'package:universal_platform/universal_platform.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:universal_html/html.dart' as html;
import 'package:intl/intl.dart';
import 'package:decimal/decimal.dart';

import 'package:zapdart/colors.dart';

import 'config.dart' as cfg;
import 'utils.dart';
import 'units.dart';

class CircleButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  final Color color;
  final double radius;

  CircleButton(this.text, this.onPressed,
      {this.color = Colors.transparent, this.radius = 30.0});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: color,
      child: IconButton(
        icon: Text(text,
            softWrap: false,
            style: TextStyle(letterSpacing: 0.5, fontSize: 10.0)),
        onPressed: onPressed,
      ),
    );
  }
}

class BalanceCard extends StatelessWidget {
  static final double HEIGHT = 120;
  final String titleText;
  // balanceText is a Widget as it could be either PriceEquivalent or Text
  final Widget balanceText;
  final LinearGradient colorGradient;
  final String assetImageStr;
  BalanceCard(
      this.titleText, this.balanceText, this.colorGradient, this.assetImageStr);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      width: cfg.ButtonWidth,
      height: HEIGHT,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(assetImageStr),
              opacity: 0.15,
              alignment: Alignment(1.3, 2.0),
              fit: BoxFit.fitHeight,
              filterQuality: FilterQuality.high),
          gradient: colorGradient,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(titleText, style: TextStyle(fontSize: 16)),
          balanceText,
        ],
      ),
    );
  }
}

enum AppStore { android, ios }

class AppstoreButton extends StatelessWidget {
  final AppStore _os;
  final String _downloadUrl;
  AppstoreButton(this._os, this._downloadUrl);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () => urlLaunch(_downloadUrl),
        child: SvgPicture.asset(
            _os == AppStore.android
                ? 'assets/google-play.svg'
                : 'assets/app-store.svg',
            width: 150,
            height: 44.444));
  }
}

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

class BronzeFormInput extends StatefulWidget {
  final TextEditingController? controller;
  final FormFieldValidator<dynamic>? validator;
  final String? labelText;
  final bool? obscureText;
  final bool? toggleObscure;
  final Icon? icon;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final String? suffixText;
  final void Function(String?)? onChanged;
  final void Function(String)? onFieldSubmitted;

  BronzeFormInput(this.controller,
      {this.validator,
      this.labelText,
      this.obscureText,
      this.toggleObscure,
      this.icon,
      this.keyboardType,
      this.suffixIcon,
      this.suffixText,
      this.onChanged,
      this.onFieldSubmitted})
      : super();

  @override
  State<BronzeFormInput> createState() => _BronzeFormInputState();
}

class _BronzeFormInputState extends State<BronzeFormInput> {
  bool obscureText = false;
  Widget? suffixIcon;

  @override
  void initState() {
    super.initState();

    if (widget.toggleObscure == true &&
        (widget.suffixIcon != null || widget.suffixText != null))
      throw Exception(
          'if "toggleObscureBtn" we cannot have a "suffixIcon" or "suffixText"');
    if (widget.obscureText == true) obscureText = true;
    if (widget.suffixIcon != null) suffixIcon = widget.suffixIcon;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.toggleObscure == true)
      suffixIcon = IconButton(
          onPressed: () {
            setState(() {
              obscureText = !obscureText;
            });
          },
          icon: Icon(
              obscureText == true ? Icons.visibility_off : Icons.visibility),
          tooltip: 'Show text');
    return TextFormField(
        controller: widget.controller,
        decoration: InputDecoration(
          prefixIcon: widget.icon == null
              ? null
              : Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: widget.icon,
                ),
          suffixIcon: suffixIcon,
          contentPadding: const EdgeInsets.symmetric(vertical: 25.0),
          fillColor: Color(0xFFFFFFFF).withOpacity(0.1),
          filled: true,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          labelText: widget.labelText ?? null,
          suffixText: widget.suffixText,
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
        keyboardType: widget.keyboardType,
        obscureText: obscureText,
        validator: widget.validator,
        onChanged: widget.onChanged,
        onFieldSubmitted: widget.onFieldSubmitted);
  }
}

class BronzeValueInput extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final FormFieldValidator<dynamic>? validator;
  final String? labelText;
  final String? suffixText;
  final bool? readOnly;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;

  BronzeValueInput(
      {this.controller,
      this.labelText,
      this.keyboardType,
      this.validator,
      this.readOnly,
      this.suffixText,
      this.onChanged,
      this.onFieldSubmitted});

  @override
  Widget build(BuildContext context) {
    return RoundedEdgeBox(
        borderColor: Colors.white,
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
          onChanged: onChanged,
          onFieldSubmitted: onFieldSubmitted,
        ));
  }
}

class BackgroundWebImage extends StatelessWidget {
  final Widget? child;
  late final String? imageSrc;

  BackgroundWebImage({this.child}) {
    imageSrc = extractUrl();
  }

  String? extractUrl() {
    // extract url from parent page. if we are an app we would need to do this differently
    if (UniversalPlatform.isWeb) {
      var backgroundDiv = html.document.getElementById('background');
      if (backgroundDiv != null) {
        var backgroundImage = backgroundDiv.style.backgroundImage;
        var res = RegExp(r'url\(\"(.*)\"\)').firstMatch(backgroundImage);
        if (res != null) {
          var path = html.window.location.pathname ?? '/';
          if (path.endsWith('/')) // if only '/' or breaks the spec '/path/'
            path = path.substring(0, path.length - 1); // remove last character
          return '${html.window.location.origin}${path}/${res.group(1)}';
        }
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    if (imageSrc == null) return Container(child: child);
    return Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(imageSrc!), fit: BoxFit.cover)),
        child: Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(color: ZapBackground.withAlpha(220)),
            child: child));
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

class BitforgePage extends StatelessWidget {
  final Widget? child;
  final bool scrollChild;
  final bool showDebugInfo;
  BitforgePage(
      {this.child, this.scrollChild = false, this.showDebugInfo = false});

  @override
  Widget build(BuildContext context) {
    Widget column;
    if (showDebugInfo)
      column = Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            ColumnView(child: child),
            Align(alignment: Alignment.bottomRight, child: DebugInfo())
          ]);
    else
      column = ColumnView(child: child);
    return BackgroundWebImage(
        child: SelectionArea(
            child: scrollChild
                ? LayoutBuilder(
                    builder: (context, constraints) => SingleChildScrollView(
                        child: ConstrainedBox(
                            constraints: BoxConstraints(
                                minHeight: constraints.maxHeight),
                            child: column)))
                : column));
  }
}

class RoundedEdgeBox extends StatelessWidget {
  final Widget? child;
  final Gradient? gradient;
  final Color? color;
  final double borderRadius;
  final double borderWidth;
  final Color? borderColor;
  final EdgeInsets padding;

  RoundedEdgeBox(
      {this.child,
      this.gradient,
      this.color,
      this.borderRadius = 10,
      this.borderWidth = 2,
      this.borderColor,
      this.padding = const EdgeInsets.all(8)});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
        decoration: BoxDecoration(
            gradient: gradient,
            color: color,
            border: Border.all(
                color: borderColor ?? Colors.black, width: borderWidth),
            borderRadius: BorderRadius.circular(borderRadius)),
        child: Padding(padding: padding, child: child));
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
        Padding(
            padding: EdgeInsets.all(50),
            child: Image.asset('assets/new-logo.png',
                filterQuality: FilterQuality.high)));
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
        backgroundColor: fillGradient == null ? fillColor : Colors.transparent,
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

enum ListTxDir { up, down }

class ListTx extends StatelessWidget {
  ListTx(this.onPressed, this.date, this.content, this.amount, this.asset,
      this.dir,
      {this.last = false})
      : super();

  final VoidCallback onPressed;
  final DateTime date;
  final Widget content;
  final Decimal amount;
  final String asset;
  final ListTxDir dir;
  final bool last;

  @override
  Widget build(BuildContext context) {
    var color = dir == ListTxDir.up ? ZapOutgoingFunds : ZapIncomingFunds;
    var icon = dir == ListTxDir.up
        ? Icons.keyboard_double_arrow_up_rounded
        : Icons.keyboard_double_arrow_down_rounded;
    var tsLeft = TextStyle(fontSize: 12, color: ZapOnBackgroundLight);
    var amountWidget = PriceEquivalent(asset, amount,
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: color,
        twoLines: true,
        textAlign: TextAlign.center);
    return Column(children: [
      Divider(),
      ListTile(
          onTap: onPressed,
          dense: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 8),
          leading: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(DateFormat('d MMM').format(date).toUpperCase(),
                    style: tsLeft),
                Text(DateFormat('yyyy').format(date), style: tsLeft),
              ]),
          title: content,
          trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [amountWidget, Icon(icon, color: color, size: 14)])),
      Visibility(visible: last, child: Divider())
    ]);
  }
}
