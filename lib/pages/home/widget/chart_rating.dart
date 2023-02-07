import 'package:flutter/material.dart';
class ChartRating extends StatefulWidget {
  final String label;
  final int pct;
  const ChartRating({Key? key, required this.label, required this.pct}) : super(key: key);

  @override
  State<ChartRating> createState() => _ChartRatingState();
}

class _ChartRatingState extends State<ChartRating> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(widget.label, style: const TextStyle(
          fontSize: 15,
          color: Colors.black
        )),
        const SizedBox(width: 8),
        const Icon(Icons.star, color: Colors.amber),
        SizedBox(
          width: 160,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
            child:
            Stack(
                children: [
                  Container(
                    height: 10,
                    width: MediaQuery.of(context).size.width * 0.7,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: const Text(''),
                  ),
                  Container(
                    height: 10,
                    width: MediaQuery.of(context).size.width * (widget.pct/100) * 0.7,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: const Text(''),
                  ),
                ]
            ),
          ),
        ),
        Text('${widget.pct}%', style: const TextStyle(
            fontSize: 15,
            color: Colors.black
        )),
      ],
    );
  }
}
