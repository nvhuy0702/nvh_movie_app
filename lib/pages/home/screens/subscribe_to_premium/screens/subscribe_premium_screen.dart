import 'package:flutter/material.dart';
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
      body: Column(
        children: [

        ],
      ),
    );
  }
}
