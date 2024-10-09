import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Homepage with Sidebar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<String> _carouselImages = [
    'https://via.placeholder.com/800x400/ff7f7f/333333?text=First+Slide',
    'https://via.placeholder.com/800x400/7f7fff/333333?text=Second+Slide',
    'https://via.placeholder.com/800x400/7fff7f/333333?text=Third+Slide',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Homepage'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('About'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Services'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Contact'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Welcome to My Homepage',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Image.network(
            'https://via.placeholder.com/800x400',
            fit: BoxFit.cover,
          ),
          SizedBox(height: 20),
          Container(
            height: 400, // Adjust height as needed
            child: PageView.builder(
              itemCount: _carouselImages.length,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return Image.network(
                  _carouselImages[index],
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(_carouselImages.length, (index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 4.0),
                height: 8.0,
                width: _currentIndex == index ? 24.0 : 8.0,
                decoration: BoxDecoration(
                  color: _currentIndex == index ? Colors.blue : Colors.grey,
                  borderRadius: BorderRadius.circular(12),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
