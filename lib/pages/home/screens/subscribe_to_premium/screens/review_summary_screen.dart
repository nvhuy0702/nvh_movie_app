import 'package:flutter/material.dart';
class ReviewSummaryScreen extends StatefulWidget {
  const ReviewSummaryScreen({Key? key}) : super(key: key);

  @override
  State<ReviewSummaryScreen> createState() => _ReviewSummaryScreenState();
}

class _ReviewSummaryScreenState extends State<ReviewSummaryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Đánh giá tóm tắt",
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
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
                    text: '\$9.99 ',
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                    children: <TextSpan>[
                      TextSpan(
                        text: '/tháng',
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
          )
        ],
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
