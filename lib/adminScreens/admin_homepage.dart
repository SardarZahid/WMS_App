import 'package:flutter/material.dart';
import 'package:myapp/adminScreens/adminButton.dart';
import 'package:myapp/adminScreens/adminFeedback.dart';
import 'package:myapp/adminScreens/admincom.dart';
import 'package:myapp/adminScreens/adminorder.dart';
import 'package:myapp/home.dart';



class AdminHomepage extends StatefulWidget {
  const AdminHomepage({super.key});

  @override
  State<AdminHomepage> createState() => _AdminHomepageState();
}

class _AdminHomepageState extends State<AdminHomepage> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 38, 85, 226),
      body: Column(
mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: const Text(
                'ADMIN',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
          ),
          const SizedBox(height: 40),
          AdminButton(text: 'Orders', onPressed: () {
            Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>  const AdminOrderScreen()));
          }),
          AdminButton(text: 'Complaints', onPressed: () {
            Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>  const AdminComplaintScreen()));
          }),
          AdminButton(text: 'Feedback', onPressed: () {
              Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>  AdminFeedbackScreen()));
            // Handle Feedback action
          }),
          AdminButton(text: 'Go Back', onPressed: () {
            Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>  const home()));
          }),
        ],
      ),
    );
  }
}

