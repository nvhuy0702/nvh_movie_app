import 'package:flutter/material.dart';

import 'otp_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  bool isSelected = false;

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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Image(
                height: 300,
                width: 200,
                image: AssetImage("assets/images/forgot_pass.png"),
              ),
              const Text(
                "Chọn phương thức để đặt lại mật khẩu của bạn",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 12,
              ),
              _buildSelectedOption(
                  onTap: () {
                    setState(() {
                      isSelected = !isSelected;
                    });
                  },
                  index: isSelected,
                  child: Image.asset("assets/images/sms.png"),
                  title: "Thông qua tin nhắn",
                  content: "+84 939498584"),
              const SizedBox(
                height: 12,
              ),
              _buildSelectedOption(
                onTap: () {
                  setState(() {
                    isSelected = !isSelected;
                  });
                },
                index: !isSelected,
                child: const Icon(
                  Icons.email_outlined,
                  color: Color(0xFF2B3467),
                  size: 45,
                ),
                title: "Thông qua email",
                content: "Nkhuy722@gmail.com",
              ),
              const SizedBox(
                height: 24,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const OTPScreen())
                  );
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
      ),
    );
  }

  Widget _buildSelectedOption(
      {void Function()? onTap,
      Widget? child,
      String? title,
      String? content,
      bool index = false}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding:
            const EdgeInsets.only(left: 32, top: 16, right: 16, bottom: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: index ? Colors.grey : const Color(0xFF2B3467),
            width: index ? 0.5 : 2.5,
          ),
          shape: BoxShape.rectangle,
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                  color: Color(0xFFFCFFE7),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        color: Color(0xFFF2CD5C),
                        blurRadius: 4,
                        offset: Offset(2, -1))
                  ]),
              child: child,
            ),
            const SizedBox(
              width: 12,
            ),
            RichText(
              text: TextSpan(
                text: '$title \n',
                style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                children: <TextSpan>[
                  TextSpan(
                    text: content,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
