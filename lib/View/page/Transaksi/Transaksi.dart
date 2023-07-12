import 'package:flutter/material.dart';
import 'package:gemastik/View/page/Transaksi/PageKeluar.dart';
import 'PageMasuk.dart';

class Transaksi extends StatefulWidget {
  @override
  _TransaksiState createState() => _TransaksiState();
}

class _TransaksiState extends State<Transaksi> {
  String dropdownValue = 'Uang Masuk';

  void navigateToPage() {
    if (dropdownValue == 'Uang Masuk') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => UangMasuk(),
        ),
      );
    } else if (dropdownValue == 'Uang Keluar') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => UangKeluar(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Transaksi')),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButtonFormField<String>(
              value: dropdownValue,
              items: [
                DropdownMenuItem(
                  value: 'Uang Masuk',
                  child: Text('Uang Masuk'),
                ),
                DropdownMenuItem(
                  value: 'Uang Keluar',
                  child: Text('Uang Keluar'),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  dropdownValue = value!;
                });
              },
              decoration: InputDecoration(
                labelText: 'Jenis Transaksi',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: navigateToPage,
              child: Text('OK'),
            ),
          ],
        ),
      ),
    );
  }
}
