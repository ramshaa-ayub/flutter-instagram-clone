import 'package:flutter/material.dart';
import 'package:flutter_insta_clone/Widgets/uihelper.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();

  final List<Map<String, String>> arrayContent = [
    {
      "img":
          "https://media.istockphoto.com/id/2147497907/photo/young-woman-traveler-relaxing-and-enjoying-the-tropical-sea-while-traveling-for-summer.jpg?s=612x612&w=0&k=20&c=iY2aqFsXX9Hzq_KwAZhy3ug74z0y7KHxUc_msPHyKzU=",
    },
    {
      "img":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ2QaSoBWAm1u7GYxby8RKYtU1ilY74oSKlOg&s",
    },
    {
      "img":
          "https://publish.purewow.net/wp-content/uploads/sites/2/2024/02/most-beautiful-places-in-the-world_Seljalandsfoss-Iceland.jpg?fit=680%2C400",
    },
    {
      "img":
          "https://images.stockcake.com/public/6/2/0/6204ef0a-4e8e-417d-955d-cd7d9af09806_large/sunset-ocean-view-stockcake.jpg",
    },

    {
      "img":
          "https://st2.depositphotos.com/1370441/8142/i/450/depositphotos_81426254-stock-photo-happy-couple-driving-in-convertible.jpg",
    },
    {"img": "https://kfoods.com/images1/newrecipeicon/zinger-burger_4521.jpg"},
    {
      "img":
          "https://static.vecteezy.com/system/resources/thumbnails/025/282/026/small/stock-of-mix-a-cup-coffee-latte-more-motive-top-view-foodgraphy-generative-ai-photo.jpg",
    },
    {
      "img":
          "https://cdn-hmacl.nitrocdn.com/INHBZBokNhBlPcoVcvkOpVuQOyIAOGNO/assets/images/optimized/rev-8be30cb/motorwaytoday.pk/wp-content/uploads/2023/05/Scenic-Routes-of-Pakistan-Exploring-Highways-and-Motorways.jpg",
    },
    {
      "img":
          "https://rvshare.com/blog/wp-content/uploads/2018/05/Screen-Shot-2023-01-05-at-9.25.26-PM.png",
    },
    {"img": "https://i.ytimg.com/vi/ILJkRQwhDec/maxresdefault.jpg"},
    {
      "img":
          "https://st2.depositphotos.com/1370441/8142/i/450/depositphotos_81426254-stock-photo-happy-couple-driving-in-convertible.jpg",
    },
    {
      "img":
          "https://publish.purewow.net/wp-content/uploads/sites/2/2024/02/most-beautiful-places-in-the-world_Seljalandsfoss-Iceland.jpg?fit=680%2C400",
    },
    {
      "img":
          "https://images.stockcake.com/public/6/2/0/6204ef0a-4e8e-417d-955d-cd7d9af09806_large/sunset-ocean-view-stockcake.jpg",
    },
    {
      "img":
          "https://t4.ftcdn.net/jpg/02/44/16/37/360_F_244163733_ErNyvrHfOJcRlHd7t3doQcs4bEgclAfq.jpg",
    },
    {
      "img":
          "https://cdn-hmacl.nitrocdn.com/INHBZBokNhBlPcoVcvkOpVuQOyIAOGNO/assets/images/optimized/rev-8be30cb/motorwaytoday.pk/wp-content/uploads/2023/05/Scenic-Routes-of-Pakistan-Exploring-Highways-and-Motorways.jpg",
    },
    {
      "img":
          "https://media.istockphoto.com/id/2147497907/photo/young-woman-traveler-relaxing-and-enjoying-the-tropical-sea-while-traveling-for-summer.jpg?s=612x612&w=0&k=20&c=iY2aqFsXX9Hzq_KwAZhy3ug74z0y7KHxUc_msPHyKzU=",
    },
    {
      "img":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ2QaSoBWAm1u7GYxby8RKYtU1ilY74oSKlOg&s",
    },
    {
      "img":
          "https://publish.purewow.net/wp-content/uploads/sites/2/2024/02/most-beautiful-places-in-the-world_Seljalandsfoss-Iceland.jpg?fit=680%2C400",
    },
    {
      "img":
          "https://cdn-hmacl.nitrocdn.com/INHBZBokNhBlPcoVcvkOpVuQOyIAOGNO/assets/images/optimized/rev-8be30cb/motorwaytoday.pk/wp-content/uploads/2023/05/Scenic-Routes-of-Pakistan-Exploring-Highways-and-Motorways.jpg",
    },
    {
      "img":
          "https://rvshare.com/blog/wp-content/uploads/2018/05/Screen-Shot-2023-01-05-at-9.25.26-PM.png",
    },
    {"img": "https://i.ytimg.com/vi/ILJkRQwhDec/maxresdefault.jpg"},
    {"img": "https://www.vie-aesthetics.com/wp-content/uploads/2021/09/shutterstock_1121116859-1024x732.jpg"}
  ];

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 50),

          /// Search Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xFF262626),
                    ),
                    child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                        hintText: "Search",
                        prefixIcon: Uihelper.CustomImage(
                          imgurl: "Search Icon.png",
                        ),
                        hintStyle: const TextStyle(
                          fontSize: 16,
                          color: Color(0XFF8E8E93),
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Uihelper.CustomImage(imgurl: "Live.png"),
              ],
            ),
          ),

          const SizedBox(height: 10),

          /// Categories
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _categoryBox(
                  "IGTV",
                  icon: Uihelper.CustomImage(imgurl: "IGTV icon.png"),
                ),
                _categoryBox(
                  "Shop",
                  icon: const Icon(
                    Icons.shopping_bag,
                    size: 14,
                    color: Colors.white,
                  ),
                ),
                _categoryBox("Style"),
                _categoryBox("Sports"),
                _categoryBox("Auto", width: 50),
              ],
            ),
          ),

          const SizedBox(height: 10),

          /// Grid (all images same size)
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(1),
              itemCount: arrayContent.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 1,
                crossAxisSpacing: 1,
              ),
              itemBuilder: (context, index) {
                return Image.network(
                  arrayContent[index]["img"]!,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, progress) {
                    if (progress == null) return child;
                    return const Center(
                      child: CircularProgressIndicator(strokeWidth: 2),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.broken_image);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _categoryBox(String title, {Widget? icon, double width = 65}) {
    return Container(
      height: 32,
      width: width,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white24),
        borderRadius: BorderRadius.circular(3),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) icon,
          if (icon != null) const SizedBox(width: 4),
          Text(
            title,
            style: const TextStyle(fontSize: 13, color: Color(0XFFF9F9F9)),
          ),
        ],
      ),
    );
  }
}
