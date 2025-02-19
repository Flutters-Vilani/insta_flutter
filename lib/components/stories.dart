import 'package:flutter/material.dart';

class Stories extends StatefulWidget {
  const Stories({super.key});

  @override
  State<Stories> createState() => _StoriesState();
}

class _StoriesState extends State<Stories> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 100,
          width: MediaQuery.of(context).size.width * 1,
          child: ListView.builder(
            padding: const EdgeInsets.only(right: 10),
            scrollDirection: Axis.horizontal,
            itemCount: 9,
            itemBuilder: (ctx, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(100),
                        gradient: const LinearGradient(
                          colors: [
                            Colors.purple,
                            Colors.pink,
                            Colors.orange,
                            Colors.yellow,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(
                            4.0), // Espaço para o gradiente aparecer
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.white, // Fundo branco
                            borderRadius: BorderRadius.circular(100 - 4),
                          ),
                          child: ClipOval(
                            child: Image.asset(
                              'assets/images/gui_profile.jpeg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    index == 0
                        ? Positioned(
                            bottom: 10,
                            right: 5,
                            child: Container(
                              width: 25,
                              height: 25,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          )
                        : Container()
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
