import 'package:flutter/material.dart';
class MoreLikeThis extends StatefulWidget {
  const MoreLikeThis({Key? key}) : super(key: key);

  @override
  State<MoreLikeThis> createState() => _MoreLikeThisState();
}

class _MoreLikeThisState extends State<MoreLikeThis> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate:
        const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 0.7,
        ),
        itemCount: 10,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext ctx, index) {
          return Stack(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(
                    horizontal: 8),
                decoration: BoxDecoration(
                    borderRadius:
                    BorderRadius.circular(5),
                    image: const DecorationImage(
                        image: AssetImage(
                            "assets/images/dr_strange.jpg"),
                        fit: BoxFit.cover)),
              ),
              Container(
                padding: const EdgeInsets.all(5),
                margin: const EdgeInsets.only(left: 8),
                decoration: BoxDecoration(
                    color: const Color(0xFFEB455F),
                    borderRadius:
                    BorderRadius.circular(5)),
                child: const Text(
                  "7.4",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white),
                ),
              )
            ],
          );
        });
  }
}
