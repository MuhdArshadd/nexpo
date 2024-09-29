import 'package:flutter/material.dart';
import 'login_user.dart';
import 'attraction_detail_page.dart';
import 'user_profile.dart';
import 'package:tourism_app/view/custom_drawer.dart';

class AttractionPage extends StatelessWidget {
  final bool isLoggedIn;
  final Function(bool) onLoginChanged;
  final String? profileImageUrl; // URL for the profile image

  const AttractionPage({super.key, required this.isLoggedIn, required this.onLoginChanged, this.profileImageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NEXPO'),
        automaticallyImplyLeading: false, // This removes the hamburger icon
        actions: [
          if (!isLoggedIn) ...[
            IconButton(
              icon: const Icon(Icons.person, color: Colors.black),
              onPressed: () async {
                final result = await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage(onLoginChanged: onLoginChanged))
                );
                if(result == true){
                  onLoginChanged(true); //update login status
                }
              },
            ),
          ] else ...[
            Builder(
              builder: (BuildContext context){
                return IconButton(
                  icon: CircleAvatar(
                    backgroundImage: profileImageUrl != null
                        ? NetworkImage(profileImageUrl!)
                        : const AssetImage('assets/default_profile.jpg') as ImageProvider,
                  ),
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer(); // Open the side drawer
                  },
                );
              },
            ),
          ],
        ],
      ),
    endDrawer: CustomDrawer( // Use the CustomDrawer widget here
    profileImageUrl: profileImageUrl,
    onLoginChanged: onLoginChanged,
    ),
      // The rest of the AttractionPage UI
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: ' Search for attractions',
                  suffixIcon: Container(
                    margin: const EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.search, color: Colors.white),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                onSubmitted: (value){
                  //TODO: Implement search
                },
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