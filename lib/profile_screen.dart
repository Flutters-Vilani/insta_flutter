import 'package:flutter/material.dart';
import 'package:insta_flutter/components/stories.dart';
import 'package:insta_flutter/models/posts_profile.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  PostsProfile postsProfile = PostsProfile();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "gui.vilani",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                icons_app_bar_profile()
              ],
            ),
          ),
          // pick profile and more informations
          Padding(
            padding: const EdgeInsets.only(top: 16, left: 12.0),
            child: Row(
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        Text(
                          "6",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text("publicações")
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: [
                        Text(
                          "662",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text("seguidores")
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: [
                        Text(
                          "986",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text("seguindo")
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          // buttons edit and share profile
          Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(6),
                  width: MediaQuery.of(context).size.width * 0.4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[300],
                  ),
                  child: Text(
                    "Editar",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(6),
                  width: MediaQuery.of(context).size.width * 0.4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[300],
                  ),
                  child: Text(
                    "Compartilhar perfil",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),
          // publications
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 32.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      Icons.grid_view_outlined,
                      size: 30,
                    ),
                    Icon(
                      Icons.video_collection_outlined,
                      size: 30,
                    ),
                    Icon(
                      Icons.person_pin_outlined,
                      size: 30,
                    )
                  ],
                ),
              ),
              GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.only(top: 16),
                itemCount: postsProfile.posts.length,
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (ctx, index) {
                  return Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 2, color: Colors.white),
                        right: BorderSide(width: 2, color: Colors.white),
                      ),
                    ),
                    child: Image.asset(
                      postsProfile.posts[index]["image"],
                      fit: BoxFit.cover,
                    ),
                  );
                },
              )
            ],
          )
        ],
      ),
    );
  }

  icons_app_bar_profile() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.add_a_photo,
          size: 30,
        ),
        SizedBox(
          width: 15,
        ),
        Icon(
          Icons.menu,
          size: 30,
        ),
      ],
    );
  }
}
