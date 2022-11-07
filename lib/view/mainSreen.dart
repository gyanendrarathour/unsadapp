import 'package:flutter/material.dart';
import 'package:unsadapp/controller/fetchMeme.dart';
import 'package:unsadapp/controller/saveMyData.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String imageUrl = '';
  int? memeNo;
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetInitMemeNo();
    updateImage();
  }

  void updateImage() async {
    String getImageUrl = await FetchMeme.fetchNewMeme();
    setState(() {
      imageUrl = getImageUrl;
      isLoading = false;
    });
  }

  GetInitMemeNo() async {
    memeNo = await SaveMyData.fetchData() ?? 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              Text(
                'Meme #$memeNo',
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text('Target 500 Meme'),
              const SizedBox(
                height: 10,
              ),
              isLoading
                  ? Container(
                      height: 300,
                      width: 300,
                      child: const Center(
                          child: SizedBox(
                              height: 50,
                              width: 50,
                              child: CircularProgressIndicator())),
                    )
                  : Image.network(
                      imageUrl,
                      height: 300,
                      width: MediaQuery.of(context).size.width,
                    ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () async {
                    await SaveMyData.saveData(memeNo! + 1);
                    GetInitMemeNo();
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
      ),
    );
  }
}
