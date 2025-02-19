import 'package:flutter/material.dart';

import 'components/app_bar.dart';
import 'components/stories.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppBarPersonalizado(),
          Stories(),
          postFeed(),
        ],
      ),
    );
  }

  postFeed() {
    dynamic imagemNetwork = 'assets/images/gui_feed.jpeg';
    dynamic imagemGuiNetwork = 'assets/images/gui_profile.jpeg';

    bool liked = false;

    int qtdeLikes = 99;
    return Container(
      child: ListView.builder(
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 2,
        itemBuilder: (ctx, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8, top: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10, left: 10),
                      child: ClipOval(
                        child: Image.asset(
                          imagemGuiNetwork,
                          height: 45,
                          width: 45,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Text(
                      'gui.vilani',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(
                          right: 24,
                        ),
                        alignment: Alignment.centerRight,
                        child: Icon(Icons.more_horiz),
                      ),
                    )
                  ],
                ),
              ),
              //Imagem
              Image.asset(
                imagemNetwork,
              ),
              // Botoes de like e comentários
              Padding(
                padding: const EdgeInsets.only(top: 15, left: 5),
                child: Row(
                  children: [
                    liked
                        ? InkWell(
                            onTap: () {
                              setState(() {
                                liked = !liked;
                                qtdeLikes -= 1;

                                print(qtdeLikes);
                              });
                            },
                            child: Icon(
                              Icons.favorite,
                              size: 35,
                              color: Colors.red,
                            ),
                          )
                        : InkWell(
                            onTap: () {
                              setState(() {
                                liked = !liked;
                                qtdeLikes += 1;

                                print(qtdeLikes);
                              });
                            },
                            child: const Icon(
                              Icons.favorite_border_outlined,
                              size: 35,
                            ),
                          ),
                    const SizedBox(
                      width: 10,
                    ),
                    Image.asset(
                      'assets/images/comentario.png',
                      height: 27,
                      // width: 30,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10, top: 15),
                child: Text(
                  '${qtdeLikes} curtidas',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 15),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
