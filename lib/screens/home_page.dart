import 'package:flutter/material.dart';
import 'package:watch_app/screens/view_page.dart';
import 'package:watch_app/screens/view_page_2.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _assetName = 'images/nixon_watch.png';

  _pageListener() {
    if (pageController.page == 0) {
      setState(() {
        _assetName = 'images/nixon_watch.png';
      });
    }
    if (pageController.page == 1) {
      setState(() {
        _assetName = 'images/nixon_watch2.png';
      });
    }
  }

  PageController pageController = PageController(
    initialPage: 0,
    viewportFraction: 0.8,
  );

  @override
  void initState() {
    pageController.addListener(_pageListener);
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            bottom: 100,
            child: Container(
              color: Colors.brown.withOpacity(0.2),
              height: MediaQuery.of(context).size.height,
              child: Hero(
                tag: 'watch',
                child: Image(
                  image: AssetImage(_assetName),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 15,
            child: SizedBox(
              height: 250,
              width: MediaQuery.of(context).size.width,
              child: PageView(
                controller: pageController,
                children: [
                  ViewPage(assetName: _assetName),
                  ViewPage2(assetName: _assetName),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
