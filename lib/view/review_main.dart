import 'package:flutter/material.dart';

class ReviewMainPage extends StatelessWidget {
  const ReviewMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NEXPO'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // TODO: Implement search functionality
            },
          ),
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {
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
              const Text(
                'Reviews',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                icon: Icons.park,
              ),
              const TopRatedPlace(
                placeName: 'Italiano Pizzeria',
                rating: '4.7 stars',
                icon: Icons.local_pizza,
              ),
              const TopRatedPlace(
                placeName: 'Botanical Gardens',
                rating: '4.7 stars',
                icon: Icons.local_florist,
              ),
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
                      imageUrl: 'assets/green_eats.jpg',
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
    return Column(
      children: [
        IconButton(
          icon: Icon(icon, size: 30),
          onPressed: () {
            // TODO: Filter reviews by category
          },
        ),
        Text(label),
      ],
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

  const TopRatedPlace({
    super.key,
    required this.placeName,
    required this.rating,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, size: 40),
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
