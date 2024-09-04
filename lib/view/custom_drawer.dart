import 'package:flutter/material.dart';
import 'package:tourism_app/view/review_main.dart';
import 'user_profile.dart';

class CustomDrawer extends StatelessWidget {
  final String? profileImageUrl;
  final Function(bool) onLoginChanged;

  const CustomDrawer({
    super.key,
    required this.profileImageUrl,
    required this.onLoginChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: const Text('Hana Humaira'), // Replace with dynamic data if needed
            accountEmail: const Text('pompompurin@gmail.com'), // Replace with dynamic data if needed
            currentAccountPicture: CircleAvatar(
              backgroundImage: profileImageUrl != null
                  ? NetworkImage(profileImageUrl!)
                  : const AssetImage('assets/default_profile.jpg') as ImageProvider,
            ),
            decoration: const BoxDecoration(
              color: Colors.black,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('User Profile'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserProfilePage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.rate_review),
            title: const Text('Reviews'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ReviewMainPage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.chat),
            title: const Text('Chat with AI'),
            onTap: () {
              // Handle the action for Chat with AI
            },
          ),
          const Divider(),
          ListTile(
            title: Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: () {
                  onLoginChanged(false); // Log out action
                  Navigator.pop(context); // Close the drawer
                },
                child: const Text('Log out', style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
