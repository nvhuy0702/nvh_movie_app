import 'package:flutter/material.dart';
import 'package:nvh_movie_app/pages/home/screens/subscribe_to_premium/screens/payment_screen.dart';

class SubscribePremiumScreen extends StatefulWidget {
  const SubscribePremiumScreen({Key? key}) : super(key: key);

  @override
  State<SubscribePremiumScreen> createState() => _SubscribePremiumScreenState();
}

class _SubscribePremiumScreenState extends State<SubscribePremiumScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 48,
            ),
            const Text(
              "Đăng ký Premium",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2B3467),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            const Text(
              "Thỏa thích xem phim Full-HD\n mà không có hạn chế và không có quảng cáo",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            buildContainer(
              price: 9.99,
              time: "tháng",
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_)=> const PaymentScreen()))
            ),
            const SizedBox(
              height: 12,
            ),
            const SizedBox(
              height: 12,
            ),
            buildContainer(
              price :99.99,
              time: "năm",
            )
          ],
        ),
      ),
    );
  }

  Widget buildContainer({double? price, String? time,void Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 230,
        width: 400,
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFF2B3467), width: 2),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Image.asset(
              "assets/images/crown.png",
              width: 70,
              height: 70,
            ),
            RichText(
              text: TextSpan(
                text: '\$$price ',
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
                children: <TextSpan>[
                  TextSpan(
                    text: '/$time',
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 20,
                        color: Colors.black.withOpacity(0.6)),
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 1,
              endIndent: 16,
              indent: 16,
            ),
            const SizedBox(
              height: 10,
            ),
            buildRow("Xem tất cả những gì bạn muốn. Quảng cáo miễn phí."),
            buildRow("Cho phép phát trực tuyến 4K."),
            buildRow("Chất lượng video và âm thanh tốt hơn."),
          ],
        ),
      ),
    );
  }

  Widget buildRow(String content) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.check,
            color: Colors.red,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(content)
        ],
      ),
    );
  }
}
