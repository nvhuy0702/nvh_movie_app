import 'package:awesome_dialog/awesome_dialog.dart';
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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 32,
              ),
              Container(
                padding: const EdgeInsets.only(
                    left: 16, right: 16, bottom: 16, top: 8),
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
                    buildRow(
                        "Xem tất cả những gì bạn muốn. Quảng cáo miễn phí."),
                    buildRow("Cho phép phát trực tuyến 4K."),
                    buildRow("Chất lượng video và âm thanh tốt hơn."),
                  ],
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: const Color(0xFFBAD7E9).withOpacity(0.3),
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  children: [
                    _infoBill(title: "Giá", price: 9.99),
                    const SizedBox(
                      height: 24,
                    ),
                    _infoBill(title: "Thuế", price: 1.99),
                    const SizedBox(
                      height: 12,
                    ),
                    const Divider(
                      thickness: 1,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    _infoBill(title: "Tổng cộng", price: 11.99),
                  ],
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: const Color(0xFFBAD7E9).withOpacity(0.3),
                    borderRadius: BorderRadius.circular(12)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          "assets/images/master_card.png",
                          height: 70,
                          width: 70,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Text(
                          "•••• •••• •••• 0702",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Thay đổi",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff2B3467),
                            fontSize: 18),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              ElevatedButton(
                onPressed: () {
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.success,
                    headerAnimationLoop: false,
                    animType: AnimType.bottomSlide,
                    title: 'Thành công',
                    desc: 'Bạn đã đăng ký thành công 1 tháng premium. Hãy tận hưởng những lợi ích!',
                    buttonsTextStyle: const TextStyle(color: Colors.black),
                    showCloseIcon: true,
                    btnOkOnPress: () {},
                  ).show();
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.all(16),
                  backgroundColor: const Color(0xff2B3467),
                ),
                child: const Text(
                  "Xác nhận thanh toán",
                  style: TextStyle(fontSize: 18),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _infoBill({String? title, double? price}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title ?? "",
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
        Text(
          "\$$price",
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
      ],
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
          Expanded(child: Text(content))
        ],
      ),
    );
  }
}
