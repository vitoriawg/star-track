import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:mobileapp/screens/favorite.dart';
import 'package:mobileapp/screens/mainpage.dart';
import 'package:mobileapp/screens/profile.dart';

enum _SelectedTab { home, likes, search, profile }

class Games extends StatefulWidget {
  const Games({Key? key}) : super(key: key);

  @override
  State<Games> createState() => _GamesState();
}

class _GamesState extends State<Games> {
  _SelectedTab _selectedTab = _SelectedTab.search;
  bool _isPollActive = false;
  int _yesVotes = 33;
  int _noVotes = 7;

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

  void _startPoll() {
    setState(() {
      _isPollActive = true;
    });
  }

  void _voteYes() {
    setState(() {
      _yesVotes++;
    });
  }

  void _voteNo() {
    setState(() {
      _noVotes++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Games',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/pf.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            if (_isPollActive)
              Column(
                children: [
                  Text(
                    'Você acha que o Luffy vai derrotar o Kaido?',
                    style: TextStyle(fontSize: 24),
                  ),
                  Text(
                    'Vote:',
                    style: TextStyle(fontSize: 24),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: _voteYes,
                        child: Text('Sim'),
                      ),
                      SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: _voteNo,
                        child: Text('Não'),
                      ),
                    ],
                  ),
                ],
              )
            else
              Column(
                children: [
                  Text(
                    'Deseja participar da enquete sobre One Piece?',
                    style: TextStyle(fontSize: 24),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _startPoll,
                    child: Text('Entrar Enquete'),
                  ),
                ],
              ),
            SizedBox(height: 20),
            Text(
              'Votos - Sim: $_yesVotes, Não: $_noVotes',
              style: TextStyle(fontSize: 18),
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
