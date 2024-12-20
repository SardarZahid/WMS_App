// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:myapp/adminScreens/admin_homepage.dart';
import 'package:myapp/LoginOther/login.dart'; 

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: const Color.fromARGB(255, 19, 55, 133),
              height: 140,
              width: MediaQuery.of(context).size.width,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                      child: Text(
                    'Home',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold),
                  )),
                  Padding(
                    padding: EdgeInsets.only(left: 12, top: 20, right: 19),
                    child: Text(
                      'Hello !',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 29,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            Container(
              color: const Color.fromARGB(255, 230, 230, 230),
              height: 154,
              width: 143,
              child: Image.asset(
                'images/admin.png',
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AdminHomepage()));
                },
                child: const Text(
                  'ADMIN',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                )),
            const SizedBox(
              height: 10,
            ),
            Container(
              color: const Color.fromARGB(255, 230, 230, 230),
              height: 154,
              width: 143,
              child: Image.asset('images/user.png'),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ));
                },
                child: const Text(
                  'USER',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                )),
            const SizedBox(
              height: 10,
            ),
            Container(
              color: const Color.fromARGB(255, 230, 230, 230),
              height: 154,
              width: 143,
              child: Image.asset('images/driver.png'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ));
              },
              child: const Text(
                'Driver',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      )),
    );
  }
}
