import 'package:flutter/material.dart';
import 'package:flutter_insta_clone/Widgets/uihelper.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> with TickerProviderStateMixin {
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
      "caption": "Work hard.",
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
  late List<bool> isLiked;
  late List<bool> isSaved;
  late List<List<String>> comments;
  late List<TextEditingController> commentControllers;

  // ---------------- HEART ANIMATION
  late AnimationController heartController;
  late Animation<double> heartScale;
  int activeHeart = -1;

  @override
  void initState() {
    super.initState();
    int length = posts.length;

    isLiked = List.generate(length, (_) => false);
    isSaved = List.generate(length, (_) => false); // ✅ initialized
    comments = List.generate(length, (_) => []);
    commentControllers = List.generate(length, (_) => TextEditingController());

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
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: const Color(0xFF121212),
        title: const Text("Post", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        automaticallyImplyLeading: false, // Back arrow removed
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (int i = 0; i < posts.length; i++)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // HEADER
                  ListTile(
                    leading: CircleAvatar(
                      radius: 20,
                      backgroundImage:
                          NetworkImage("https://picsum.photos/50/50?random=$i"),
                    ),
                    title: Text(
                      posts[i]["user"]!,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    subtitle: Text(posts[i]["city"]!,
                        style: const TextStyle(color: Colors.white70)),
                    trailing: Uihelper.CustomImage(imgurl: "more.png"),
                  ),

                  // IMAGE + DOUBLE TAP HEART
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
                            child: const Icon(Icons.favorite,
                                color: Colors.red, size: 100),
                          ),
                      ],
                    ),
                  ),

                  // ACTIONS
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            isLiked[i] ? Icons.favorite : Icons.favorite_border,
                            color: isLiked[i] ? Colors.red : Colors.white,
                          ),
                          onPressed: () =>
                              setState(() => isLiked[i] = !isLiked[i]),
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
                          icon: Icon(
                            isSaved[i] ? Icons.bookmark : Icons.bookmark_border,
                            color: Colors.white,
                          ),
                          onPressed: () =>
                              setState(() => isSaved[i] = !isSaved[i]),
                        ),
                      ],
                    ),
                  ),

                  // CAPTION
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "${posts[i]["user"]} ",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.white),
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
          color: const Color(0xFF1E1E1E),
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
                  title: Text(comments[index][i],
                      style: const TextStyle(color: Colors.white)),
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
