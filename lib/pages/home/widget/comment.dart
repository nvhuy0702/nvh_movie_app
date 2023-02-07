import 'package:flutter/material.dart';
class CommentWidget extends StatefulWidget {
  final String? description;
  const CommentWidget({Key? key, this.description}) : super(key: key);

  @override
  State<CommentWidget> createState() => _CommentWidgetState();
}

class _CommentWidgetState extends State<CommentWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16,),
        Row(
          mainAxisAlignment:
          MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              "72 Bình luận",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Text(
              "Xem tất cả",
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
        const SizedBox(height: 16,),
        Row(
          mainAxisAlignment:
          MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(
                          "assets/images/avatar.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 24,
                ),
                const Text(
                  "Nguyễn Văn Huy",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Image.asset(
              "assets/images/view_more.png",
              width: 30,
              height: 30,
            )
          ],
        ),
        const SizedBox(height: 16,),
        Text(widget.description ?? "",
        ),
        const SizedBox(height: 16,),
        Row(
          children: const [
            Icon(
              Icons.favorite,
              color: Colors.red,
            ),
            SizedBox(width: 8,),
            Text('72'),
            SizedBox(width: 24,),
            Text('1 ngày trước'),
            SizedBox(width: 24,),
            Text('Trả lời')
          ],
        )
      ],
    );
  }
}
