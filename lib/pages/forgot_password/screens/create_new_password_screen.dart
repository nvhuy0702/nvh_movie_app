import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

import '../../../utils/validate.dart';
import '../../sign_in/screens/sign_in_screen.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  const CreateNewPasswordScreen({Key? key}) : super(key: key);

  @override
  State<CreateNewPasswordScreen> createState() =>
      _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  final _passwordController = TextEditingController();
  final _focusNodePassWord = FocusNode();
  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Tạo mật khẩu mới",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Image(
              image: AssetImage(
                "assets/images/new_pass.png",
              ),
            ),
            const Text(
              "Tạo mật khẩu mới của bạn",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 12,
            ),
            _buildTextFormField(
              controller: _passwordController,
              labelText: "Mật khẩu",
              validator: (value) {
                String? err = Validate.validatePassword(value);
                if (err != null) {
                  _focusNodePassWord.requestFocus();
                }
                return err;
              },
              obscureText: isObscureText,
              prefixIcon: const Icon(
                Icons.lock_outline,
              ),
              suffixIcon: IconButton(
                onPressed: () => setState(() {
                  isObscureText = !isObscureText;
                }),
                icon: Icon(
                  isObscureText ? Icons.visibility_off : Icons.visibility,
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            _buildTextFormField(
              controller: _passwordController,
              labelText: "Xác nhận lại mật khẩu",
              validator: (value) {
                String? err = Validate.validatePassword(value);
                if (err != null) {
                  _focusNodePassWord.requestFocus();
                }
                return err;
              },
              obscureText: isObscureText,
              prefixIcon: const Icon(
                Icons.lock_outline,
              ),
              suffixIcon: IconButton(
                onPressed: () => setState(() {
                  isObscureText = !isObscureText;
                }),
                icon: Icon(
                  isObscureText ? Icons.visibility_off : Icons.visibility,
                ),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            ElevatedButton(
              onPressed: () {
                AwesomeDialog(
                  context: context,
                  dialogType: DialogType.success,
                  headerAnimationLoop: false,
                  animType: AnimType.bottomSlide,
                  title: 'Thành công',
                  desc: 'Tài khoản của bạn đã sẵn sàng sử dụng',
                  buttonsTextStyle: const TextStyle(color: Colors.black),
                  showCloseIcon: true,
                  btnOkOnPress: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (_) => const SignInScreen()));
                  },
                ).show();
              },
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.all(16),
                  backgroundColor: const Color(0xff2B3467)),
              child: const Text(
                "Tiếp tục",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextFormField(
      {String? labelText,
      Widget? prefixIcon,
      Widget? suffixIcon,
      bool obscureText = false,
      TextEditingController? controller,
      void Function(String)? onChanged,
      String? Function(String?)? validator}) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFF2B3467), width: 2.0),
          borderRadius: BorderRadius.circular(25.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFF2B3467), width: 2.0),
          borderRadius: BorderRadius.circular(25.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey, width: 2.0),
          borderRadius: BorderRadius.circular(25.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFFEB455F), width: 2.0),
          borderRadius: BorderRadius.circular(25.0),
        ),
        labelText: labelText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
      obscureText: obscureText,
      onChanged: onChanged,
      validator: validator,
    );
  }
}
