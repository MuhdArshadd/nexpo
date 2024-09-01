import 'package:flutter/material.dart';
import 'package:tourism_app/view/review_place.dart';

class ReviewMainPage extends StatelessWidget {
  const ReviewMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NEXPO'),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ReviewPlacePage()),
              );
              // TODO: Implement profile navigation
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    filled: true,
                    fillColor: Colors.white,
                    suffixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),

                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
                  ),
                  onSubmitted: (value){
                    //TODO: Implement search
                  },
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Reviews',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  ReviewCategoryButton(icon: Icons.park, label: 'Parks'),
                  ReviewCategoryButton(icon: Icons.restaurant, label: 'Restaurants'),
                  ReviewCategoryButton(icon: Icons.store, label: 'Shops'),
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                'Filter by Rating',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  RatingFilterButton(rating: '1 Star'),
                  RatingFilterButton(rating: '2 Stars'),
                  RatingFilterButton(rating: '3 Stars'),
                  RatingFilterButton(rating: '4 Stars'),
                  RatingFilterButton(rating: '5 Stars'),
                ],
              ),
              const SizedBox(height: 24),
              const Text(
                'Top Rated Places',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const TopRatedPlace(
                placeName: 'Central Park',
                rating: '4.8 stars',
                icon: Icons.park_outlined,
                iconColor: Colors.green,
              ),
              Divider(),
              const TopRatedPlace(
                placeName: 'Italiano Pizzeria',
                rating: '4.7 stars',
                icon: Icons.local_pizza,
                iconColor: Colors.orange,
              ),
              Divider(),
              const TopRatedPlace(
                placeName: 'Botanical Gardens',
                rating: '4.7 stars',
                icon: Icons.local_florist,
                iconColor: Colors.purple,
              ),
              Divider(),
              const SizedBox(height: 24),
              const Text(
                'Featured Places',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Expanded(
                    child: FeaturedPlaceCard(
                      imageUrl: 'assets/coffee_haven.jpg',
                      placeName: 'Coffee Haven',
                      reviewText: '5-star reviews',
                    ),
                  ),
                  SizedBox(width: 16), // Spacing between cards
                  Expanded(
                    child: FeaturedPlaceCard(
                      imageUrl: 'assets/green_eats.png',
                      placeName: 'Green Eats',
                      reviewText: 'Best vegetarian restaurant',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const Text(
                'Featured Pictures',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const FeaturedPicture(
                imageUrl: 'assets/sunset_terengganu.jpg',
                title: 'Sunset in Terengganu, Malaysia',
                photographerName: 'Arshad Mohd',
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Discover',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
        ],
        selectedItemColor: Colors.amber[800],
        onTap: (int index) {
          // TODO: Implement navigation
        },
      ),
    );
  }
}

class ReviewCategoryButton extends StatelessWidget {
  final IconData icon;
  final String label;

  const ReviewCategoryButton({
    super.key,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40),
          const SizedBox(height: 8),
          Text(label),
        ],
      ),
      width: 110, // Adjust width as needed
      height: 100, // Adjust height as needed
    );
  }
}


class RatingFilterButton extends StatelessWidget {
  final String rating;

  const RatingFilterButton({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0), // Adjusts button padding
        textStyle: const TextStyle(fontSize: 14), // Decreases font size
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20), // Rounded corners for better fit
        ),
      ),
      onPressed: () {
        // TODO: Filter reviews by rating
      },
      child: Text(rating),
    );
  }
}

class TopRatedPlace extends StatelessWidget {
  final String placeName;
  final String rating;
  final IconData icon;
  final Color iconColor;

  const TopRatedPlace({
    super.key,
    required this.placeName,
    required this.rating,
    required this.icon,
    this.iconColor = Colors.black, //default color if not provided
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, size: 40, color: iconColor),
      title: Text(placeName),
      subtitle: Text(rating),
      onTap: () {
        // TODO: Navigate to the place details
      },
    );
  }
}

class FeaturedPlaceCard extends StatelessWidget {
  final String imageUrl;
  final String placeName;
  final String reviewText;

  const FeaturedPlaceCard({
    super.key,
    required this.imageUrl,
    required this.placeName,
    required this.reviewText,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity, // Ensure the image takes up full width
            height: 100,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListTile(
            title: Text(placeName),
            subtitle: Text(reviewText),
            onTap: () {
              // TODO: Navigate to the place details
            },
          ),
        ],
      ),
    );
  }
}

class FeaturedPicture extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String photographerName;

  const FeaturedPicture({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.photographerName,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(imageUrl, fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(photographerName),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
