import 'style_class.dart';


import '../model/alignment.dart';

class ParentStyle extends StyleClass {

  ParentStyle({bool useRadians = false}) : super(useRadians: useRadians);
  
  /// Alignment of the widget.
  AlignmentModel alignmentChild = AlignmentModel();

  // @override
  // void add(ParentStyle style, {bool override = false}) {

  // }
}