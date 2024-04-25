import 'package:flutter/material.dart';
import 'package:tugas4/halaman_utama.dart';
import 'login_page.dart';

class BantuanSegitiga extends StatefulWidget {
  const BantuanSegitiga({Key? key}) : super(key: key);

  @override
  State<BantuanSegitiga> createState() => _BantuanSegitigaState();
}

class _BantuanSegitigaState extends State<BantuanSegitiga> {
  int _currentIndex = 0; 

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme.primary,
        title: Text(
          'Bantuan Daftar Anggota',
          style: textTheme.headline6!.copyWith(color: Colors.white),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        backgroundColor: Colors.white,
        selectedItemColor: colorScheme.primary,
        unselectedItemColor: colorScheme.onSurface.withOpacity(.60),
        selectedLabelStyle: textTheme.caption!.copyWith(
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelStyle: textTheme.caption,
        onTap: (value) {
          if (value == 1) {
            AlertDialog alert = AlertDialog(
              title: Text("Logout"),
              content: Container(
                child: Text("Apakah Anda Yakin Ingin Logout?"),
              ),
              actions: [
                TextButton(
                  child: Text("Yes"),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                ),
                TextButton(
                  child: Text("No"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
            showDialog(context: context, builder: (context) => alert);
          }else{
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => HalamanUtama()));
          }
          // Respond to item press.
          setState(() => _currentIndex = value);
        },
        items: [
          BottomNavigationBarItem( 
            label: 'Halaman Utama',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Logout',
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.blue[100],
        ),
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Langkah Penggunaan',
              style: textTheme.headline5,
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  _buildCard(
                    '1. Buka Aplikasi dan pilih menu "Luas dan Keliling Segitiga"',
                    textTheme,
                  ),
                  SizedBox(height: 8),
                  _buildCard(
                    '2. Muncul dua textfield yang digunakan untuk mengisi alas, dan tinggi segitiga yang ingin dihitung',
                    textTheme,
                  ),
                  SizedBox(height: 8),
                  _buildCard(
                    '3. Tombol "Hitung Luas & Keliling" yang akan menghasilkan keluaran luas dan keliling dari inputan yang diberikan',
                    textTheme,
                  ),
                  SizedBox(height: 8),
                  _buildCard(
                    '4. Tekan button "Lihat Detail Profil" salah satu anggota untuk melihat detail profil',
                    textTheme,
                  ),
                  SizedBox(height: 8),
                  _buildCard(
                    '5. Pada halaman cek bilangan prima terdapat panah kembali dibagian pojok kiri atas yang mengembalikan ke halaman utama',
                    textTheme,
                  ),
                  SizedBox(height: 8),
                  _buildCard(
                    '6. Pada halaman ini juga ada tombol "logout" yang akan mengembalikan ke halaman login',
                    textTheme,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(String text, TextTheme textTheme) {
    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          text,
          style: textTheme.bodyText1,
        ),
      ),
    );
  }
}