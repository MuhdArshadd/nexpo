import 'package:flutter/material.dart';
import 'register_user.dart';

class UserProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NEXPO'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User Info
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.grey[300],
                  child: Icon(Icons.person, size: 30, color: Colors.grey),
                ),
                SizedBox(width: 16.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Fetch user's name from backend
                    Text(
                      "User's Name",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // Fetch user's email from backend
                    Text(
                      "user@email.com",
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 24.0),

            // Visited Places Section
            Text(
              'Visited Places',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildPlaceCard(
                  "Hawaii",
                  Icons.beach_access, // Example icon for the image
                ),
                _buildPlaceCard(
                  "New York",
                  Icons.location_city, // Example icon for the image
                ),
              ],
            ),
            SizedBox(height: 24.0),

            // User's Reviews Section with horizontal scrolling
            Text(
              "User's Reviews",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Container(
              height: 150, // Adjust height as needed
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildReviewCard("Restaurant A", "Great food and atmosphere!", 5),
                  _buildReviewCard("Hotel B", "Excellent service, highly recommended", 4.5),
                  _buildReviewCard("Café C", "Cozy place with great coffee", 4),
                  _buildReviewCard("Park D", "Beautiful scenery and well-maintained", 4.5),
                ],
              ),
            ),
            SizedBox(height: 24.0),

            // Recently Viewed Places Section with enhanced style and clickable
            Text(
              'Recently Viewed Places',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            _buildClickablePlace(context, "Castle X", Icons.castle_outlined),
            _buildClickablePlace(context, "Mountain Y", Icons.terrain_rounded),
            SizedBox(height: 24.0),

            // Favorite Places Section with clickable items
            Text(
              'Favorite Places',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildClickableFavoritePlace(context, "Beach Z", Icons.beach_access),
                _buildClickableFavoritePlace(context, "Temple W", Icons.temple_hindu),
              ],
            ),
            SizedBox(height: 24.0),

            // Ready for your dream trip? Text and Plan Trip Button
            Center(
              child: Column(
                children: [
                  Text(
                    'Ready for your dream trip?',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to trip planning screen or handle trip planning
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 120.0, vertical: 14.0),
                      child: Text('Plan Trip'),
                    ),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.black,
                      side: BorderSide(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget to build the Visited Places cards
  Widget _buildPlaceCard(String title, IconData icon) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image Placeholder
              Container(
                height: 100,
                color: Colors.grey[300],
                child: Center(
                  child: Icon(
                    icon,
                    size: 40,
                    color: Colors.grey[700],
                  ),
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                title,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 2.0),
              TextButton(
                onPressed: () {
                  // Navigate to detailed page for the visited place
                },
                child: Text('Details here'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget to build the Review cards
  Widget _buildReviewCard(String title, String review, double rating) {
    return Container(
      width: 250, // Width for each review card
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  // Fetch image from backend if available
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.grey[300],
                    child: Icon(Icons.restaurant, size: 20, color: Colors.grey),
                  ),
                  SizedBox(width: 8.0),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.0),
              Text(review),
              SizedBox(height: 4.0),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.yellow),
                  SizedBox(width: 4.0),
                  Text('$rating'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget to build clickable places in Recently Viewed Places and Favorite Places
  Widget _buildClickablePlace(BuildContext context, String place, IconData icon) {
    return GestureDetector(
      onTap: () {
        // Handle click for place, e.g., navigate to the place's page
      },
      child: Card(
        child: ListTile(
          leading: Icon(icon, size: 40, color: Colors.brown),
          title: Text(
            place,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          trailing: Icon(Icons.arrow_forward_ios, color: Colors.black),
        ),
      ),
    );
  }

  // Widget to build clickable favorite places
  Widget _buildClickableFavoritePlace(BuildContext context, String place, IconData icon) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          // Handle click for favorite place, e.g., navigate to the place's page

        },
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: 20),
                SizedBox(width: 8.0),
                Text(place),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
