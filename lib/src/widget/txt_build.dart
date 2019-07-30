import 'package:flutter/material.dart';

class TxtBuild extends StatelessWidget {

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
  final void Function(String) onChange;
  final void Function(TextSelection, SelectionChangedCause) onSelectionChange;

  @override
  Widget build(BuildContext context) {
    final TextStyle _textStyle = TextStyle(
        fontWeight: fontWeight,
        fontSize: fontSize,
        color: textColor,
        fontStyle: fontStyle,
        fontFamily: fontFamily,
        fontFamilyFallback: fontFamilyFallback,
        letterSpacing: letterSpacing,
        wordSpacing: wordSpacing,
      );

    //  TODO: editable and non editable does not behave the same way. Known differences: 
    //  - Editable constraints is set to max, while non editable is not

    if (editable == true) {
      // TODO: Text resets when widgetTree is rebuilt
      TextEditingController _controller = TextEditingController(text: text);
      // DefaultTextStyle _defaultTextStyle = DefaultTextStyle.of(context);

      return EditableText(
          cursorOpacityAnimates: true,
          style: _textStyle,
          textAlign: textAlign,
          maxLines: maxLines,
          controller: _controller,
          focusNode: focusNode,
          backgroundCursorColor: Colors.grey,
          cursorColor: Colors.black,
          keyboardType: keyboardType,
          onChanged: onChange,
          onSelectionChanged: onSelectionChange,
        );
    }

    return Text(
      text,
      style: _textStyle,
      textAlign: textAlign,
      maxLines: maxLines,
    );
  }
}