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
      body: ListView.builder(
        itemBuilder: ((context, index) {
          Budget budget = Budget.listBudget[index];
          return Container(
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.black54,
                ),
                borderRadius: BorderRadius.circular(5.0),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black54,
                    offset: Offset(0, 1.5),
                    blurRadius: 2,
                    spreadRadius: 0,
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(0, 0),
                    blurRadius: 0,
                    spreadRadius: 0,
                  )
                ]),
            margin: const EdgeInsets.only(
              top: 10.0,
              left: 10.0,
              right: 10.0,
            ),
            padding: const EdgeInsets.all(4.0),
            child: Row(
              children: [
                Icon(
                  Icons.attach_money,
                  size: 60,
                  color:
                      budget.jenis == 'Pemasukan' ? Colors.green : Colors.red,
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            budget.judul,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            DateFormat.yMMMEd().format(budget.tanggal),
                            style: const TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Text(budget.nominal),
                      const SizedBox(height: 5),
                      Text(budget.jenis)
                    ],
                  ),
                )
              ],
            ),
          );
        }),
        itemCount: Budget.listBudget.length,
      ),
    );
  }
}
