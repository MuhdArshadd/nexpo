import 'package:flutter/material.dart';

class AttractionWriteReviewPage extends StatefulWidget {
  const AttractionWriteReviewPage({Key? key}) : super(key: key);

  @override
  _AttractionWriteReviewPageState createState() => _AttractionWriteReviewPageState();
}

class _AttractionWriteReviewPageState extends State<AttractionWriteReviewPage> {
  int _selectedRating = 0; // This will hold the selected star rating (0 to 5)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Petronas Twin Tower'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Review Card
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 2.0,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // User Profile and Name
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 20.0,
                          backgroundColor: Colors.grey,
                          // Add a backgroundImage property here to load user's profile picture
                        ),
                        const SizedBox(width: 10.0),
                        const Text(
                          'Hana',
                          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    // Interactive Star Rating
                    StarRating(
                      rating: _selectedRating,
                      starSize: 30.0,
                      onRatingSelected: (rating) {
                        setState(() {
                          _selectedRating = rating;
                        });
                      },
                    ),
                    const SizedBox(height: 16.0),
                    // Review Text Field
                    TextField(
                      maxLines: 3,
                      decoration: InputDecoration(
                        hintText: 'Share details of your own experience at this place',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    // Add Photos & Videos Button
                    ElevatedButton.icon(
                      onPressed: () {
                        // TODO: Implement functionality to add photos and videos
                      },
                      icon: const Icon(Icons.photo_camera),
                      label: const Text('Add photos & videos'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[200],
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            // Submit Review Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // TODO: Implement review submission functionality using _selectedRating
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Submit Review'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StarRating extends StatelessWidget {
  final int rating; // Rating value from 0 to 5
  final double starSize; // Size of each star
  final Color starColor; // Color of the stars
  final ValueChanged<int> onRatingSelected; // Callback when a star is tapped

  const StarRating({
    Key? key,
    required this.rating,
    this.starSize = 24.0,
    this.starColor = Colors.amber,
    required this.onRatingSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return IconButton(
          icon: Icon(
            index < rating ? Icons.star : Icons.star_border,
            color: starColor,
            size: starSize,
          ),
          onPressed: () {
            onRatingSelected(index + 1); // Set the rating to index + 1
          },
        );
      }),
    );
  }
}
