import 'package:flutter/material.dart';
import 'package:tourism_app/view/review_write_review.dart';

class ReviewPlacePage extends StatelessWidget {
  const ReviewPlacePage({super.key});

  // Function to calculate the average rating
  double calculateAverageRating(List<Review> reviews) {
    if (reviews.isEmpty) return 0.0;

    double totalRating = 0.0;
    for (var review in reviews) {
      totalRating += review.rating;
    }
    return totalRating / reviews.length;
  }

  @override
  Widget build(BuildContext context) {
    // List of reviews
    final List<Review> reviews = [
      Review(
        username: 'Happy Customer',
        date: '4 January 2024',
        reviewText: 'Great experience, loved the atmosphere!',
        rating: 5,
      ),
      Review(
        username: 'Joyful Visitor',
        date: '4 January 2024',
        reviewText: 'Excellent service, would recommend to everyone!',
        rating: 4,
      ),
      Review(
        username: 'Satisfied Traveler',
        date: '5 January 2024',
        reviewText: 'Beautiful architecture and friendly staff!',
        rating: 3,
      ),
    ];

    // Calculate average rating
    double averageRating = calculateAverageRating(reviews);

    return Scaffold(
      appBar: AppBar(
        title: const Text('NEXPO'),
        actions: [
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
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 14.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    filled: true,
                    fillColor: Colors.white,
                    suffixIcon: Icon(Icons.search, size: 20,),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),

                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  ),
                  style: TextStyle(fontSize: 14),
                  onSubmitted: (value){
                    //TODO: Implement search
                  },
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Reviews',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Image.asset(
                'assets/petronas_twin_towers.jpg', // Example image, replace with actual asset
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 16),
              const Text(
                'Petronas Twin Towers',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              RatingBar(
                averageRating: averageRating,
                totalRatings: reviews.length,
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    averageRating.toStringAsFixed(1), // Displaying average rating with 1 decimal
                    style: const TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RatingBreakdown(reviews: reviews),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'All Reviews (3)',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    child: Text(
                      '+ Add Review',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ReviewWriteReviewPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Container(
                height: 210, // Adjust this height to fit exactly two reviews
                child: Scrollbar(
                  thickness: 6.0,
                  thumbVisibility: true,
                  child: ListView(
                    children: reviews.map((review) {
                      return ReviewCard(
                        username: review.username,
                        date: review.date,
                        reviewText: review.reviewText,
                        rating: review.rating,
                      );
                    }).toList(),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Nearby Popular Places',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const ListTile(
                leading: Icon(Icons.location_on),
                title: Text('Aquaria KLCC'),
                subtitle: Text('9-min walk'),
              ),
              Divider(),
              const ListTile(
                leading: Icon(Icons.location_on),
                title: Text('Galeri Petronas'),
                subtitle: Text('9-min walk'),
              ),
              Divider(),
              const SizedBox(height: 24),
              const Text(
                "Travelers' Favorites",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Expanded(
                    child: FavoritePlaceCard(
                      imageUrl: 'assets/coffee_haven.jpg',
                      placeName: 'Coffee Haven',
                      reviewText: '5-star reviews',
                    ),
                  ),
                  SizedBox(width: 12), // Spacing between cards
                  Expanded(
                    child: FavoritePlaceCard(
                      imageUrl: 'assets/green_eats.png',
                      placeName: 'Green Eats',
                      reviewText: 'Best vegetarian restaurant',
                    ),
                  ),
                ],
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

class RatingBreakdown extends StatelessWidget {
  final List<Review> reviews;

  const RatingBreakdown({super.key, required this.reviews});

  @override
  Widget build(BuildContext context) {
    int totalReviews = reviews.length;
    List<int> starCount = List<int>.filled(5, 0); // Create a list to hold star counts for 5 stars

    // Calculate the count for each star rating
    for (var review in reviews) {
      starCount[5 - review.rating]++;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(5, (index) {
        double percentage = (starCount[index] / totalReviews);
        return Row(
          children: [
            Text('${5 - index}'),
            const SizedBox(width: 4),
            Expanded(
              child: LinearProgressIndicator(
                value: percentage,
                backgroundColor: Colors.grey[300],
                color: Colors.amber,
              ),
            ),
            const SizedBox(width: 8),
            //Text('${(percentage * 100).toStringAsFixed(1)}%'),
          ],
        );
      }),
    );
  }
}

class Review {
  final String username;
  final String date;
  final String reviewText;
  final int rating;

  Review({
    required this.username,
    required this.date,
    required this.reviewText,
    required this.rating,
  });
}


class RatingBar extends StatelessWidget {
  final double averageRating;
  final int totalRatings;

  const RatingBar({
    super.key,
    required this.averageRating,
    required this.totalRatings,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.star, color: Colors.amber),
        const SizedBox(width: 4),
        Text(
          '$averageRating ($totalRatings ratings)',
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}

class ReviewCard extends StatelessWidget {
  final String username;
  final String date;
  final String reviewText;
  final int rating;

  const ReviewCard({
    super.key,
    required this.username,
    required this.date,
    required this.reviewText,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Picture, Username, and Star Rating
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    // Profile Picture/Icon
                    CircleAvatar(
                      radius: 16, // Adjust the radius as needed
                      //backgroundImage: AssetImage('assets/profile_placeholder.png'), // Replace with actual profile image asset
                      // If you don't have an image, you can use an icon instead:
                      child: Icon(Icons.person),
                    ),
                    const SizedBox(width: 8),
                    // Username
                    Text(
                      username,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                // Star Rating aligned to the right
                Row(
                  children: List.generate(
                    rating,
                        (index) => const Icon(Icons.star, color: Colors.amber),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            // Review Text
            Text(reviewText),
            const SizedBox(height: 8),
            // Thumbs Up, Clap Icons, and Date
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Icons aligned to the left
                Row(
                  children: [
                    Icon(Icons.thumb_up, color: Colors.green),
                    const SizedBox(width: 8),
                    Icon(Icons.emoji_events, color: Colors.orange), // Adjust icon as needed
                  ],
                ),
                // Date aligned to the right
                Text(date, style: const TextStyle(color: Colors.grey)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}



class FavoritePlaceCard extends StatelessWidget {
  final String imageUrl;
  final String placeName;
  final String reviewText;

  const FavoritePlaceCard({
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
            width: 160,
            height: 100,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Text(placeName),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
                reviewText,
                style: TextStyle(fontSize: 12)
            ),
          ),
        ],
      ),
    );
  }
}
