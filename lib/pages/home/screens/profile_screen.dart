import 'package:flutter/material.dart';
import 'package:nvh_movie_app/pages/home/screens/subscribe_to_premium/screens/subscribe_premium_screen.dart';

import '../widget/avatar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).viewInsets.top + kToolbarHeight),
                DisplayImage(
                  imagePath: 'assets/images/avatar.png',
                  onPressed: () {},
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    text: "Văn Huy\n",
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'nkhuy1@mailinator.com',
                        style: TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 16),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                InkWell(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const SubscribePremiumScreen())),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: const Color(0xFF2B3467),
                        width: 2,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          "assets/images/crown.png",
                          width: 30,
                          height: 30,
                        ),
                        RichText(
                          textAlign: TextAlign.start,
                          text: const TextSpan(
                            text: "Tham gia gói Premium\n",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            children: [
                              TextSpan(
                                text:
                                    'Xem phim Full-HD,không hạn chế \nvà không có quảng cáo',
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Icon(Icons.arrow_forward_ios)
                      ],
                    ),
                  ),
                ),
                buildRow(
                  pathIcon: "assets/images/user.png",
                  title: "Chỉnh sửa hồ sơ"
                ),
                buildRow(
                    pathIcon: "assets/images/bell.png",
                    title: "Thông báo"
                ),
                buildRow(
                    pathIcon: "assets/images/download.png",
                    title: "Tải xuống"
                ),
                buildRow(
                    pathIcon: "assets/images/security.png",
                    title: "Bảo mật"
                ),
                buildRow(
                    pathIcon: "assets/images/language.png",
                    title: "Ngôn ngữ"
                ),
                buildRow(
                    pathIcon: "assets/images/night_mode.png",
                    title: "Dark mode"
                ),
                buildRow(
                    pathIcon: "assets/images/help_desk.png",
                    title: "Trung tâm hỗ trợ"
                ),
                buildRow(
                    pathIcon: "assets/images/exit.png",
                    title: "Thoát"
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildRow({String? pathIcon, String? title, TextStyle? styleTitle, void Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  pathIcon ?? "",
                  width: 25,
                  height: 25,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  title ?? "",
                  style: styleTitle,
                ),
              ],
            ),
            const Icon(Icons.arrow_forward_ios)
          ],
        ),
      ),
    );
  }
}
