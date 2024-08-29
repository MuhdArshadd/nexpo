import 'package:flutter/material.dart';
import 'attraction_write_review.dart';
class AttractionDetailPage extends StatelessWidget {
  const AttractionDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Attraction Details'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Attractions Near You',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Container(
                  height: 200,
                  color: Colors.grey[300],
                  child: const Center(child: Text('Image URL')),
                ),
                const SizedBox(height: 8),
                DefaultTabController(
                  length: 3,
                  child: Column(
                    children: const [
                      TabBar(
                        tabs: [
                          Tab(text: 'Overview'),
                          Tab(text: 'Reviews'),
                          Tab(text: 'About'),
                        ],
                      ),
                      SizedBox(
                        height: 300,
                        child: TabBarView(
                          children: [
                            OverviewTab(),
                            ReviewsTab(),
                            AboutTab(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OverviewTab extends StatelessWidget {
  const OverviewTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(icon: const Icon(Icons.directions), onPressed: () {}),
              IconButton(icon: const Icon(Icons.save), onPressed: () {}),
              IconButton(icon: const Icon(Icons.near_me), onPressed: () {}),
            ],
          ),
          const Text(
            'Petronas Twin Towers',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const Text('5 km away'),
          const Row(
            children: [
              Icon(Icons.star, color: Colors.amber),
              Text('4.4 (2,098)'),
            ],
          ),
          const Text('Open 24 hours'),
          const Text('Jalan Tun Abdul Razak, 75450 Ayer Keroh, Melaka'),
          const Text('petronas.com'),
          const Text('06-1234567'),
        ],
      ),
    );
  }
}

class ReviewsTab extends StatelessWidget {
  const ReviewsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Petronas Twin Towers',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      for (int i = 5; i >= 1; i--)
                        Row(
                          children: [
                            Expanded(
                              child: LinearProgressIndicator(
                                value: i == 5 ? 0.8 : i == 4 ? 0.6 : i == 3 ? 0.3 : i == 2 ? 0.1 : 0.05,
                                backgroundColor: Colors.grey[200],
                                valueColor: const AlwaysStoppedAnimation<Color>(Colors.amber),
                              ),
                            ),
                            const SizedBox(width: 4),
                            Text('$i'),
                          ],
                        ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                const Text(
                  '4.6',
                  style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  AttractionWriteReviewPage()),
                );
              },
              child: const Text('+ Add Review'),
            ),
            const SizedBox(height: 8),
            const ReviewCard(
              username: 'Intan Payung',
              review: 'Absolutely stunning views!',
              rating: 4,
            ),
          ],
        ),
      ),
    );
  }
}

class AboutTab extends StatelessWidget {
  const AboutTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('About the attraction...'),
    );
  }
}

class ReviewCard extends StatelessWidget {
  final String username;
  final String review;
  final int rating;

  const ReviewCard({
    super.key,
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(username, style: const TextStyle(fontWeight: FontWeight.bold)),
                    Row(
                      children: List.generate(rating, (index) => const Icon(Icons.star, color: Colors.amber)),
                    ),
                  ],
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
