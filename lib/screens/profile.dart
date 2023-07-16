import 'dart:io';

import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobileapp/components/button.dart';
import 'package:mobileapp/screens/favorite.dart';
import 'package:mobileapp/screens/mainpage.dart';
import 'package:mobileapp/screens/search.dart';

enum _SelectedTab { home, likes, search, profile }

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  _SelectedTab _selectedTab = _SelectedTab.profile;
  File? _image;

  void _handleIndexChanged(int index) {
    setState(() {
      _selectedTab = _SelectedTab.values[index];
    });

    switch (_selectedTab) {
      case _SelectedTab.home:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => MainPage(),
          ),
        );
        break;
      case _SelectedTab.likes:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => Favorite(),
          ),
        );
        break;
      case _SelectedTab.search:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => Games(),
          ),
        );
        break;
      case _SelectedTab.profile:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => Profile(),
          ),
        );
        break;
    }
  }

  Future _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedImage != null) {
        _image = File(pickedImage.path);
      } else {
        print('Nenhuma imagem selecionada.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Perfil',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/pf.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: _image != null && _image is PickedFile
                            ? FileImage(File(_image!.path)) as ImageProvider<Object>?
                            : AssetImage('assets/images/profile.jpg'),
                        child: InkWell(
                          onTap: () {
                            // Lógica para selecionar a imagem ou abrir a galeria/câmera
                          },
                          child: Icon(
                            Icons.camera_alt,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.purpleAccent,
                          labelText: 'vi',
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.pink,
                          labelText: 'vit@vit',
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.redAccent,
                          labelText: '***',
                        ),
                        obscureText: true,
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: MyButton(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => Profile(),
                              ),
                            );
                          },
                          text: 'Editar',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
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
