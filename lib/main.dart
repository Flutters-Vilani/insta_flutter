import 'package:flutter/material.dart';
import 'package:insta_flutter/directScreen.dart';
import 'package:insta_flutter/teste.dart';

main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  // const Home({super.key});
  dynamic imagemNetwork = 'assets/images/gui_feed.jpeg';
  dynamic imagemGuiNetwork = 'assets/images/gui_profile.jpeg';

  bool liked = false;

  int qtdeLikes = 99;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(1),
            child: AppBar(
                // backgroundColor: Colors.red,
                )),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: 0,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  // size: 10,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                  // size: 10,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.add_box_outlined,
                  // size: 10,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.video_library,
                  // size: 10,
                ),
                label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "")
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              logoAndDirect(),
              Row(
                children: [
                  rowStories(),
                ],
              ),
              postFeed()
            ],
          ),
        ));
  }

  logoAndDirect() {
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
          Container(
            child: Row(
              children: [
                Icon(
                  Icons.favorite_border,
                  size: 30,
                ),
                SizedBox(
                  width: 16,
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (ctx) => DirectScreen()));
                  },
                  child: Icon(
                    Icons.send,
                    size: 30,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  rowStories() {
    return SizedBox(
      height: 100,
      width: MediaQuery.of(context).size.width * 1,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 9,
        itemBuilder: (ctx, index) {
          // return index == 0 ?
          return Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 191, 64, 191),
                      borderRadius: BorderRadius.all(Radius.circular(100))),
                  width: 90,
                  height: 90,
                ),
                ClipOval(
                  child: Container(
                    width: 84,
                    height: 84,
                    child: Image.asset(
                      widget.imagemGuiNetwork,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                index == 0
                    ? Positioned(
                        bottom: 5,
                        right: 0,
                        child: Container(
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                      )
                    : Container()
              ],
            ),
          );
          // : Padding(
          //     padding: const EdgeInsets.only(left: 10),
          //     child: Stack(
          //       alignment: Alignment.center,
          //       children: [
          //         Container(
          //           decoration: BoxDecoration(
          //               color: Color.fromARGB(255, 191, 64, 191),
          //               borderRadius:
          //                   BorderRadius.all(Radius.circular(100))),
          //           width: 70,
          //           height: 70,
          //         ),
          //         ClipOval(
          //           child: Container(
          //             width: 65,
          //             child: Image.asset(widget.imagemNetwork),
          //           ),
          //         )
          //       ],
          //     ),
          //   );
        },
      ),
    );
  }

  postFeed() {
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
                          widget.imagemGuiNetwork,
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
                widget.imagemNetwork,
              ),
              // Botoes de like e comentários
              Padding(
                padding: const EdgeInsets.only(top: 15, left: 5),
                child: Row(
                  children: [
                    widget.liked
                        ? InkWell(
                            onTap: () {
                              setState(() {
                                widget.liked = !widget.liked;
                                widget.qtdeLikes -= 1;

                                print(widget.qtdeLikes);
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
                                widget.liked = !widget.liked;
                                widget.qtdeLikes += 1;

                                print(widget.qtdeLikes);
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
                  '${widget.qtdeLikes} curtidas',
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
