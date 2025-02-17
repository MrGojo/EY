import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final String userName;
  const ProfileScreen({super.key, this.userName = 'Priya Sharma'});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8FAE0),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              // Logo and Notification
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/images/logo.png', // Make sure to add this asset
                    height: 40,
                  ),
                  Stack(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.notifications_outlined),
                        onPressed: () {},
                      ),
                      Positioned(
                        right: 8,
                        top: 8,
                        child: Container(
                          padding: const EdgeInsets.all(2),
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          constraints: const BoxConstraints(
                            minWidth: 14,
                            minHeight: 14,
                          ),
                          child: const Text(
                            '1',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 8,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              
              const SizedBox(height: 30),
              
              // Profile Picture
              const CircleAvatar(
                radius: 50,
                backgroundColor: Color(0xFF1B4B3C),
                child: Icon(
                  Icons.person,
                  size: 50,
                  color: Colors.white,
                ),
              ),
              
              const SizedBox(height: 15),
              
              // User Name
              Text(
                userName,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              
              // Location
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.location_on, size: 16, color: Colors.grey),
                  SizedBox(width: 4),
                  Text(
                    'Bhopal',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 20),
              
              // Edit Profile & Logout Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1B4B3C),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('Edit Detail'),
                ),
              ),
              
              const SizedBox(height: 10),
              
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('Log Out'),
                ),
              ),
              
              const SizedBox(height: 30),
              
              // Categories
              _buildCategoryTile(Icons.person, 'PERSONAL RELATED'),
              _buildCategoryTile(Icons.agriculture, 'VEHICLE RELATED'),
              _buildCategoryTile(Icons.family_restroom, 'FAMILY RELATED'),
              _buildCategoryTile(Icons.medical_services, 'MEDICAL RELATED'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryTile(IconData icon, String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: const Color(0xFFE8FAE0),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: const Color(0xFF1B4B3C)),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      ),
    );
  }
}