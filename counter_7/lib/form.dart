import 'drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyFormPage extends StatefulWidget {
  const MyFormPage({super.key});

  @override
  State<MyFormPage> createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _judulBudget = "";
  String _nominalBudget = "";
  String _jenisBudget = "Pemasukan";
  DateTime _tanggalBudget = DateTime.now();
  List<String> listJenisBudget = ['Pemasukan', 'Pengeluaran'];
  final _judulController = TextEditingController();
  final _nominalController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Budget'),
      ),
      drawer: const MyDrawer(),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextFormField(
                controller: _judulController,
                decoration: InputDecoration(
                  hintText: 'Contoh: Beli risol',
                  labelText: 'Judul',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (String? value) {
                  setState(() {
                    _judulBudget = value!;
                  });
                },
                onSaved: (String? value) {
                  _judulBudget = value!;
                },
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Judul tidak boleh kosong!';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _nominalController,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                ],
                decoration: InputDecoration(
                  hintText: 'Contoh: 45000',
                  labelText: 'Nominal',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (String? value) {
                  setState(() {
                    _nominalBudget = value!;
                  });
                },
                onSaved: (String? value) {
                  _nominalBudget = value!;
                },
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Nominal tidak boleh kosong!';
                  }
                  return null;
                },
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 40.0,
                    right: 40.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Center(
                          child: Column(
                            children: [
                              const Text('Jenis Budget'),
                              DropdownButton(
                                value: _jenisBudget,
                                icon: const Icon(Icons.keyboard_arrow_down),
                                items: listJenisBudget.map((String items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: Text(items),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    _jenisBudget = newValue!;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 100,
                        height: 40,
                        child: TextButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.blue),
                          ),
                          onPressed: () {
                            showDatePicker(
                              context: context,
                              initialDate: _tanggalBudget,
                              firstDate: DateTime(1970),
                              lastDate: DateTime(2099),
                            ).then((date) {
                              setState(() {
                                if (date != null) _tanggalBudget = date;
                              });
                            });
                          },
                          child: const Text(
                            'Pilih Tanggal',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const Spacer(),
              Center(
                child: SizedBox(
                  width: 100,
                  height: 50,
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Budget.listBudget.add(Budget(_judulBudget,
                            _nominalBudget, _jenisBudget, _tanggalBudget));
                        _judulController.clear();
                        _nominalController.clear();
                        _judulBudget = "";
                        _nominalBudget = "";
                        _tanggalBudget = DateTime.now();
                      }
                    },
                    child: const Text(
                      'Simpan',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

class Budget {
  String judul, jenis, nominal;
  DateTime tanggal;
  static List<Budget> listBudget = [];
  Budget(this.judul, this.nominal, this.jenis, this.tanggal);
}
