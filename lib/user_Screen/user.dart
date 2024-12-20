import 'package:flutter/material.dart';
import 'package:myapp/LoginOther/complaints.dart';
import 'package:myapp/LoginOther/feedback.dart';
import 'package:myapp/LoginOther/order_screen.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A237E),
        leading: const Icon(Icons.arrow_back, color: Colors.white),
        title: const Text(
          'USER',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: const UserDashboard(),
    );
  }
}

class UserDashboard extends StatefulWidget {
  const UserDashboard({super.key});

  @override
  State<UserDashboard> createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 120,
          decoration: const BoxDecoration(
            color: Color(0xFF1A237E),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Expanded(
          child: GridView.count(
            crossAxisCount: 1,
            childAspectRatio: 3.5,
            padding: const EdgeInsets.all(16.0),
            children: [
              _buildOptionCard(
                context,
                title: 'Orders',
                icon: Icons.assignment,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const OrderScreenUI()),
                  );
                },
              ),
              _buildOptionCard(
                context,
                title: 'Complaints',
                icon: Icons.article,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Complaints()),
                  );
                },
              ),
              _buildOptionCard(
                context,
                title: 'Feedback',
                icon: Icons.feedback_outlined,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const FeedbackScreen()),
                  );
                },
              ),
              _buildOptionCard(
                context,
                title: 'Profile',
                icon: Icons.account_circle,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildOptionCard(BuildContext context,
      {required String title, required IconData icon, VoidCallback? onTap}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Card(
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Center(
          child: ListTile(
            leading: Icon(icon, size: 40, color: Colors.black),
            title: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black87,
              ),
            ),
            onTap: onTap,
          ),
        ),
      ),
    );
  }
}
