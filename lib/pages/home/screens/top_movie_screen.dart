import 'package:flutter/material.dart';

class TopMoviesScreen extends StatefulWidget {
  const TopMoviesScreen({Key? key}) : super(key: key);

  @override
  State<TopMoviesScreen> createState() => _TopMoviesScreenState();
}

class _TopMoviesScreenState extends State<TopMoviesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "10 bộ phim trong tuần này",
          style: TextStyle(color: Colors.black),
        ),
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
      backgroundColor: Colors.white,
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 400,
            childAspectRatio: 0.7,
          ),
          itemCount: 10,
          itemBuilder: (BuildContext ctx, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        image: const DecorationImage(
                            image: AssetImage("assets/images/dr_strange.jpg"),
                            fit: BoxFit.cover)),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.only(left: 8),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEB455F),
                      borderRadius: BorderRadius.circular(5)
                    ),
                    child: const Text(
                      "7.4",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white
                      ),
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}
