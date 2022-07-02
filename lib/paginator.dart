import 'package:flutter/material.dart';

import 'package:zapdart/colors.dart';

import 'config.dart' as cfg;

class PageButton extends StatelessWidget {
  PageButton(
      {this.onPressed,
      this.textColor = Colors.white,
      this.fillColor = Colors.black,
      this.title,
      this.icon,
      this.borderColor,
      this.width = 40,
      this.height = 40})
      : super();

  final VoidCallback? onPressed;
  final Color textColor;
  final Color fillColor;
  final String? title;
  final IconData? icon;
  final Color? borderColor;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    var radius = BorderRadius.circular(height);
    var buttonStyle = ElevatedButton.styleFrom(
        primary: fillColor,
        side: BorderSide(color: borderColor != null ? borderColor! : fillColor),
        shape: RoundedRectangleBorder(borderRadius: radius),
        shadowColor: Colors.transparent);
    Widget child;
    if (title != null)
      child = Text(title!, style: TextStyle(color: textColor, fontSize: 14));
    else
      child = Icon(icon, color: textColor, size: 14);
    var btn = Container(
        width: width,
        height: height,
        child: Center(
            child: ElevatedButton(
                onPressed: onPressed, child: child, style: buttonStyle)));
    return btn;
  }
}

class Paginator extends StatefulWidget {
  final int pageCount;
  final int pageNumber;
  final Function(int) activatePage;

  Paginator(this.pageCount, this.pageNumber, this.activatePage);

  @override
  State<Paginator> createState() => _PaginatorState();
}

class _PaginatorState extends State<Paginator> {
  _PaginatorState();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget _currentButton(String? title, IconData? icon) {
    return PageButton(
        textColor: ZapOnSecondary,
        fillColor: ZapSecondary,
        title: title,
        icon: icon);
  }

  Widget _activeButton(String? title, IconData? icon, int toPage) {
    return PageButton(
        onPressed: () => widget.activatePage(toPage),
        textColor: ZapOnSurface,
        fillColor: ZapSurface,
        title: title,
        icon: icon);
  }

  Widget _nada() {
    return Visibility(
        visible: false,
        maintainSize: true,
        maintainAnimation: true,
        maintainState: true,
        child: _currentButton('blah', null));
  }

  @override
  Widget build(BuildContext context) {
    if (widget.pageCount < 2) return Row();
    assert(widget.pageNumber >= 0 && widget.pageNumber < widget.pageCount);
    var prev = widget.pageNumber > 0
        ? _activeButton(null, Icons.arrow_back_ios, widget.pageNumber - 1)
        : _nada();
    var next = widget.pageNumber < widget.pageCount - 1
        ? _activeButton(null, Icons.arrow_forward_ios, widget.pageNumber + 1)
        : _nada();
    List<Widget> center = [];
    // first page
    center.add(widget.pageNumber == 0
        ? _currentButton('1', null)
        : _activeButton('1', null, 0));
    // left '...'
    if (widget.pageNumber > 2) center.add(Text('...'));
    if (widget.pageNumber > 1)
      center.add(
          _activeButton('${widget.pageNumber}', null, widget.pageNumber - 1));
    // current
    if (widget.pageNumber >= 1 && widget.pageNumber <= widget.pageCount - 2)
      center.add(_currentButton('${widget.pageNumber + 1}', null));
    // right '...'
    if (widget.pageNumber < widget.pageCount - 2)
      center.add(_activeButton(
          '${widget.pageNumber + 2}', null, widget.pageNumber + 1));
    if (widget.pageNumber < widget.pageCount - 3) center.add(Text('...'));
    // last page
    center.add(widget.pageNumber == widget.pageCount - 1
        ? _currentButton('${widget.pageCount}', null)
        : _activeButton('${widget.pageCount}', null, widget.pageCount - 1));
    var paginator = Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [prev, Row(children: center), next]);
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < cfg.MaxColumnWidth) return paginator;
      return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        ConstrainedBox(
            constraints: BoxConstraints(maxWidth: cfg.MaxColumnWidth),
            child: paginator)
      ]);
    });
  }
}
