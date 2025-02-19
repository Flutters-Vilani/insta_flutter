import 'package:flutter/material.dart';

import '../direct_screen.dart';

class AppBarPersonalizado extends StatefulWidget {
  const AppBarPersonalizado({super.key});

  @override
  State<AppBarPersonalizado> createState() => _AppBarPersonalizadoState();
}

class _AppBarPersonalizadoState extends State<AppBarPersonalizado> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'assets/images/instaLogo.png',
            height: 65,
            width: 180,
          ),
          Row(
            children: [
              const Icon(
                Icons.favorite_border,
                size: 30,
              ),
              const SizedBox(
                width: 16,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => const DirectScreen()));
                },
                child: const Icon(
                  Icons.send,
                  size: 30,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
