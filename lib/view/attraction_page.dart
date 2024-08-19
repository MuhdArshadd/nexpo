import 'package:flutter/material.dart';
import 'register_user.dart';
import 'attraction_detail_page.dart';

class AttractionPage extends StatelessWidget {
  const AttractionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NEXPO'),
        actions: [
          TextButton(
            onPressed: () {
              // TODO: Add login functionality
            },
            child: const Text(
              'LOGIN',
              style: TextStyle(color: Colors.black),
            ),
          ),
          TextButton(
            onPressed: () {
              // TODO: Add register functionality
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RegisterUserPage()),
              );
            },
            child: const Text(
              'REGISTER',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: <Widget>[
                  const Text(
                    'Attractions Near You',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                      childAspectRatio: 0.75,
                    ),
                    itemCount: attractions.length, // TODO: Fetch the actual number of attractions from backend
                    itemBuilder: (context, index) {
                      final attraction = attractions[index]; // TODO: Replace with actual data from backend
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AttractionDetailPage(),
                            ),
                          );
                        },
                        child: AttractionCard(
                          imageUrl: attraction['imageUrl'] ?? 'No Image URL',
                          title: attraction['title'] ?? 'No Title',
                          distance: attraction['distance'] ?? 'No Distance',
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AttractionCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String distance;

  const AttractionCard({super.key,
    required this.imageUrl,
    required this.title,
    required this.distance,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              color: Colors.grey[300],
              child: Center(child: Text(imageUrl)),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(distance),
          ],
        ),
      ),
    );
  }
}

// TODO: Fetch the actual list of attractions from backend
final List<Map<String, String?>> attractions = [
  {'imageUrl': 'Image URL', 'title': 'Petronas Twin Towers', 'distance': '5 km away'},
  {'imageUrl': 'Image URL', 'title': 'Langkawi Sky Bridge', 'distance': '10 km away'},
  {'imageUrl': 'Image URL', 'title': 'Petronas Twin Towers', 'distance': '5 km away'},
  {'imageUrl': 'Image URL', 'title': 'Langkawi Sky Bridge', 'distance': '10 km away'},
  {'imageUrl': 'Image URL', 'title': 'Petronas Twin Towers', 'distance': '5 km away'},
  {'imageUrl': 'Image URL', 'title': 'Langkawi Sky Bridge', 'distance': '10 km away'},
  {'imageUrl': 'Image URL', 'title': 'Petronas Twin Towers', 'distance': '5 km away'},
  {'imageUrl': 'Image URL', 'title': 'Langkawi Sky Bridge', 'distance': '10 km away'},
  // Add more attractions here
];