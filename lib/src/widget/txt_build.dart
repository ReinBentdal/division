import 'package:flutter/material.dart';

class TxtBuild extends StatefulWidget {

  TxtBuild({
    @required this.text,
    @required this.fontWeight,
    @required this.textAlign,
    @required this.fontStyle,
    @required this.fontFamily,
    @required this.fontFamilyFallback,
    @required this.fontSize,
    @required this.textColor,
    @required this.maxLines,
    @required this.letterSpacing,
    @required this.wordSpacing,
    @required this.editable,
    @required this.focusNode,
    @required this.obscureText,
    @required this.onSelectionChange,
    @required this.onChange,
    @required this.keyboardType,
  });

  final String text;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final FontStyle fontStyle;
  final String fontFamily;
  final List<String> fontFamilyFallback;
  final double fontSize;
  final Color textColor;
  final int maxLines;
  final double letterSpacing;
  final double wordSpacing;

  final bool editable;
  final FocusNode focusNode;
  final TextInputType keyboardType;
  final bool obscureText;
  final void Function(String) onChange;
  final void Function(TextSelection, SelectionChangedCause) onSelectionChange;

  @override
  _TxtBuildState createState() => _TxtBuildState();
}

class _TxtBuildState extends State<TxtBuild> {
  String _text;
  FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    updateFocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode?.dispose();
  }

  void updateFocusNode() {
    _focusNode = widget.focusNode;
  }

  @override
  Widget build(BuildContext context) {

    if(_text == null)
      _text = widget.text;

    // if widget is changed from non editable to editable, the focusNode has to be added.
    if(_focusNode == null)
      updateFocusNode();

    final TextStyle _textStyle = TextStyle(
        fontWeight: widget.fontWeight,
        fontSize: widget.fontSize,
        color: widget.textColor,
        fontStyle: widget.fontStyle,
        fontFamily: widget.fontFamily,
        fontFamilyFallback: widget.fontFamilyFallback,
        letterSpacing: widget.letterSpacing,
        wordSpacing: widget.wordSpacing,
      );

    //  TODO: editable and non editable does not behave the same way. Known differences: 
    //  - Editable constraints is set to max, while non editable is not

    // TODO: Focus is added before rebuild. Focus point is therefore not correct.

    if (widget.editable == true) {
      TextEditingController _controller = TextEditingController(text: _text);
      // DefaultTextStyle _defaultTextStyle = DefaultTextStyle.of(context);

      return EditableText(
        cursorOpacityAnimates: true,
        style: _textStyle,
        textAlign: widget.textAlign,
        maxLines: widget.maxLines,
        controller: _controller,
        focusNode: _focusNode,
        backgroundCursorColor: Colors.grey,
        cursorColor: Colors.black,
        keyboardType: widget.keyboardType,
        obscureText: widget.obscureText,
        onChanged: (value) {
          _text = value;
          widget.onChange(value);
        },
        onSelectionChanged: widget.onSelectionChange,
      );
    }

    return Text(
      _text,
      style: _textStyle,
      textAlign: widget.textAlign,
      maxLines: widget.maxLines,
    );
  }
}