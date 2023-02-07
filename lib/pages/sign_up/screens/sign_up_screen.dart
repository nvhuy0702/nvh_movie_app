import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nvh_movie_app/pages/sign_up/bloc/auth_bloc.dart';
import 'package:nvh_movie_app/utils/validate.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../on_boarding/screens/on_boarding_screen.dart';
import '../../sign_in/screens/sign_in_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

 //AuthBloc get _authBloc => context.read();
  final _focusNodePassWord = FocusNode();
  final _emailFocus = FocusNode();
  bool isObscureText = true;
  bool isTest = false;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  late SharedPreferences prefs;
  String? name;

  @override
  void initState() {
    setState(() {
      retrieve();
    });
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  save() async {
    prefs = await SharedPreferences.getInstance();
    prefs.setString("username", _emailController.text.toString());
  }

  retrieve() async {
    prefs = await SharedPreferences.getInstance();
    _emailController.text = prefs.getString("username") ?? "";
    setState(() {});
  }

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
      body: /*BlocConsumer<AuthBloc, AuthState>(
        bloc: _authBloc,
        listener: (context, state) {
          if (state is Authenticated) {
            // Navigating to the dashboard screen if the user is authenticated
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const OnBoardingScreen(),
              ),
            );
          }
          if (state is AuthError) {
            // Displaying the error message if the user is not authenticated
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        builder: (context, state) {
          if (state is Loading) {
            // Displaying the loading indicator while the user is signing up
            return const Center(child: CircularProgressIndicator());
          }
          if(state is UnAuthenticated) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Center(
                      child: Text(
                        'Tạo tài khoản',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          _buildTextFormField(
                            controller: _emailController,
                            labelText: "Tài khoản",
                            validator: (value) {
                              String? err = Validate.validateEmail(value);
                              if (err != null) {
                                _emailFocus.requestFocus();
                              }
                              return err;
                            },
                            prefixIcon: const Icon(
                              Icons.mail_outline,
                            ),
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
                              onPressed: () =>
                                  setState(() {
                                    isObscureText = !isObscureText;
                                  }),
                              icon: Icon(
                                isObscureText
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    CheckboxListTile(
                      contentPadding: EdgeInsets.zero,
                      controlAffinity: ListTileControlAffinity.leading,
                      visualDensity: VisualDensity.compact,
                      title: const Text('Nhớ tài khoản và mật khẩu'),
                      value: isTest,
                      onChanged: (bool? value) {
                        setState(() {
                          isTest = value!;
                          isTest ? save() : null;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState?.validate() == true) {
                            BlocProvider.of<AuthBloc>(context).add(
                              SignUpEvent(
                                email: _emailController.text,
                                password: _passwordController.text,
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: const EdgeInsets.all(16),
                            backgroundColor: const Color(0xff2B3467)),
                        child: const Text(
                          "Đăng ký",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                                margin: const EdgeInsets.only(
                                    left: 10.0, right: 20.0),
                                child: const Divider(
                                  color: Colors.black,
                                  height: 36,
                                )),
                          ),
                          const Text("Hoặc tiếp tục với"),
                          Expanded(
                            child: Container(
                              margin:
                              const EdgeInsets.only(left: 20.0, right: 10.0),
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
                          text: 'Bạn đã có tài khoản ? ',
                          style: const TextStyle(color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Đăng nhập',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xff2B3467),
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () =>
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (_) => const SignInScreen(),
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
          return Container();
        },
      )*/Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                child: Text(
                  'Tạo tài khoản',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    _buildTextFormField(
                      controller: _emailController,
                      labelText: "Tài khoản",
                      validator: (value) {
                        String? err = Validate.validateEmail(value);
                        if (err != null) {
                          _emailFocus.requestFocus();
                        }
                        return err;
                      },
                      prefixIcon: const Icon(
                        Icons.mail_outline,
                      ),
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
                        onPressed: () =>
                            setState(() {
                              isObscureText = !isObscureText;
                            }),
                        icon: Icon(
                          isObscureText
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              CheckboxListTile(
                contentPadding: EdgeInsets.zero,
                controlAffinity: ListTileControlAffinity.leading,
                visualDensity: VisualDensity.compact,
                title: const Text('Nhớ tài khoản và mật khẩu'),
                value: isTest,
                onChanged: (bool? value) {
                  setState(() {
                    isTest = value!;
                    isTest ? save() : null;
                  });
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() == true) {
                      BlocProvider.of<AuthBloc>(context).add(
                        SignUpEvent(
                          email: _emailController.text,
                          password: _passwordController.text,
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.all(16),
                      backgroundColor: const Color(0xff2B3467)),
                  child: const Text(
                    "Đăng ký",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                          margin: const EdgeInsets.only(
                              left: 10.0, right: 20.0),
                          child: const Divider(
                            color: Colors.black,
                            height: 36,
                          )),
                    ),
                    const Text("Hoặc tiếp tục với"),
                    Expanded(
                      child: Container(
                        margin:
                        const EdgeInsets.only(left: 20.0, right: 10.0),
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
                    text: 'Bạn đã có tài khoản ? ',
                    style: const TextStyle(color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Đăng nhập',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff2B3467),
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () =>
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => const SignInScreen(),
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

  Widget _buildTextFormField({String? labelText,
    Widget? prefixIcon,
    Widget? suffixIcon,
    bool obscureText = false,
    TextEditingController? controller,
    void Function(String)? onChanged,
    String? Function(String?)? validator}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
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
      ),
    );
  }
}
