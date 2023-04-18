import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:IsharaBuli/utils/exports.dart';
import 'package:IsharaBuli/views/profile_page.dart';

import 'learning_page.dart';

// Get the current user's email
String getCurrentUserEmail() {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final User? user = auth.currentUser;
  final String email = user?.email ?? '';
  return email;
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ishara Buli"),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.person, size: 30,),
            onPressed: () {
              // handle user profile button press
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ProfilePage()));
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => LearningPage()));
                      },
                      child: Image (
                        image: const AssetImage('image/Read Light Idea.png'),
                        width: screenWidth * 0.4, // 80% of screen width
                        height: screenHeight * 0.4, // 50% of screen height
                        fit: BoxFit.contain, // or BoxFit.cover or any other fit
                      ),
                    ),
                    // Image(
                    //   image: const AssetImage('image/Read Light Idea.png'),
                    //   width: screenWidth * 0.4, // 80% of screen width
                    //   height: screenHeight * 0.4, // 50% of screen height
                    //   fit: BoxFit.contain, // or BoxFit.cover or any other fit
                    // ),
                    SizedBox(height: 0),
                    Text('Learn', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                  ],
                )),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image(
                      image: const AssetImage('image/School Test Art 1.png'),
                      width: screenWidth * 0.4, // 80% of screen width
                      height: screenHeight * 0.4, // 50% of screen height
                      fit: BoxFit.contain, // or BoxFit.cover or any other fit
                    ),

                    // SizedBox(height: 0),
                    Text('Test', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                  ],

                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
