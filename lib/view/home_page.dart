import 'package:flutter/material.dart';
import 'package:tourism_app/view/review_main.dart';
import 'package:tourism_app/view/custom_drawer.dart';
import 'login_user.dart';
import 'user_profile.dart';
import 'register_user.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'calendar_main.dart';
import 'map_popup.dart';

class HomePage extends StatelessWidget {
  final bool isLoggedIn;
  final Function(bool) onLoginChanged;
  final String? profileImageUrl; // URL for the profile image

 const HomePage({super.key, required this.isLoggedIn, required this.onLoginChanged, this.profileImageUrl});

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
                        : const AssetImage('assets/default_profile.png') as ImageProvider,
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: ' Search',
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
                ),
              ),

              // Explore Malaysia Section
              Card(
                elevation: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.grey[300],
                        child: const Icon(Icons.person),
                      ),
                      title: const Text('Explore Malaysia!'),
                      subtitle: const Text('Your personalized travel guide'),
                    ),
                    Container(
                      height: 200,
                      color: Colors.grey[300],
                      child: const Center(child: Text('Map Placeholder')),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text('Malacca', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // Local Insights Section
              const Text('Local Insights', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: Card(
                      elevation: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CarouselSlider(
                            items: const [
                              Center(child: Text('Image URL 1')),
                              Center(child: Text('Image URL 2')),
                              Center(child: Text('Image URL 3')),
                            ],
                            options: CarouselOptions(
                              height: 100,
                              autoPlay: true,
                              enlargeCenterPage: true,
                              viewportFraction: 1.0,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Discover hidden gems in Malaysia'),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: const [
                                Icon(Icons.person, color: Colors.grey),
                                SizedBox(width: 4),
                                Text('Local Guide'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Card(
                      elevation: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CarouselSlider(
                            items: const [
                              Center(child: Text('Image URL 1')),
                              Center(child: Text('Image URL 2')),
                              Center(child: Text('Image URL 3')),
                            ],
                            options: CarouselOptions(
                              height: 100,
                              autoPlay: true,
                              enlargeCenterPage: true,
                              viewportFraction: 1.0,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Sustainable tourism tips'),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: const [
                                Icon(Icons.person, color: Colors.grey),
                                SizedBox(width: 4),
                                Text('Travel Enthusiast'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),
              // Fascinating Facts Section
              const Text('Fascinating Facts', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),

              // Culture Trivia
              ListTile(
                leading: Image.asset(
                    'assets/culture.jpg',
                  width: 45,
                  height: 45,
                  fit: BoxFit.cover,
                ),
                title: const Text('Culture Trivia'),
                subtitle: const Text('Learn about Malaysia\'s diverse tradition'),
                onTap: (){
                  //Handle culture trivia
                },
              ),
              const Divider(),

              // Nature Wonders
              ListTile(
                leading: Image.asset(
                  'assets/nature.webp',
                  width: 45,
                  height: 45,
                  fit: BoxFit.cover,
                ),
                title: const Text('Nature Wonders'),
                subtitle: const Text('Explore Malaysia\'s breathtaking landscapes'),
                onTap: (){
                  //Handle nature wonder
                },
              ),
              const Divider(),
              const SizedBox(height: 16),

              // Quick Tips Section
              const Text('Quick Tips', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        // Handle click event for Ticket Discounts
                        // For example, navigate to another page or show a dialog
                      },
                      child: Card(
                        elevation: 2,
                        child: Column(
                          children: const [
                            ListTile(
                              leading: Icon(Icons.discount, color: Colors.amber),
                              title: Text('Ticket Discounts', style: TextStyle(fontSize: 12.0)),
                              // TODO: Fetch ticket discounts from backend
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 2),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        // Handle click event for Sustainability Index
                        // For example, navigate to another page or show a dialog
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ReviewMainPage()),
                        );
                      },
                      child: Card(
                        elevation: 2,
                        child: Column(
                          children: const [
                            ListTile(
                              leading: Icon(Icons.eco, color: Colors.green),
                              title: Text('Sustainability Index', style: TextStyle(fontSize: 12.0)),
                              // TODO: Fetch sustainability index from backend
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Create Itinerary Button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // TODO: Add itinerary creation functionality
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MapPopupPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 16),
                  ),
                  child: const Text(
                    'Create Itinerary',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Explore More Section
              Card(
                elevation: 2,
                child: Container(
                  height: 150,
                  color: Colors.grey[300],
                  child: const Center(child: Text('Explore More Placeholder')),
                ),
              ),
              const SizedBox(height: 16),

              // Crowd Insights Section
              const Text('Crowd Insights', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: Card(
                      elevation: 2,
                      child: ListTile(
                        title: const Text(
                          'Current Visitors',
                          style: TextStyle(fontSize: 14.0),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('500', style: TextStyle(fontSize: 16.0)),
                            SizedBox(height: 4.0),
                            Text('+20%', style: TextStyle(color: Colors.green),)
                          ],
                        ),
                        // TODO: Fetch current visitor count from backend
                      ),
                    ),
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Card(
                      elevation: 2,
                      child: ListTile(
                        title: const Text('Peak Hours'),
                        subtitle: const Text(
                          '11 AM - 3 PM',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // TODO: Fetch peak hours from backend
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Languages Section
              const Text('Languages', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8.0,
                children: const [
                  Chip(label: Text('English')),
                  Chip(label: Text('Mandarin')),
                  Chip(label: Text('Spanish')),
                  // TODO: Fetch available languages from backend
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
