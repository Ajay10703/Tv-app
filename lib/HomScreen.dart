import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Rawdata.dart';
import 'VideoPlayerScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text('Perpetua Training'),
      ),
      body: SingleChildScrollView(child: sampleVideoGrid()),
    ));
  }

  Widget sampleVideoGrid() {
    return SingleChildScrollView(
      child: Column(
        children: [
          GridView(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            children: images
                .map((url) => InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => VideoPlayerScreen(
                              url: links[images.indexOf(url)],
                            ),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/Item.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          height: 150,
                          width: 150,
                        ),
                      ),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
