import 'package:flutter/material.dart';

import 'package:zapdart/colors.dart';
import 'package:zapdart/widgets.dart';

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

  Widget _currentButton(String title) {
    return RoundedButton(() => {}, ZapWhite, ZapBlue, ZapBlueGradient, title,
        width: 35);
  }

  Widget _activeButton(String title, int toPage) {
    return RoundedButton(
        () => widget.activatePage(toPage), ZapBlue, ZapWhite, null, title,
        width: 35);
  }

  Widget _nada() {
    return Visibility(
        visible: false,
        maintainSize: true,
        maintainAnimation: true,
        maintainState: true,
        child: _currentButton('blah'));
  }

  @override
  Widget build(BuildContext context) {
    if (widget.pageCount < 2) return Row();
    assert(widget.pageNumber >= 0 && widget.pageNumber < widget.pageCount);
    var prev = widget.pageNumber > 0
        ? _activeButton('<', widget.pageNumber - 1)
        : _nada();
    var next = widget.pageNumber < widget.pageCount - 1
        ? _activeButton('>', widget.pageNumber + 1)
        : _nada();
    List<Widget> center = [];
    // first page
    center.add(
        widget.pageNumber == 0 ? _currentButton('1') : _activeButton('1', 0));
    // left '...'
    if (widget.pageNumber > 2) center.add(Text('...'));
    if (widget.pageNumber > 1)
      center.add(_activeButton('${widget.pageNumber}', widget.pageNumber - 1));
    // current
    if (widget.pageNumber >= 1 && widget.pageNumber <= widget.pageCount - 2)
      center.add(_currentButton('${widget.pageNumber + 1}'));
    // right '...'
    if (widget.pageNumber < widget.pageCount - 2)
      center.add(
          _activeButton('${widget.pageNumber + 2}', widget.pageNumber + 1));
    if (widget.pageNumber < widget.pageCount - 3) center.add(Text('...'));
    // last page
    center.add(widget.pageNumber == widget.pageCount - 1
        ? _currentButton('${widget.pageCount}')
        : _activeButton('${widget.pageCount}', widget.pageCount - 1));
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [prev, Row(children: center), next]);
  }
}
