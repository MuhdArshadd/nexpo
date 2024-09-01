import 'package:flutter/material.dart';

class MapPopupPage extends StatelessWidget {
  const MapPopupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Map Overview'),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16.0), // Adjust the border radius as needed
                    child: Container(
                      height: 250,
                      width: 360,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/klebang_beach.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0.0,
                    left: 0.0,
                    child: const Chip(
                      label: Text(
                          'Live: Pesta Layang-Layang',
                        style: TextStyle(fontSize: 12),
                      ),
                      backgroundColor: Colors.white,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16.0),
              // Beach Information
              const Text(
                'Klebang Beach',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              const Text(
                'Busy',
                style: TextStyle(color: Colors.red),
              ),
              const Text(
                '17:00-20:00',
                style: TextStyle(fontSize: 16.0),
              ),
              const Text(
                'Weekends only',
                style: TextStyle(color: Colors.grey),
              ),
              //const SizedBox(height: 8.0),
              Row(
                children: const [
                  StarRating(
                    rating: 4.5, // Set your rating here
                    starSize: 20.0, // Optional: set the size of the stars
                    starColor: Colors.amber, // Optional: set the color of the stars
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              const Text(
                'Special Features',
                style: TextStyle(fontSize: 18),
              ),
              Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.nature_outlined, color: Colors.green),
                    title: const Text('Picturesque'),
                    subtitle: const Text('Beautiful scenery, peaceful environment'),
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.sunny, color: Colors.orange),
                    title: const Text('Beautiful Sunset'),
                    subtitle: const Text('The sunset at this place will leave you speechless'),
                  ),
                  const Divider(),
                ],
              ),
              const SizedBox(height: 8.0),
              const Text(
                'Recent Reviews',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: 150.0, // Adjust height as needed
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    ReviewCard(
                      reviewerName: 'Audrey',
                      reviewDate: '4 January 2024',
                      rating: 4.5,
                      reviewText: 'Great place. Highly recommend!',
                    ),
                    SizedBox(width: 12.0),
                    ReviewCard(
                      reviewerName: 'Audrey',
                      reviewDate: '17 November 2023',
                      rating: 4.5,
                      reviewText: 'Great place. Highly recommend!',
                    ),
                    // Add more ReviewCards if needed
                  ],
                ),
              ),
              const SizedBox(height: 8.0),
              ElevatedButton(
                onPressed: () {
                  // Navigate to see more reviews page
                },
                style: ElevatedButton.styleFrom(
                  side: const BorderSide(color: Colors.black), // border color
                ),
                child: const Text('See Reviews'),
              ),
            ],
          ),
        ),
    );
  }
}
class StarRating extends StatelessWidget {
  final double rating; // Rating value, e.g., 4.5
  final double starSize; // Size of each star
  final Color starColor; // Color of the stars

  const StarRating({
    Key? key,
    required this.rating,
    this.starSize = 24.0, // Default star size
    this.starColor = Colors.amber, // Default star color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Full stars count
    int fullStars = rating.floor();
    // Half star or not
    bool hasHalfStar = (rating - fullStars) >= 0.5;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Full stars
        for (int i = 0; i < fullStars; i++)
          Icon(Icons.star, color: starColor, size: starSize),
        // Half star
        if (hasHalfStar)
          Icon(Icons.star_half, color: starColor, size: starSize),
        // Empty stars
        for (int i = 0; i < (5 - fullStars - (hasHalfStar ? 1 : 0)); i++)
          Icon(Icons.star_border, color: starColor, size: starSize),
      ],
    );
  }
}

class ReviewCard extends StatelessWidget {
  final String reviewerName;
  final String reviewDate;
  final double rating;
  final String reviewText;

  const ReviewCard({
    Key? key,
    required this.reviewerName,
    required this.reviewDate,
    required this.rating,
    required this.reviewText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180.0, // Adjust width as needed
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 16.0,
                backgroundColor: Colors.grey,
                child: Icon(Icons.person, color: Colors.white),
              ),
              const SizedBox(width: 8.0),
              Text(
                reviewerName,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 4.0),
          StarRating(
            rating: rating,
            starSize: 16.0,
            starColor: Colors.amber,
          ),
          const SizedBox(height: 4.0),
          Text(reviewText),
          const SizedBox(height: 4.0),
          Text(
            reviewDate,
            style: const TextStyle(color: Colors.grey, fontSize: 12.0),
          ),
        ],
      ),
    );
  }
}