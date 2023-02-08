import 'package:flutter/material.dart';
import 'package:nvh_movie_app/pages/home/screens/subscribe_to_premium/screens/review_summary_screen.dart';

import 'add_new_card_screen.dart';

enum TypePayment { paypal, googlePay, applePay }

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  TypePayment? _character = TypePayment.paypal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Thanh toán",
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.qr_code,
              color: Colors.black,
            ),
          )
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 32.0, right: 16, left: 16),
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const ReviewSummaryScreen()));
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
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 48,
            ),
            const Text(
              textAlign: TextAlign.center,
              "Chọn phương thức thanh toán bạn muốn sử dụng",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            buildContainer(
                title: "Paypal",
                pathIcon: "assets/images/paypal.png",
                value: TypePayment.paypal,
                groupValue: _character,
                onChanged: (TypePayment? value) {
                  setState(() {
                    _character = value;
                  });
                }),
            const SizedBox(
              height: 24,
            ),
            buildContainer(
                title: "Google Pay",
                pathIcon: "assets/images/google_pay.jpeg",
                value: TypePayment.googlePay,
                groupValue: _character,
                onChanged: (TypePayment? value) {
                  setState(() {
                    _character = value;
                  });
                }),
            const SizedBox(
              height: 24,
            ),
            buildContainer(
                title: "Apple Pay",
                pathIcon: "assets/images/apple_pay.png",
                value: TypePayment.applePay,
                groupValue: _character,
                onChanged: (TypePayment? value) {
                  setState(() {
                    _character = value;
                  });
                }),
            const SizedBox(
              height: 32,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => const AddNewCardScreen()));
              },
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.all(16),
                  backgroundColor: const Color(0xff2B3467)),
              child: const Text(
                "Thêm thẻ mới",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildContainer(
      {required String pathIcon,
      required String title,
      required TypePayment value,
      TypePayment? groupValue,
      required void Function(TypePayment?)? onChanged}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color(0xFF2B3467), width: 2)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                pathIcon,
                height: 40,
                width: 40,
              ),
              Text(
                title,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )
            ],
          ),
          Radio<TypePayment>(
            value: value,
            groupValue: groupValue,
            onChanged: onChanged,
          )
        ],
      ),
    );
  }
}
