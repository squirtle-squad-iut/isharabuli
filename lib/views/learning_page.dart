import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:IsharaBuli/views/profile_page.dart';
import '../utils/exports.dart';

final Map<String, String> charImages = {
  '0': 'sign_0',
  '1': 'sign_1',
  '2': 'https://firebasestorage.googleapis.com/v0/b/isharabuli.appspot.com/o/digits_sample%2Fsign_2.jpg?alt=media&token=ddef7d31-7fe8-4420-99ed-1730e026da9d',
  '3': 'https://firebasestorage.googleapis.com/v0/b/isharabuli.appspot.com/o/digits_sample%2Fsign_3.jpg?alt=media&token=ddef7d31-7fe8-4420-99ed-1730e026da9d',
  '4': 'https://firebasestorage.googleapis.com/v0/b/isharabuli.appspot.com/o/digits_sample%2Fsign_4.jpg?alt=media&token=ddef7d31-7fe8-4420-99ed-1730e026da9d',
  '5': 'https://firebasestorage.googleapis.com/v0/b/isharabuli.appspot.com/o/digits_sample%2Fsign_5.jpg?alt=media&token=ddef7d31-7fe8-4420-99ed-1730e026da9d',
  '6': 'https://firebasestorage.googleapis.com/v0/b/isharabuli.appspot.com/o/digits_sample%2Fsign_6.jpg?alt=media&token=ddef7d31-7fe8-4420-99ed-1730e026da9d',
  '7': 'https://firebasestorage.googleapis.com/v0/b/isharabuli.appspot.com/o/digits_sample%2Fsign_7.jpg?alt=media&token=ddef7d31-7fe8-4420-99ed-1730e026da9d',
  '8': 'https://firebasestorage.googleapis.com/v0/b/isharabuli.appspot.com/o/digits_sample%2Fsign_8.jpg?alt=media&token=ddef7d31-7fe8-4420-99ed-1730e026da9d',
  '9': 'https://firebasestorage.googleapis.com/v0/b/isharabuli.appspot.com/o/digits_sample%2Fsign_9.jpg?alt=media&token=ddef7d31-7fe8-4420-99ed-1730e026da9d',
};

class LearningPage extends StatelessWidget {
  LearningPage({Key? key}) : super(key: key);
  final List<String> letters = List.generate(10, (index) => String.fromCharCode(index + 48));

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
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: GridView.count(
          crossAxisCount: 4,
          children: charImages.keys.map((letter) {
            return InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => Popup(letter: letter),
                );
              },
              child: Container(
                padding: EdgeInsets.all(16.0),
                margin: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey,
                ),
                child: Center(
                  child: Text(
                    letter,
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        )

      ),
    );
  }
}

class Popup extends StatefulWidget {
  final String letter;

  const Popup({Key? key, required this.letter}) : super(key: key);

  @override
  _PopupState createState() => _PopupState();
}

class _PopupState extends State<Popup> {
  late String _imageUrl;
  final FirebaseStorage storage = FirebaseStorage.instance;

  @override
  void initState() {
    super.initState();
    // Load the image URL from Firebase based on the selected letter
    getImageUrl();
    // _imageUrl = key;
  }

  Future<void> getImageUrl() async {
    // TODO: Fetch image URL from Firebase
    // For example, using Firebase Storage:
    //   String url = await FirebaseStorage.instance.ref().child('https://firebasestorage.googleapis.com/v0/b/isharabuli.appspot.com/o/digits_sample%2Fsign_1.jpg?alt=media&token=d7ef1102-eecc-4f52-ba7d-dce2790d9750').getDownloadURL();
    // setState(() {
    //   _imageUrl = url;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Image(image: AssetImage("image/sign_0.png")),
      actions: [
        TextButton(
          child: Text('Close'),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    );
  }
}