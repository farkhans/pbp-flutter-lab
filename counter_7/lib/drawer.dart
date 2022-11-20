import 'package:flutter/material.dart';
import 'form.dart';
import 'main.dart';
import 'data.dart';
import 'my_watch_list_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});
  static String currentPage = "counter_7";

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
                  colorFilter: ColorFilter.mode(
                      Colors.black87.withOpacity(0.2), BlendMode.srcATop),
                  image: const AssetImage('assets/images/bliss.png'),
                ),
              ),
              child: Stack(
                children: const [
                  Positioned(
                    bottom: 12.0,
                    left: 10,
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
              )),
          ListTile(
            contentPadding: const EdgeInsets.only(
              left: 8,
            ),
            title: Row(
              children: const [
                Icon(Icons.home_outlined),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text('counter_7'),
                )
              ],
            ),
            onTap: () {
              if (currentPage == 'counter_7') {
                Navigator.pop(context);
              } else {
                currentPage = 'counter_7';
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyHomePage()));
              }
            },
          ),
          ListTile(
            contentPadding: const EdgeInsets.only(
              left: 8,
            ),
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
              if (currentPage == 'tambah_budget') {
                Navigator.pop(context);
              } else {
                currentPage = 'tambah_budget';
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyFormPage()));
              }
            },
          ),
          ListTile(
            contentPadding: const EdgeInsets.only(
              left: 8,
            ),
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
              if (currentPage == 'data_budget') {
                Navigator.pop(context);
              } else {
                currentPage = 'data_budget';
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const MyData()));
              }
            },
          ),
          ListTile(
            contentPadding: const EdgeInsets.only(
              left: 8,
            ),
            title: Row(
              children: const [
                Icon(Icons.movie_outlined),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text('My Watch List'),
                )
              ],
            ),
            onTap: () {
              if (currentPage == 'my_watch_list') {
                Navigator.pop(context);
              } else {
                currentPage = 'my_watch_list';
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const MyWatchListPage()));
              }
            },
          ),
        ],
      ),
    );
  }
}