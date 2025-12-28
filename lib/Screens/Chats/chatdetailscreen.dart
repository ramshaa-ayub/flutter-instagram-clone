import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ChatDetailScreen extends StatefulWidget {
  final String userName;
  final String userImage;

  const ChatDetailScreen({
    super.key,
    required this.userName,
    required this.userImage,
  });

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  TextEditingController messageController = TextEditingController();
  final ImagePicker picker = ImagePicker();
  final ScrollController _scrollController = ScrollController();

  final List<Map<String, dynamic>> messages = [
    {"type": "text", "data": "Hey 👋", "isMe": false},
    {"type": "text", "data": "Hi! How are you?", "isMe": true},
    {"type": "text", "data": "All good, what about you?", "isMe": false},
    {"type": "text", "data": "Doing great 😄", "isMe": true},
  ];

  void sendMessage() {
    if (messageController.text.trim().isEmpty) return;

    setState(() {
      messages.add({
        "type": "text",
        "data": messageController.text,
        "isMe": true,
      });
    });
    messageController.clear();
    _scrollToBottom();
  }

  void sendVoiceNote() {
    setState(() {
      messages.add({
        "type": "voice",
        "data": "0:12",
        "isMe": true,
      });
    });
    _scrollToBottom();
  }

  void _scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          children: [
            CircleAvatar(
              radius: 18,
              backgroundImage: AssetImage(widget.userImage),
            ),
            const SizedBox(width: 8),
            Text(widget.userName, style: const TextStyle(color: Colors.white)),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.videocam, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.info_outline, color: Colors.white),
            onPressed: () {},
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: Column(
        children: [
          // Messages
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.all(12),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final msg = messages[index];
                final isMe = msg["isMe"];

                Widget bubble;
                if (msg["type"] == "text") {
                  bubble = Text(
                    msg["data"],
                    style: const TextStyle(color: Colors.white),
                  );
                } else if (msg["type"] == "image") {
                  bubble = ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.file(
                      msg["data"],
                      width: 180,
                      fit: BoxFit.cover,
                    ),
                  );
                } else {
                  bubble = Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.play_arrow, color: Colors.white),
                      SizedBox(width: 6),
                      Text("0:12", style: TextStyle(color: Colors.white)),
                    ],
                  );
                }

                return Align(
                  alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: isMe ? const Color(0xFF3797EF) : Colors.grey.shade800,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: bubble,
                  ),
                );
              },
            ),
          ),

          // Input Bar with static camera/gallery icons
          SafeArea(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: const BoxDecoration(
                color: Colors.black,
                border: Border(top: BorderSide(color: Colors.white12)),
              ),
              child: Row(
                children: [
                  // Mic button
                  GestureDetector(
                    onTap: sendVoiceNote,
                    child: const Icon(Icons.mic, color: Colors.white, size: 28),
                  ),
                  const SizedBox(width: 10),
                  // Gallery icon (static)
                  const Icon(Icons.image, color: Colors.white, size: 28),
                  const SizedBox(width: 10),
                  // Camera icon (static)
                  const Icon(Icons.camera_alt, color: Colors.white, size: 28),
                  const SizedBox(width: 10),
                  // Text input
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade900,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: TextField(
                        controller: messageController,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          hintText: "Message...",
                          hintStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none,
                        ),
                        onSubmitted: (_) => sendMessage(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  // Send button
                  GestureDetector(
                    onTap: sendMessage,
                    child: const Icon(Icons.send, color: Color(0xFF3797EF), size: 28),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
