class Validators {
  static String? validateRequired(num? value, String fieldName) {
    if (value == null) {
      return '	$fieldName is required';
    }
    if (value <= 0) {
      return '	$fieldName must be greater than zero';
    }
    return null;
  }
}
