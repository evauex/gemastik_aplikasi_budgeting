import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Hutang extends StatefulWidget {
  const Hutang({Key? key});

  @override
  _HutangState createState() => _HutangState();
}

class _HutangState extends State<Hutang> {
  List<Map<String, String>> hutangList = [
    {'nama': 'Hutang 1', 'jumlah': '100000'},
    {'nama': 'Hutang 2', 'jumlah': '200000'},
    {'nama': 'Hutang 3', 'jumlah': '300000'}
  ];

  void addItem() {
    TextEditingController namaController = TextEditingController();
    TextEditingController jumlahController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Tambah Hutang'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: namaController,
                decoration: InputDecoration(
                  labelText: 'Nama Hutang',
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: jumlahController,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                  labelText: 'Jumlah Hutang',
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
                String namaHutang = namaController.text;
                String jumlahHutang = jumlahController.text;

                setState(() {
                  hutangList.add({
                    'nama': namaHutang,
                    'jumlah': jumlahHutang,
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
        TextEditingController(text: hutangList[index]['nama']);
    TextEditingController jumlahController =
        TextEditingController(text: hutangList[index]['jumlah']);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Hutang'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: namaController,
                decoration: InputDecoration(
                  labelText: 'Nama Hutang',
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: jumlahController,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                  labelText: 'Jumlah Hutang',
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
                String namaHutang = namaController.text;
                String jumlahHutang = jumlahController.text;

                setState(() {
                  hutangList[index]['nama'] = namaHutang;
                  hutangList[index]['jumlah'] = jumlahHutang;
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
          title: Text('Hapus Hutang'),
          content: Text('Anda yakin ingin menghapus hutang ini?'),
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
                  hutangList.removeAt(index);
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
      appBar: AppBar(title: Text('Hutang')),
      body: ListView.builder(
        itemCount: hutangList.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(hutangList[index]['nama']!),
            subtitle: Text(hutangList[index]['jumlah']!),
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
