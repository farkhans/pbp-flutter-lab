import 'package:flutter/material.dart';
import 'drawer.dart';
import 'models/my_watch_list.dart';

class WatchListDetail extends StatefulWidget {
  const WatchListDetail({super.key, required this.watchList});

  @override
  State<WatchListDetail> createState() => _WatchListDetailState();

  final MyWatchList watchList;
}

class _WatchListDetailState extends State<WatchListDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
      ),
      drawer: const MyDrawer(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 16),
        child: Column(
          children: [
            Center(
              child: Text(
                widget.watchList.fields.title,
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  createRichText(
                    'Release Date',
                    widget.watchList.fields.releaseDate,
                  ),
                  createRichText(
                    'Rating',
                    '${widget.watchList.fields.rating}/5',
                  ),
                  createRichText(
                    'Status',
                    widget.watchList.fields.watched
                    ? 'watched'
                    : 'yet watched',
                  ),
                  const Text(
                    'Review',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.watchList.fields.review,
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
            const Spacer(),
            Center(
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: TextButton(
                  onPressed: () {
                    MyDrawer.currentPage = 'my_watch_list';
                    Navigator.pop(context);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                  ),
                  child: const Text(
                    'Back',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  RichText createRichText(String firstString, String secondString) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: '$firstString: ',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: secondString,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
