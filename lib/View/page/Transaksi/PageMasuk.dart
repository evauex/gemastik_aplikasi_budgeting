import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UangMasuk extends StatefulWidget {
  const UangMasuk({Key? key});

  @override
  _UangMasukState createState() => _UangMasukState();
}

class _UangMasukState extends State<UangMasuk> {
  List<Map<String, String>> uangMasukList = [
    {'nama': 'Uang Masuk 1', 'jumlah': '100000'},
    {'nama': 'Uang Masuk 2', 'jumlah': '200000'},
    {'nama': 'Uang Masuk 3', 'jumlah': '300000'}
  ];

  void addItem() {
    TextEditingController namaController = TextEditingController();
    TextEditingController jumlahController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Uang Masuk'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: namaController,
                decoration: InputDecoration(
                  labelText: 'Note',
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: jumlahController,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                  labelText: 'Masukkan Jumlah Uang',
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              child: Text('Batal'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: Text('Simpan'),
              onPressed: () {
                String namaUangMasuk = namaController.text;
                String jumlahUangMasuk = jumlahController.text;

                setState(() {
                  uangMasukList.add({
                    'nama': namaUangMasuk,
                    'jumlah': jumlahUangMasuk,
                  });
                });

                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  void editItem(int index) {
    TextEditingController namaController =
        TextEditingController(text: uangMasukList[index]['nama']);
    TextEditingController jumlahController =
        TextEditingController(text: uangMasukList[index]['jumlah']);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Uang Masuk'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: namaController,
                decoration: InputDecoration(
                  labelText: 'Nama Uang Masuk',
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: jumlahController,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                  labelText: 'Jumlah Uang Masuk',
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              child: Text('Batal'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: Text('Simpan'),
              onPressed: () {
                String namaUangMasuk = namaController.text;
                String jumlahUangMasuk = jumlahController.text;

                setState(() {
                  uangMasukList[index]['nama'] = namaUangMasuk;
                  uangMasukList[index]['jumlah'] = jumlahUangMasuk;
                });

                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  void deleteItem(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Hapus Uang Masuk'),
          content: Text('Anda yakin ingin menghapus uang masuk ini?'),
          actions: [
            TextButton(
              child: Text('Batal'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: Text('Hapus'),
              onPressed: () {
                setState(() {
                  uangMasukList.removeAt(index);
                });
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Uang Masuk')),
      body: ListView.builder(
        itemCount: uangMasukList.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(uangMasukList[index]['nama']!),
            subtitle: Text(uangMasukList[index]['jumlah']!),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    editItem(index);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    deleteItem(index);
                  },
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          addItem();
        },
      ),
    );
  }
}
