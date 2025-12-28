import 'package:flutter/material.dart';
import 'package:flutter_insta_clone/Screens/Chats/chatdetailscreen.dart';
import 'package:flutter_insta_clone/Screens/Home/homescreen.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});

  final List<Map<String, String>> chats = [
    {
      "name": "Noah",
      "image": "assets/images/profile 1.png",
      "msg": "Have a nice day, bro!",
      "time": "now",
    },
    {
      "name": "karenne",
      "image": "assets/images/profile 2.png",
      "msg": "I heard this is a good movie.",
      "time": "now",
    },
    {
      "name": "alex bob",
      "image": "assets/images/profile 3.png",
      "msg": "See you on the next meeting!",
      "time": "15m",
    },
    {
      "name": "Charlotte ",
      "image": "assets/images/profile 4.png",
      "msg": "Sounds good 😂😂",
      "time": "20m",
    },
    {
      "name": "Evelyn ",
      "image": "assets/images/profile 5.png",
      "msg": "The new design looks cool",
      "time": "1m",
    },
    {
      "name": "henry martin",
      "image": "assets/images/profile 3.png",
      "msg": "See you on the next meeting!",
      "time": "15m",
    },
    {
      "name": "andrew.w",
      "image": "assets/images/profile 4.png",
      "msg": "Sounds good 😂😂",
      "time": "20m",
    },
    {
      "name": "Naomi",
      "image": "assets/images/profile 5.png",
      "msg": "The new design looks cool",
      "time": "1m",
    },
    {
      "name": "jassica",
      "image": "assets/images/profile 1.png",
      "msg": "Have a nice day, bro!",
      "time": "now",
    },
    {
      "name": "karenne",
      "image": "assets/images/profile 2.png",
      "msg": "I heard this is a good movie.",
      "time": "now",
    },
    {
      "name": "lukish",
      "image": "assets/images/profile 4.png",
      "msg": "Sounds good 😂😂",
      "time": "20m",
    },
    {
      "name": "kiero_d",
      "image": "assets/images/profile 5.png",
      "msg": "The new design looks cool",
      "time": "1m",
    },
    {
      "name": "jack",
      "image": "assets/images/profile 3.png",
      "msg": "See you on the next meeting!",
      "time": "15m",
    },
    {
      "name": "jassie",
      "image": "assets/images/profile 4.png",
      "msg": "Sounds good 😂😂",
      "time": "20m",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,

        //  BACK TO HOME
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),

        title: Row(
          children: const [
            Text(
              "jack",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(width: 4),
            Icon(Icons.keyboard_arrow_down, color: Colors.white),
          ],
        ),
        actions: const [
          Icon(Icons.add, color: Colors.white),
          SizedBox(width: 12),
        ],
      ),

      body: Column(
        children: [
          // 🔍 Search Bar
          Padding(
            padding: const EdgeInsets.all(12),
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),

          // 💬 Chat List
          Expanded(
            child: ListView.builder(
              itemCount: chats.length,
              itemBuilder: (context, index) {
                final chat = chats[index];

                return ListTile(
                  leading: CircleAvatar(
                    radius: 26,
                    backgroundImage: AssetImage(chat["image"]!),
                  ),

                  title: Text(
                    chat["name"]!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  subtitle: Text(
                    "${chat["msg"]} · ${chat["time"]}",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.grey),
                  ),

                  trailing: const Icon(
                    Icons.camera_alt_outlined,
                    color: Colors.white,
                  ),

                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ChatDetailScreen(
                          userName: chat["name"]!,
                          userImage: chat["image"]!,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),

          // 📷 Bottom Camera Button
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.camera_alt, color: Colors.blue),
              label: const Text("Camera", style: TextStyle(color: Colors.blue)),
            ),
          ),
        ],
      ),
    );
  }
}
