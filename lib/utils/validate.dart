class Validate {
  static String? validateEmail(String? value) {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty) {
      return 'Tài khoản không được để trống';
    } else if (!regex.hasMatch(value)) {
      return "Tài khoản chưa hợp lệ";
    } else {
      return null;
    }
  }
  static String? validatePassword(String? value) {
    String pattern =
        r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,}$";
    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty) {
      return 'Mật khẩu không được để trống';
    }
    if (value.length < 6) {
      return "Độ dài phải lớn hơn hoặc bằng 6";
    }
    if (!regex.hasMatch(value)) {
      return "Mật khẩu phải chứa 1 ký tự viết hoa, chữ thường và ký tự đặc biệt";
    }
    return null;
  }
}