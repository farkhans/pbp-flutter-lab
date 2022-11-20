import 'package:counter_7/drawer.dart';
import 'package:counter_7/watch_list_detail.dart';
import 'package:flutter/material.dart';
import 'futures/my_watch_list_future.dart';

class MyWatchListPage extends StatefulWidget {
  const MyWatchListPage({super.key});

  @override
  State<MyWatchListPage> createState() => _MyWatchListPageState();
}

class _MyWatchListPageState extends State<MyWatchListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Watch List'),
      ),
      drawer: const MyDrawer(),
      body: FutureBuilder(
        future: fetchMyWatchList(),
        builder: (context, AsyncSnapshot snapshot) {
          fetchMyWatchList();
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData) {
              return const Center(
                child: Text("Tidak ada my watch list!"),
              );
            } else {
              return ListView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 0,
                  vertical: 20,
                ),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    MyDrawer.currentPage = 'detail';
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WatchListDetail(
                              watchList: snapshot.data![index])),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: [
                        BoxShadow(
                          color: snapshot.data![index].fields.watched
                          ? Colors.green
                          : Colors.red, 
                          blurRadius: 2.0)
                      ],
                    ),
                    child: Text('${snapshot.data![index].fields.title}'),
                  ),
                ),
              );
            }
          }
        },
      ),
    );
  }
}
