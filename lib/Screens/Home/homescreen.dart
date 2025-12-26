import 'package:flutter/material.dart';
import 'package:flutter_insta_clone/Widgets/uihelper.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  var arrContent = [
    {"img": "https://picsum.photos/id/65/600/800.jpg", "name": "Your Story"},
    {
      "img":
          "https://media.istockphoto.com/id/2147497907/photo/young-woman-traveler-relaxing-and-enjoying-the-tropical-sea-while-traveling-for-summer.jpg?s=612x612&w=0&k=20&c=iY2aqFsXX9Hzq_KwAZhy3ug74z0y7KHxUc_msPHyKzU=",
      "name": "rose",
    },
    {
      "img":
          "https://www.vie-aesthetics.com/wp-content/uploads/2021/09/shutterstock_1121116859-1024x732.jpg",
      "name": "Johny",
    },
    {
      "img": "https://i.ytimg.com/vi/ILJkRQwhDec/maxresdefault.jpg",
      "name": "John doe",
    },
    {"img": "https://picsum.photos/id/1011/600/800.jpg", "name": "Ralph"},
    {
      "img":
          "https://st5.depositphotos.com/2760050/74592/i/450/depositphotos_745925384-stock-photo-businessman-portrait-outdoor-smiling-mature.jpg",
      "name": "Bobby",
    },
    {
      "img":
          "https://st.depositphotos.com/1075946/1394/i/450/depositphotos_13940920-stock-photo-portrait-of-handsome-man-with.jpg",
      "name": "charmi",
    },
    {
      "img":
          "https://static.vecteezy.com/system/resources/thumbnails/045/709/332/small/girl-portrait-of-beauty-model-with-natural-face-make-up-skincare-and-wellness-close-up-white-background-beautiful-young-sweet-lady-face-on-white-smooth-and-clean-perfect-skin-photo.jpg",
      "name": "Ameli",
    },
    {
      "img":
          "https://www.vie-aesthetics.com/wp-content/uploads/2021/09/shutterstock_1121116859-1024x732.jpg",
      "name": "Johny",
    },
    {"img": "https://picsum.photos/id/91/600/800.jpg", "name": "Henry"},
    {"img": "https://picsum.photos/id/823/600/800.jpg", "name": "Alexa"},
    {"img": "https://picsum.photos/id/91/600/800.jpg", "name": "Henry"},
    {
      "img": "https://i.ytimg.com/vi/ILJkRQwhDec/maxresdefault.jpg",
      "name": "John doe",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 88,
        backgroundColor: const Color(0XFF121212),
        leading: Uihelper.CustomImage(imgurl: "Camera.png"),
        title: Uihelper.CustomImage(imgurl: "Instagram Logo.png"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Uihelper.CustomImage(imgurl: "IGTV.png"),
          ),
          IconButton(
            onPressed: () {},
            icon: Uihelper.CustomImage(imgurl: "Messenger.png"),
          ),
        ],
      ),
      body: Column(
        children: [
          /// STORIES
          Container(
            height: 110, // fixed height
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 12),
              itemCount: arrContent.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 6),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(4),
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
                          backgroundImage: NetworkImage(
                            arrContent[index]["img"].toString(),
                          ),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        arrContent[index]["name"].toString(),
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            height: 54,
            width: 375,
            color: Colors.black12,
            child: ListTile(
              leading: Uihelper.CustomImage(imgurl: "person.png"),
            ),
          )
        ],
      ),
    );
  }
}
