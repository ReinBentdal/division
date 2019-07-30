import 'package:flutter/material.dart';

import 'style_class.dart';

class TxtStyle extends StyleClass {

  FontWeight $fontWeight;
  TextAlign $textAlign = TextAlign.start;
  FontStyle $fontStyle = FontStyle.normal;
  String $fontFamily;
  List<String> $fontFamilyFallback;
  double $fontSize;
  Color $textColor;
  int $maxLines;
  double $letterSpacing;
  double $wordSpacing;

  // editable text input properties
  bool $editable = false;
  TextInputType $keyboardType;
  String $placeholder;
  void Function(String) $onChange;
  void Function(bool focus) $onFocusChange;
  void Function(TextSelection, SelectionChangedCause)
      $onSelectionChange; // TODO: not working (only tested on android emulator)
  // static FocusNode $focusNode;
  FocusNode $focusNode;

  void bold([bool enable = true]) {
    if (enable == true) $fontWeight = FontWeight.bold;
  }

  void italic([bool enable = true]) {
    if (enable == true) $fontStyle = FontStyle.italic;
  }

  // TODO: change to weight.bold(), weight.400(), etc
  void weight(FontWeight weight) {
    $fontWeight = weight;
  }

  // TODO: Change to `size()`?
  void fontSize(double fontSize) {
    $fontSize = fontSize;
  }

  void fontFamily(String font, {List<String> fontFamilyFallback}) {
    $fontFamily = font;
    $fontFamilyFallback = fontFamilyFallback;
  }

  void color(Color textColor) {
    $textColor = textColor;
  }

  // TODO: change to textAlign.center(), textAlign.start(), etc
  // TextAlignModel textAlign = TextAlignModel();
  void textAlign(TextAlign alignment) {
    $textAlign = alignment;
  }

  void maxLines(int maxLines) {
    $maxLines = maxLines;
  }

  void letterSpacing(double space) {
    $letterSpacing = space;
  }

  void wordSpacing(double space) {
    $wordSpacing = space;
  }

  /// Make the widget editable just like a TextField.
  /// 
  /// If `focusNode` isnt spesified an internal `focusNode` will be created.
  void editable(bool enable,
      {TextInputType keyboardType,
      void Function(String) onChange,
      void Function(bool focus) onFocusChange,
      void Function(TextSelection, SelectionChangedCause) onSelectionChange,
      FocusNode focusNode}) {

    _initializeFocusNode(focusNode);

    $editable = enable;
    $keyboardType = keyboardType;
    $onFocusChange = onFocusChange;
    $onChange = onChange;
    $onSelectionChange = onSelectionChange;
  }

  /// Initialize editable text FocusNode. 
  /// 
  /// If a focus node isnt spesified in the `editable` method, a new FocusNode instance will be created.
  /// A listener is attatched to trigger the `onFocusChange` function.
  void _initializeFocusNode([FocusNode focusNode]) {

    // if no focus node is given, a new focus node will be initialized
    $focusNode = focusNode ?? FocusNode();

    $focusNode.addListener(() {
      if ($onFocusChange != null) $onFocusChange($focusNode.hasFocus);
    });
  }
}