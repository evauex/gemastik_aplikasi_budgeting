import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UangKeluar extends StatefulWidget {
  const UangKeluar({Key? key});

  @override
  _UangKeluarState createState() => _UangKeluarState();
}

class _UangKeluarState extends State<UangKeluar> {
  List<Map<String, String>> uangKeluarList = [
    {'nama': 'Uang Keluar 1', 'jumlah': '100000'},
    {'nama': 'Uang Keluar 2', 'jumlah': '200000'},
    {'nama': 'Uang Keluar 3', 'jumlah': '300000'}
  ];

  void addItem() {
    TextEditingController namaController = TextEditingController();
    TextEditingController jumlahController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Tambah Uang Keluar'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: namaController,
                decoration: InputDecoration(
                  labelText: 'Nama Uang Keluar',
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: jumlahController,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                  labelText: 'Jumlah Uang Keluar',
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
                String namaUangKeluar = namaController.text;
                String jumlahUangKeluar = jumlahController.text;

                setState(() {
                  uangKeluarList.add({
                    'nama': namaUangKeluar,
                    'jumlah': jumlahUangKeluar,
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
        TextEditingController(text: uangKeluarList[index]['nama']);
    TextEditingController jumlahController =
        TextEditingController(text: uangKeluarList[index]['jumlah']);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Uang Keluar'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: namaController,
                decoration: InputDecoration(
                  labelText: 'Nama Uang Keluar',
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: jumlahController,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                  labelText: 'Jumlah Uang Keluar',
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
                String namaUangKeluar = namaController.text;
                String jumlahUangKeluar = jumlahController.text;

                setState(() {
                  uangKeluarList[index]['nama'] = namaUangKeluar;
                  uangKeluarList[index]['jumlah'] = jumlahUangKeluar;
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
          title: Text('Hapus Uang Keluar'),
          content: Text('Anda yakin ingin menghapus uang keluar ini?'),
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
                  uangKeluarList.removeAt(index);
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
      appBar: AppBar(title: Text('Uang Keluar')),
      body: ListView.builder(
        itemCount: uangKeluarList.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(uangKeluarList[index]['nama']!),
            subtitle: Text(uangKeluarList[index]['jumlah']!),
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
