import 'package:flutter/material.dart';
import 'package:unsadapp/controller/fetchMeme.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  void updateImage() async {
    String getImageUrl = await FetchMeme.fetchNewMeme();
    setState(() {
      imageUrl = getImageUrl;
    });
  }

  String imageUrl =
      'https://upload.wikimedia.org/wikipedia/commons/5/53/Wikimedia-logo.png';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Meme #24',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text('Target 500 Meme'),
            const SizedBox(
              height: 10,
            ),
            Image.network(
              imageUrl,
              height: 300,
              width: 300,
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  updateImage();
                },
                child: const Text('More Fun!')),
            const Spacer(),
            const Text(
              'Develooped By',
              style: TextStyle(fontSize: 20),
            ),
            const Text(
              'Gyanendra Singh Rathour',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
