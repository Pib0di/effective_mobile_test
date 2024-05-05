extension WithSpaces on int {
  String withSpaces() {
    final numberString = toString();
    var result = '';

    final length = numberString.length;
    for (var i = 0; i < length; i++) {
      if (i > 0 && (length - i) % 3 == 0) {
        result += ' ';
      }
      result += numberString[i];
    }

    return result;
  }
}
