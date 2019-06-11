import '../model/gesture_item.dart';

// A class containing all gesture functions for the Division widget
class G {
  static GestureItem onTap(Function function) {
    return GestureItem(property: 'onTap', function: function ?? () => null);
  }
}
