import 'package:flutter/material.dart';
import 'package:flutter_insta_clone/Screens/Chats/chatscreen.dart';
import 'package:flutter_insta_clone/Screens/Login/loginscreen.dart';
import 'package:flutter_insta_clone/Widgets/uihelper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  // ---------------- STORIES
  final arrContent = [
    {"img": "https://picsum.photos/id/65/600/800.jpg", "name": "Your Story"},
    {"img": "https://picsum.photos/id/1005/800/800.jpg", "name": "ronin"},
    {"img": "https://picsum.photos/id/85/600/800.jpg", "name": "Johny"},
    {"img": "https://i.ytimg.com/vi/ILJkRQwhDec/maxresdefault.jpg", "name": "John doe"},
    {"img": "https://picsum.photos/id/1011/600/800.jpg", "name": "Ralph"},
    {"img": "https://st5.depositphotos.com/2760050/74592/i/450/depositphotos_745925384-stock-photo-businessman-portrait-outdoor-smiling-mature.jpg", "name": "Bobby"},
    {"img": "https://st.depositphotos.com/1075946/1394/i/450/depositphotos_13940920-stock-photo-portrait-of-handsome-man-with.jpg", "name": "charmi"},
    {"img": "https://picsum.photos/id/1027/800/800.jpg", "name": "Ameli"},
    {"img": "https://picsum.photos/id/91/600/800.jpg", "name": "Henry"},
    {"img": "https://picsum.photos/id/823/600/800.jpg", "name": "Alexa"},
  ];

  // ---------------- POSTS DATA
  final posts = [
    {
      "user": "Johny",
      "city": "Tokyo, Japan",
      "image": "https://picsum.photos/id/1015/600/375",
      "caption": "The game in Japan was amazing.",
    },
    {
      "user": "Rose",
      "city": "Paris, France",
      "image": "https://picsum.photos/id/43/367/267",
      "caption": "Paris nights hit different.",
    },
    {
      "user": "John Doe",
      "city": "New York, USA",
      "image": "https://picsum.photos/id/1035/600/375",
      "caption": "City that never sleeps.",
    },
    {
      "user": "Alexa",
      "city": "London, UK",
      "image": "https://picsum.photos/id/1045/600/375",
      "caption": "Cold air, warm coffee.",
    },
    {
      "user": "Sophia",
      "city": "Toronto, Canada",
      "image": "https://picsum.photos/id/57/367/267",
      "caption": "Believe in yourself.",
    },
    {
      "user": "Daniel",
      "city": "Berlin, Germany",
      "image": "https://picsum.photos/id/1012/367/267.jpg",
      "caption": "Consistency is key.",
    },
    {
      "user": "Olivia",
      "city": "Paris, France",
      "image": "https://picsum.photos/id/1021/367/267.jpg",
      "caption": "Create your own path.",
    },
    {
      "user": "Henry",
      "city": "Sydney, Australia",
      "image": "https://picsum.photos/id/5/367/267",
      "caption": "work hard.",
    },
    {
      "user": "Ameli",
      "city": "Rome, Italy",
      "image": "https://picsum.photos/id/164/367/267",
      "caption": "History everywhere.",
    },
    {
      "user": "Emma",
      "city": "London, UK",
      "image": "https://picsum.photos/id/1011/367/267.jpg",
      "caption": "Dream big.",
    },
  ];

  // ---------------- STATES
  List<bool> isLiked = List.generate(10, (_) => false);
  List<bool> isSaved = List.generate(10, (_) => false);
  List<List<String>> comments = List.generate(10, (_) => []);
  List<TextEditingController> commentControllers = List.generate(10, (_) => TextEditingController());

  // ---------------- HEART ANIMATION
  late AnimationController heartController;
  late Animation<double> heartScale;
  int activeHeart = -1;

  @override
  void initState() {
    super.initState();
    heartController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    heartScale = Tween(begin: 0.5, end: 1.2)
        .animate(CurvedAnimation(parent: heartController, curve: Curves.easeOut));
  }

  void _onDoubleTap(int index) {
    setState(() {
      isLiked[index] = true;
      activeHeart = index;
    });

    heartController.forward(from: 0);
    Future.delayed(const Duration(milliseconds: 700), () {
      setState(() => activeHeart = -1);
    });
  }

  @override
  void dispose() {
    heartController.dispose();
    for (var c in commentControllers) c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFF121212),
      appBar: AppBar(
        toolbarHeight: 88,
        backgroundColor: const Color(0XFF121212),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
            );
          },
        ),
        title: Uihelper.CustomImage(imgurl: "Instagram Logo.png"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Uihelper.CustomImage(imgurl: "IGTV.png"),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChatScreen()),
              );
            },
            icon: Uihelper.CustomImage(imgurl: "Messenger.png"),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ---------------- STORIES
            SizedBox(
              height: 110,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 12),
                itemCount: arrContent.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(right: 6),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(3),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFFE20337),
                              Color(0xFFC60188),
                              Color(0xFF7700C3),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: CircleAvatar(
                          radius: 32,
                          backgroundImage: NetworkImage(arrContent[index]["img"]!),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        arrContent[index]["name"]!,
                        style: const TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // ---------------- POSTS
            for (int i = 0; i < posts.length; i++)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// HEADER
                  ListTile(
                    leading: CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage("https://picsum.photos/50/50?random=$i"),
                    ),
                    title: Text(
                      posts[i]["user"]!,
                      style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    subtitle: Text(posts[i]["city"]!, style: const TextStyle(color: Colors.white70)),
                    trailing: Uihelper.CustomImage(imgurl: "more.png"),
                  ),

                  /// IMAGE + DOUBLE TAP HEART
                  GestureDetector(
                    onDoubleTap: () => _onDoubleTap(i),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.network(
                          posts[i]["image"]!,
                          height: 375,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        if (activeHeart == i)
                          ScaleTransition(
                            scale: heartScale,
                            child: const Icon(Icons.favorite, color: Colors.red, size: 100),
                          ),
                      ],
                    ),
                  ),

                  /// ACTIONS
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(isLiked[i] ? Icons.favorite : Icons.favorite_border,
                              color: isLiked[i] ? Colors.red : Colors.white),
                          onPressed: () {
                            setState(() => isLiked[i] = !isLiked[i]);
                          },
                        ),
                        IconButton(
                          icon: Uihelper.CustomImage(imgurl: "comment.png"),
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              builder: (_) => _commentSheet(i),
                            );
                          },
                        ),
                        IconButton(
                          icon: Uihelper.CustomImage(imgurl: "Messenger.png"),
                          onPressed: () {},
                        ),
                        const Spacer(),
                        IconButton(
                          icon: Icon(isSaved[i] ? Icons.bookmark : Icons.bookmark_border, color: Colors.white),
                          onPressed: () => setState(() => isSaved[i] = !isSaved[i]),
                        ),
                      ],
                    ),
                  ),

                  /// CAPTION
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "${posts[i]["user"]} ",
                            style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                          TextSpan(
                            text: posts[i]["caption"],
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                ],
              ),
          ],
        ),
      ),
    );
  }

  // ---------------- COMMENT SHEET
  Widget _commentSheet(int index) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom + 20,
        left: 0,
        right: 0,
        top: 20,
      ),
      child: Container(
        height: 280,
        decoration: BoxDecoration(
          color: const Color(0XFF1E1E1E),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            const SizedBox(height: 10),
            const Text("Comments",
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
            const Divider(color: Colors.white30),
            Expanded(
              child: ListView.builder(
                itemCount: comments[index].length,
                itemBuilder: (_, i) => ListTile(
                  leading: const CircleAvatar(radius: 14),
                  title: Text(comments[index][i], style: const TextStyle(color: Colors.white)),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: commentControllers[index],
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      hintText: "Add a comment...",
                      hintStyle: TextStyle(color: Colors.white54),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 14),
                    ),
                  ),
                ),
                IconButton(
                  icon: Uihelper.CustomImage(imgurl: "Messenger.png"),
                  onPressed: () {
                    if (commentControllers[index].text.trim().isEmpty) return;
                    setState(() {
                      comments[index].add(commentControllers[index].text);
                      commentControllers[index].clear();
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
