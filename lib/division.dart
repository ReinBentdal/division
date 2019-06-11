library division;

export 'src/division.dart';
export 'src/g.dart';
export 'src/s.dart';

//  Models for more robust code
//
//  # Example 
//
//  List<StyleItem> = [ S.margin(all: 10.0) ]
//
//  instead of
//
//  List<StyleItem> = [ S.margin(all: 10.0) ]
//
//  This prevents unnessesary errors with the wrong values inside a List
export 'src/style_item.dart';
export 'src/gesture_item.dart';