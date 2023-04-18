import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:IsharaBuli/views/home_page.dart';

import 'landing_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late User _user;

  @override
  void initState() {
    super.initState();
    _user = FirebaseAuth.instance.currentUser!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              // backgroundImage: NetworkImage(_user.photoURL!),
              // backgroundImage: Image.asset("image/temp_profile.png"),
              radius: 100,
            ),
            SizedBox(height: 100),
            Text(
              // _user.displayName!,
              'Username',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              _user.email!,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // navigate to edit profile page
              },
              child: Text('Edit Profile'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SignupLoginScreen()));
              },
              child: Text('Sign Out'),
            ),
          ],
        ),
      ),
    );
  }
}
