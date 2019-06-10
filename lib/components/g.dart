class G {
  static Map onTap(Function function) {
    final Map<String, dynamic> output = {
      'property': 'onTap',
      'function': function ?? () => null,
    };
    return output;
  }
}
