import 'package:flutter/material.dart';
import 'package:flutter_insta_clone/Widgets/uihelper.dart';

class HeartScreen extends StatelessWidget {
  const HeartScreen({super.key});

  final List<Map<String, String>> notifications = const [
    {
      "user": "Johny",
      "action": "liked your post",
      "image": "https://picsum.photos/id/1015/200/200",
      "time": "2h ago"
    },
    {
      "user": "Alexa",
      "action": "started following you",
      "image": "https://picsum.photos/id/1045/200/200",
      "time": "5h ago"
    },
    {
      "user": "Rose",
      "action": "liked your post",
      "image": "https://picsum.photos/id/43/200/200",
      "time": "7h ago"
    },
    {
      "user": "Daniel",
      "action": "mentioned you in a comment",
      "image": "https://picsum.photos/id/1012/200/200",
      "time": "1d ago"
    },
    {
      "user": "Sophia",
      "action": "liked your post",
      "image": "https://picsum.photos/id/57/200/200",
      "time": "2d ago"
    },
    {
      "user": "Emma",
      "action": "started following you",
      "image": "https://picsum.photos/id/1011/200/200",
      "time": "3d ago"
    },
    {
      "user": "Olivia",
      "action": "commented: Nice shot!",
      "image": "https://picsum.photos/id/1021/200/200",
      "time": "3d ago"
    },
    {
      "user": "Henry",
      "action": "liked your post",
      "image": "https://picsum.photos/id/5/200/200",
      "time": "4d ago"
    },
    {
      "user": "Ameli",
      "action": "mentioned you in a comment",
      "image": "https://picsum.photos/id/164/200/200",
      "time": "5d ago"
    },
    {
      "user": "Liam",
      "action": "started following you",
      "image": "https://picsum.photos/id/1016/200/200",
      "time": "6d ago"
    },
    {
      "user": "Noah",
      "action": "liked your post",
      "image": "https://picsum.photos/id/1017/200/200",
      "time": "1w ago"
    },
    {
      "user": "Sophia",
      "action": "commented: Love this!",
      "image": "https://picsum.photos/id/1018/200/200",
      "time": "1w ago"
    },
    {
      "user": "Mia",
      "action": "liked your post",
      "image": "https://picsum.photos/id/1019/200/200",
      "time": "2w ago"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: const Color(0xFF121212),
        title: const Text("Activity", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final item = notifications[index];
          return ListTile(
            leading: CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(item["image"]!),
            ),
            title: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "${item["user"]} ",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  TextSpan(
                    text: item["action"],
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            subtitle: Text(item["time"]!,
                style: const TextStyle(color: Colors.white54)),
            trailing: item["action"]!.contains("liked")
                ? const Icon(Icons.favorite, color: Colors.red)
                : item["action"]!.contains("following")
                    ? IconButton(
                        onPressed: () {},
                        icon: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: const Text(
                            "Follow",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      )
                    : null,
          );
        },
      ),
    );
  }
}
