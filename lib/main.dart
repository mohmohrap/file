import 'package:flutter/material.dart';

void main() {
  runApp(FilesApp());
}

class FilesApp extends StatelessWidget {
  const FilesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FilesScreen(),
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF1B1B1F),
      ),
    );
  }
}

class FilesScreen extends StatelessWidget {
  const FilesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1B1B1F),
        elevation: 0,
        title: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: const Color(0xFF2A2A2E),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: const [
              Icon(Icons.menu, color: Colors.white),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  "Search 'receipt'",
                  style: TextStyle(color: Colors.white54),
                ),
              ),
              Icon(Icons.search, color: Colors.white),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Recent Section
              const SectionTitle(title: "Recent", actionLabel: "See all"),
              SizedBox(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (context, index) => _buildRecentItem(),
                ),
              ),
              const SizedBox(height: 16),
              // Categories Section
              const SectionTitle(title: "Categories"),
              GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  _buildCategoryCard(Icons.download, "Downloads", "674 MB"),
                  _buildCategoryCard(Icons.image, "Images", "170 MB"),
                  _buildCategoryCard(Icons.video_library, "Videos", "6.8 GB"),
                  _buildCategoryCard(Icons.music_note, "Audio", "1.0 GB"),
                  _buildCategoryCard(
                      Icons.insert_drive_file, "Documents", "473 MB"),
                  _buildCategoryCard(Icons.apps, "Apps", "13 GB"),
                ],
              ),
              const SizedBox(height: 16),
              // Collections Section
              const SectionTitle(title: "Collections"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildCategoryCard(Icons.star, "Starred"),
                  _buildCategoryCard(Icons.lock, "Safe folder"),
                ],
              ),
              const SizedBox(height: 16),
              // All Storage Section
              const SectionTitle(title: "All storage"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildCategoryCard(
                      Icons.phone_android, "Internal storage", "1.8 GB free"),
                  _buildCategoryCard(
                      Icons.cloud, "Other storage", "Browse cloud storage"),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color(0xFF6332FF),
        onPressed: () {},
        icon: const Icon(Icons.qr_code_scanner),
        label: const Text("Scan"),
      ),
    );
  }

  Widget _buildRecentItem() {
    return Container(
      width: 100,
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF2A2A2E),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(12)),
              ),
              child: const Icon(Icons.play_circle_fill,
                  color: Colors.white, size: 32),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "File name",
              style: TextStyle(color: Colors.white, fontSize: 12),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              "SnapTube Video",
              style: TextStyle(color: Colors.white54, fontSize: 10),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(IconData icon, String title, [String? subtitle]) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF2A2A2E),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.white),
          const SizedBox(height: 16),
          Text(title, style: const TextStyle(color: Colors.white)),
          if (subtitle != null)
            Text(
              subtitle,
              style: const TextStyle(color: Colors.white54, fontSize: 12),
            ),
        ],
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  final String? actionLabel;

  const SectionTitle({super.key, required this.title, this.actionLabel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold)),
          if (actionLabel != null)
            Text(
              actionLabel!,
              style: const TextStyle(color: Colors.purple, fontSize: 14),
            ),
        ],
      ),
    );
  }
}
