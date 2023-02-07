import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../forgot_password/screens/forgot_password_screen.dart';
import '../../home/screens/home_screen.dart';
import '../../sign_up/screens/sign_up_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                child: Text(
                  'Đăng nhập với tài khoản',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              _buildTextFormField(
                labelText: "Tài khoản",
                prefixIcon: const Icon(
                  Icons.mail_outline,
                ),
              ),
              _buildTextFormField(
                  labelText: "Mật khẩu",
                  prefixIcon: const Icon(
                    Icons.lock_outline,
                  ),
                  suffixIcon: const Icon(Icons.visibility_off)),
              CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                visualDensity: VisualDensity.compact,
                title: const Text('Nhớ mật khẩu'),
                value: false,
                onChanged: (bool? value) {
                  setState(() {});
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const HomeScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.all(16),
                      backgroundColor: const Color(0xff2B3467)),
                  child: const Text(
                    "Đăng nhập",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 24.0, bottom: 8),
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const ForgotPasswordScreen(),
                        ),
                      );
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: const Size(50, 0),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      alignment: Alignment.centerLeft,
                    ),
                    child: const Text('Quên mật khẩu ?'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                          margin:
                              const EdgeInsets.only(left: 10.0, right: 20.0),
                          child: const Divider(
                            color: Colors.black,
                            height: 36,
                          )),
                    ),
                    const Text("Hoặc tiếp tục với"),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(left: 20.0, right: 10.0),
                        child: const Divider(
                          color: Colors.black,
                          height: 36,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildOptionLogin(pathLogo: "assets/images/facebook.png"),
                  const SizedBox(
                    width: 10,
                  ),
                  buildOptionLogin(pathLogo: "assets/images/google.png"),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.center,
                child: RichText(
                  text: TextSpan(
                    text: 'Bạn chưa có tài khoản ? ',
                    style: const TextStyle(color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Đăng ký',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff2B3467),
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => const SignUpScreen(),
                                ),
                              ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildOptionLogin({String? pathLogo, void Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.withOpacity(0.3)),
            borderRadius: BorderRadius.circular(10)),
        child: Image.asset(
          pathLogo ?? "",
          width: 30,
          height: 30,
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Widget _buildTextFormField(
      {String? labelText,
      Widget? prefixIcon,
      Widget? suffixIcon,
      void Function(String)? onChanged,
      String? Function(String?)? validator}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
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
        onChanged: onChanged,
        validator: validator,
      ),
    );
  }
}
