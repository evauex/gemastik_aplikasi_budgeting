import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Tabungan extends StatefulWidget {
  const Tabungan({Key? key});

  @override
  _TabunganState createState() => _TabunganState();
}

class _TabunganState extends State<Tabungan> {
  List<Map<String, String>> tabunganList = [
    {'nama': 'Tabungan 1', 'jumlah': '100000'},
    {'nama': 'Tabungan 2', 'jumlah': '200000'},
    {'nama': 'Tabungan 3', 'jumlah': '300000'}
  ];

  void addItem() {
    TextEditingController namaController = TextEditingController();
    TextEditingController jumlahController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Tambah Tabungan'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: namaController,
                decoration: InputDecoration(
                  labelText: 'Nama Tabungan',
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: jumlahController,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                  labelText: 'Jumlah Tabungan',
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
                String namaTabungan = namaController.text;
                String jumlahTabungan = jumlahController.text;

                setState(() {
                  tabunganList.add({
                    'nama': namaTabungan,
                    'jumlah': jumlahTabungan,
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
        TextEditingController(text: tabunganList[index]['nama']);
    TextEditingController jumlahController =
        TextEditingController(text: tabunganList[index]['jumlah']);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Tabungan'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: namaController,
                decoration: InputDecoration(
                  labelText: 'Nama Tabungan',
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: jumlahController,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                  labelText: 'Jumlah Tabungan',
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
                String namaTabungan = namaController.text;
                String jumlahTabungan = jumlahController.text;

                setState(() {
                  tabunganList[index]['nama'] = namaTabungan;
                  tabunganList[index]['jumlah'] = jumlahTabungan;
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
          title: Text('Hapus Tabungan'),
          content: Text('Anda yakin ingin menghapus tabungan ini?'),
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
                  tabunganList.removeAt(index);
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
      appBar: AppBar(title: Text('Tabungan')),
      body: ListView.builder(
        itemCount: tabunganList.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(tabunganList[index]['nama']!),
            subtitle: Text(tabunganList[index]['jumlah']!),
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
