import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:mobileapp/screens/favorite.dart';
import 'package:mobileapp/screens/mainpage.dart';
import 'package:mobileapp/screens/profile.dart';
import 'package:mobileapp/screens/search.dart';

enum _SelectedTab { home, likes, search, profile }

class Quero extends StatefulWidget {
  const Quero({Key? key}) : super(key: key);

  @override
  State<Quero> createState() => _QueroState();
}

class _QueroState extends State<Quero> {
  _SelectedTab _selectedTab = _SelectedTab.home;
  Favorite? favoritePage;

  void _handleIndexChanged(int index) {
    setState(() {
      _selectedTab = _SelectedTab.values[index];
    });

    switch (_selectedTab) {
      case _SelectedTab.home:
      // Ação do item "Home"
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => MainPage(),
          ),
        );
        break;
      case _SelectedTab.likes:
      // Ação do item "Likes"
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => Favorite(),
          ),
        );
        break;
      case _SelectedTab.search:
      // Ação do item "Search"
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => Games(),
          ),
        );
        break;
      case _SelectedTab.profile:
      // Ação do item "Profile"
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => Profile(),
          ),
        );
        break;
    }
  }

  void _navigateToFavorites() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Favorite(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Quero Assistir',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/pf.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          children: [
            CardItem(
              imageUrl: '',
              title: 'Demon Slayer',
              text: 'Um anime de demônios',
            ),
          ],
        ),
      ),
      bottomNavigationBar: DotNavigationBar(
        currentIndex: _selectedTab.index,
        onTap: _handleIndexChanged,
        items: [
          /// Home
          DotNavigationBarItem(
            icon: Icon(Icons.home),
            selectedColor: Colors.purple,
          ),

          /// Likes
          DotNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            selectedColor: Colors.pink,
          ),

          /// Search
          DotNavigationBarItem(
            icon: Icon(Icons.videogame_asset),
            selectedColor: Colors.orange,
          ),

          /// Profile
          DotNavigationBarItem(
            icon: Icon(Icons.person),
            selectedColor: Colors.teal,
          ),
        ],
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String text;

  const CardItem({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(10),
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    text,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
