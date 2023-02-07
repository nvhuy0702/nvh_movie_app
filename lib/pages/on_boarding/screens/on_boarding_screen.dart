import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nvh_movie_app/pages/sign_in/screens/sign_in_screen.dart';
import 'package:nvh_movie_app/pages/sign_up/screens/sign_up_screen.dart';

import '../../../data/repository/auth_repository.dart';
import '../../sign_up/bloc/auth_bloc.dart';
import '../../sign_up/bloc/sign_up_cubit.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 24,),
            Image.asset("assets/images/bg_start.png"),
            _selectedAccount(
              title: "Đăng nhập với Facebook",
              pathLogo: "assets/images/facebook.png",
            ),
            _selectedAccount(
              title: "Đăng nhập với Google",
              pathLogo: "assets/images/google.png",
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                        margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                        child: const Divider(
                          color: Colors.black,
                          height: 36,
                        )),
                  ),
                  const Text("OR"),
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ElevatedButton(
                onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const SignInScreen())),
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.all(16),
                    backgroundColor: const Color(0xff2B3467)),
                child: const Text(
                  "Đăng nhập với mật khẩu",
                  style: TextStyle(fontSize: 18),
                ),
              ),
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
                                builder: (_) => BlocProvider(
                                  create: (context) => AuthBloc(AuthRepository()),
                                  child: const SignUpScreen(),
                                ),
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
    );
  }

  Widget _selectedAccount(
          {String? pathLogo, String? title, void Function()? onTap}) =>
      InkWell(
        onTap: onTap,
        child: Column(
          children: [
            const SizedBox(
              height: 12,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    child: Image.asset(
                      pathLogo ?? "",
                      fit: BoxFit.fill,
                      height: 40,
                      width: 40,
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Text(
                    title ?? "",
                    style: const TextStyle(fontSize: 16),
                  )
                ],
              ),
            ),
          ],
        ),
      );
}
