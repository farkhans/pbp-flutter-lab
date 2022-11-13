import 'package:flutter/material.dart';
import 'form.dart';
import 'drawer.dart';
import 'package:intl/intl.dart';

class MyData extends StatefulWidget {
  const MyData({super.key});

  final String title = 'Data Budget';

  @override
  State<MyData> createState() => _MyDataState();
}

class _MyDataState extends State<MyData> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: const MyDrawer(),
      body: ListView.separated(
        itemBuilder: ((context, index) {
          return ListTile(
            title: Container(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Icon(
                    Icons.attach_money,
                    color: Budget.listBudget[index].jenis == 'Pemasukan'
                        ? Colors.green
                        : Colors.red,
                    size: 80,
                  ),
                  const SizedBox(
                    height: 10,
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 4.0,
                          bottom: 4.0,
                          left: 4.0,
                        ),
                        child: Text(
                          Budget.listBudget[index].judul,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          Budget.listBudget[index].nominal,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 4.0,
                          left: 4.0,
                          bottom: 4.0,
                        ),
                        child: Text(
                          Budget.listBudget[index].jenis,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 4.0,
                          left: 4.0,
                        ),
                        child: Text(
                          DateFormat.yMMMEd().format(Budget.listBudget[index].tanggal),
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }),
        separatorBuilder: ((context, index) => const Divider(
              height: 0,
            )),
        itemCount: Budget.listBudget.length,
      ),
    );
  }
}
