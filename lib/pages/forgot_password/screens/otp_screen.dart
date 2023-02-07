import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'create_new_password_screen.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Quên mật khẩu",
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
            const SizedBox(height: 32,),
            RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                text: 'Code đã được gửi đến ',
                style: TextStyle(fontSize: 18, color: Colors.black),
                children: <TextSpan>[
                  TextSpan(text: '+84 939498584', style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            const SizedBox(height: 24,),
            Theme(
              data: Theme.of(context).copyWith(
                inputDecorationTheme: const InputDecorationTheme(
                  errorBorder: InputBorder.none,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: PinCodeTextField(
                  appContext: context,
                  length: 6,
                  animationDuration: Duration.zero,
                  keyboardType: TextInputType.number,
                  autoFocus: true,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(12),
                    fieldHeight: 50,
                    fieldWidth: 40,
                    inactiveColor: const Color(0xFF999999),
                    inactiveFillColor: const Color(0xFF999999),
                    activeColor: const Color(0xFF999999),
                    activeFillColor: const Color(0xFFBAD7E9),
                  ),
                  onChanged: (String value) {},
                ),
              ),
            ),
            RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                text: 'Gửi lại mã sau ',
                style: TextStyle(fontSize: 14, color: Colors.black),
                children: <TextSpan>[
                  TextSpan(text: '55s', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFEB455F))),
                ],
              ),
            ),
            const SizedBox(height: 24,),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const CreateNewPasswordScreen())
                );
              },
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.all(16),
                  backgroundColor: const Color(0xff2B3467)),
              child: const Text(
                "Xác nhận",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
