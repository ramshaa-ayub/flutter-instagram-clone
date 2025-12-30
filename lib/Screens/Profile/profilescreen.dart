import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final List<String> posts = List.generate(
    12,
    (index) => "https://picsum.photos/id/${index + 10}/200/200",
  );

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          centerTitle: false, // 👈 LEFT title
          title: const Text(
            "Jack",
            style: TextStyle(color: Colors.white),
          ),
          actions: const [
            Icon(Icons.add_box_outlined, color: Colors.white),
            SizedBox(width: 15),
            Icon(Icons.menu, color: Colors.white),
            SizedBox(width: 10),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // 👈 LEFT content
          children: [
            // Profile Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(
                      "https://picsum.photos/id/1005/200/200",
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildStat("Posts", "12"),
                        const SizedBox(width: 18),
                        _buildStat("Followers", "10.5k"),
                        const SizedBox(width: 18),
                        _buildStat("Following", "10"),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // NAME / ABOUT / WEBSITE (LEFT FIXED)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Jack Doe",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Loving Flutter & Food 🍕 | Travel | Photographer",
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "www.example.com",
                    style: TextStyle(color: Colors.blueAccent),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // Buttons (LEFT aligned row)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade900,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Center(
                        child: Text(
                          "Edit Profile",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade900,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Icon(Icons.person_add, color: Colors.white),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            const TabBar(
              indicatorColor: Colors.white,
              tabs: [
                Tab(icon: Icon(Icons.grid_on, color: Colors.white)),
                Tab(icon: Icon(Icons.video_collection_outlined, color: Colors.white)),
                Tab(icon: Icon(Icons.person_pin_outlined, color: Colors.white)),
              ],
            ),

            Expanded(
              child: TabBarView(
                children: [
                  _buildGrid(posts),
                  _buildGrid(posts),
                  _buildGrid(posts),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStat(String label, String count) {
    return Column(
      children: [
        Text(
          count,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 2),
        Text(label, style: const TextStyle(color: Colors.white)),
      ],
    );
  }

  Widget _buildGrid(List<String> images) {
    return GridView.builder(
      padding: const EdgeInsets.only(
        left: 2,
        right: 2,
        top: 2,
        bottom: 80,
      ),
      itemCount: images.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
      ),
      itemBuilder: (context, index) {
        return Image.network(images[index], fit: BoxFit.cover);
      },
    );
  }
}
