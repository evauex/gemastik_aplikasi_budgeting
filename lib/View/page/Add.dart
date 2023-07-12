import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Add extends StatefulWidget {
  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {
  TextEditingController nameController = TextEditingController();
  TextEditingController valueController = TextEditingController();
  String dropdownValue = "Uang Masuk";

  void saveData() {
    String selectedValue = dropdownValue;
    String nameValue = nameController.text;
    String valueText = valueController.text;

    // Navigasi ke halaman Dropdown dan kirim data yang dipilih
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DropdownPage(
          selectedValue: selectedValue,
          nameValue: nameValue,
          valueText: valueText,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pilih Transaksi"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            DropdownButtonFormField<String>(
              value: dropdownValue,
              items: [
                DropdownMenuItem(
                  value: "Uang Masuk",
                  child: Text("Uang Masuk"),
                ),
                DropdownMenuItem(
                  value: "Uang Keluar",
                  child: Text("Uang Keluar"),
                ),
                DropdownMenuItem(
                  value: "Tabungan",
                  child: Text("Tabungan"),
                ),
                DropdownMenuItem(
                  value: "Hutang",
                  child: Text("Hutang"),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  dropdownValue = value!;
                });
              },
              decoration: InputDecoration(
                labelText: 'Pilih Data',
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Note',
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: valueController,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: InputDecoration(
                labelText: 'Nilai',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Masukkan nilai';
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: saveData,
              child: Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}

class DropdownPage extends StatelessWidget {
  final String selectedValue;
  final String nameValue;
  final String valueText;

  DropdownPage({
    required this.selectedValue,
    required this.nameValue,
    required this.valueText,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pilih data"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Dropdown Value: $selectedValue",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              "Nama: $nameValue",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              "Nilai: $valueText",
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
