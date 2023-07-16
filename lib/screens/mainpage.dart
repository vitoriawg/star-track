import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:mobileapp/screens/favorite.dart';
import 'package:mobileapp/screens/profile.dart';
import 'package:mobileapp/screens/search.dart';

enum _SelectedTab { home, likes, search, profile }

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
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
          'Animes',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),
      SingleChildScrollView(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/pf.jpg'),
            fit: BoxFit.cover,
          ),
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              FutureBuilder<List<Animes>>(
                  future: AnimesDAO().getAnimes(),
                  initialData: [],
                  builder: (context, snapshot){
                    final List<Anime>? animes = snapshot.data;
                    return DropdownButton<int>(
                      value: _codigo,
                      onChanged: (change){
                        setState(() {
                          _codigo = change!;
                        });
                      },
                      items: animes?.map((fc) =>
                          DropdownMenuItem<int>(
                            child: Text(fc.nome!),
                            value: fc.codigo_anime,
                          )
                      ).toList(),
                    );
                  }
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

y);

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
          Container(
            width: 40,
            height: 40,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.pink,
            ),
            child: IconButton(
              icon: Icon(Icons.add),
              color: Colors.white,
              onPressed: onAdd,
            ),
          ),
        ],
      ),
    );
  }
}
