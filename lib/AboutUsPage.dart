import 'package:flutter/material.dart';

// This is a simple About Us page widget.
// It uses a Scaffold with a custom AppBar and a scrollable body.
class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Main title and logo area
            Center(
              child: Column(
                children: [
                  Icon(
                    Icons.person,
                    size: 60,
                    color: Colors.orange,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Matrimonial App',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const Text(
                    'About Us',
                    style: TextStyle(
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),

            // Contact Information
            const Text(
              'Contact Us',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 15),

            // Demo Phone Number
            _buildContactItem(
              icon: Icons.phone,
              title: 'Phone',
              subtitle: '+91 98765 43210',
            ),

            // Demo Address
            _buildContactItem(
              icon: Icons.location_on,
              title: 'Address',
              subtitle: 'Rajkot,Gujarat,india',
            ),

            // Demo Social Media
            _buildContactItem(
              icon: Icons.share,
              title: 'Instagram',
              subtitle: '@MatrimonialApp',
            ),

            const SizedBox(height: 50),

            // Copyright Footer
            const Center(
              child: Text(
                '© 2024 Matrimonial App. All rights reserved.',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // A helper method to build the contact information list tiles.
  Widget _buildContactItem({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: <Widget>[
          Icon(icon, color: Colors.orange, size: 28),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
