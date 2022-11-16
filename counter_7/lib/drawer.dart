import 'form.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'data.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                colorFilter: ColorFilter.mode(Colors.black87.withOpacity(0.2), BlendMode.srcATop),
                image: const AssetImage('assets/images/bliss.png'),
                ),
            ),
            child: Stack(
              children: const [
                  Positioned(
                    bottom: 12.0,
                    left: 16.0,
                    child: Text(
                      'Tugas PBP - Flutter',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
              ],
            )
          ),
          ListTile(
            title: Row(
              children: const [
                Icon(Icons.home),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text('counter_7'),
                )
              ],
            ),
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const MyHomePage()));
            },
          ),
          ListTile(
            title: Row(
              children: const [
                Icon(Icons.attach_money),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text('Tambah Budget'),
                )
              ],
            ),
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const MyFormPage()));
            },
          ),
          ListTile(
            title: Row(
              children: const [
                Icon(Icons.list),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text('Data Budget'),
                )
              ],
            ),
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const MyData()));
            },
          ),
        ],
      ),
    );
  }
}
