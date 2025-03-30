import 'package:flutter/material.dart';

class CurrencyCard extends StatelessWidget {
  final bool isInverted;

  const CurrencyCard({super.key, required this.isInverted});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: isInverted ? Colors.grey : Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(40),
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'EURO',
                style: TextStyle(
                  color: isInverted ? Colors.white : Colors.black,
                ),
              ),
              Text(
                '123 EUR',
                style: TextStyle(
                  color: isInverted ? Colors.white : Colors.black,
                ),
              ),
            ],
          ),
          Transform.translate(
            offset: const Offset(0, 30),
            child: Transform.scale(
              scale: 2.2,
              child: Icon(
                Icons.euro_symbol_outlined,
                size: 88,
                color: isInverted ? Colors.white : Colors.black,
              ),
            ),
          )
        ],
      ),
    );
  }
}
