import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Filter',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FilterChip(label: const Text('Sightseeing'), onSelected: (bool value) {}),
                FilterChip(label: const Text('Restaurants'), onSelected: (bool value) {}),
                FilterChip(label: const Text('Shopping'), onSelected: (bool value) {}),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'Welcome to NEXPO!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Explore and discover new places',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            const Text(
              'Recommended Attractions',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Row(
              children: [
                Expanded(
                  child: AttractionCard(
                    category: 'Sightseeing',
                    image: 'Image of Attraction',
                    title: 'Baba Nyonya',
                    location: 'Malacca',
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: AttractionCard(
                    category: 'Art & Culture',
                    image: 'Image of Attraction',
                    title: 'Timah Tasoh Lake',
                    location: 'Perlis',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'Visitor Reviews',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Row(
              children: [
                Expanded(
                  child: ReviewCard(
                    username: 'Traveler123',
                    review: 'Great experience visiting this place',
                    rating: 5,
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: ReviewCard(
                    username: 'Wanderlust22',
                    review: 'Beautiful and must-visit location',
                    rating: 4,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'Travel Tips',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const TravelTipCard(
              title: '10 Essential Travel Tips',
              tags: ['Tips', 'Travel'],
              description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            ),
            const SizedBox(height: 8),
            const TravelTipCard(
              title: 'Packing List for Tourists',
              tags: ['Tips'],
              description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            ),
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                ),
                child: const Text(
                  'View All Attractions',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AttractionCard extends StatelessWidget {
  final String category;
  final String image;
  final String title;
  final String location;

  const AttractionCard({super.key, 
    required this.category,
    required this.image,
    required this.title,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100,
            color: Colors.grey[300],
            child: Center(child: Text(image)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Chip(label: Text(category)),
                const SizedBox(height: 8),
                Text(
                  title,
                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                    location,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ReviewCard extends StatelessWidget {
  final String username;
  final String review;
  final int rating;

  const ReviewCard({super.key, 
    required this.username,
    required this.review,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey[300],
                  child: const Icon(Icons.person),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(username, style: const TextStyle(fontWeight: FontWeight.bold)),
                      const Row(
                        //children: List.generate(rating, (index) => Icon(Icons.star, color: Colors.amber)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(review),
          ],
        ),
      ),
    );
  }
}

class TravelTipCard extends StatelessWidget {
  final String title;
  final List<String> tags;
  final String description;

  const TravelTipCard({super.key, 
    required this.title,
    required this.tags,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Row(
        children: [
          Container(
            width: 100,
            height: 100,
            color: Colors.grey[300],
            child: const Center(child: Text('Image')),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Wrap(
                    spacing: 4,
                    children: tags.map((tag) => Chip(label: Text(tag))).toList(),
                  ),
                  Text(description),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
