import 'package:flutter/material.dart';
import 'package:tugas4/menu_favorite.dart';
import 'package:tugas4/segitiga.dart';
import 'package:tugas4/situs_rekomendasi.dart';
import 'package:tugas4/stopwatch.dart';
import 'bantuan_halaman_utama.dart';
import 'daftar_anggota.dart';
import 'login_page.dart';
import 'ganjil_genap.dart';


class HalamanUtama extends StatefulWidget {
  const HalamanUtama({Key? key}) : super(key: key);

  @override
  State<HalamanUtama> createState() => _HalamanUtamaState();
}

class _HalamanUtamaState extends State<HalamanUtama> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Halaman Utama"),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          backgroundColor: colorScheme.surface,
          selectedItemColor: Colors.blue,
          unselectedItemColor: colorScheme.onSurface.withOpacity(.60),
          // selectedLabelStyle: textTheme.caption,
          // unselectedLabelStyle: textTheme.caption,
          onTap: (value) {
            if (value == 1) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => BantuanHalamanUtama()));
            } else if (value == 2) {
              AlertDialog alert = AlertDialog(
                title: Text("Logout"),
                content: Container(
                  child: Text("Yakin Logout?"),
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
              showDialog(context: context, builder: (context) => alert);;
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
              label: 'Bantuan',
              icon: Icon(Icons.help),
            ),
            BottomNavigationBarItem(
              label: 'Logout',
              icon: Icon(Icons.logout),
            ),
          ],
        ),
        body: ListView(children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 60),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'images/logo2.png',
                    width: 180,
                    height: 180,
                  ),
                  Text(
                    'Hi! ',
                    style: TextStyle(fontSize: 25),
                  ),
                  buttonDatarAnggota(context),
                  buttonStopwatch(context),
                  buttonGanjilGenap(context),
                  luasKelilingSegitiga(context),
                  buttonSitusRekomendasi(context),
                  buttonMenuFavorite(context),
                ]),
          ),
        ]),
      ),
    );
  }
}

Widget buttonDatarAnggota(BuildContext context) {
  return Container(
    padding: const EdgeInsets.only(bottom: 20, left: 60, right: 60, top: 35),
    child: Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) {
                return DaftarAnggota();
              }));
        },
        child: const Text('Daftar Anggota'),
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(40),
        ),
      ),
    ),
  );
}

Widget buttonStopwatch(BuildContext context) {
  return Container(
    padding: const EdgeInsets.only(bottom: 20, left: 60, right: 60, top: 0),
    child: Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) {
                return const StopwatchPage();
              }));
        },
        child: const Text('Stopwatch'),
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(40),
        ),
      ),
    ),
  );
}

Widget buttonGanjilGenap(BuildContext context) {
  return Container(
    padding: const EdgeInsets.only(bottom: 20, left: 60, right: 60, top: 0),
    child: Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) {
                return GanjilGenapApp();
              }));
        },
        child: const Text('Bilangan Prima'),
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(40),
        ),
      ),
    ),
  );
}

Widget luasKelilingSegitiga(BuildContext context) {
  return Container(
    padding: const EdgeInsets.only(bottom: 20, left: 60, right: 60, top: 0),
    child: Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) {
                return segitigaApp();
              }));
        },
        child: const Text('Luas dan Keliling Segitiga'),
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(40),
        ),
      ),
    ),
  );
}

Widget buttonSitusRekomendasi(BuildContext context) {
  return Container(
    padding: const EdgeInsets.only(bottom: 20, left: 60, right: 60, top: 0),
    child: Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) {
                return  SitusRekomendasi();
              }));
        },
        child: const Text('Situs Rekomendasi'),
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(40),
        ),
      ),
    ),
  );
}

Widget buttonMenuFavorite(BuildContext context) {
  return Container(
    padding: const EdgeInsets.only(bottom: 0, left: 60, right: 60, top: 0),
    child: Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) {
                return MenuFavorite();
              }));
        },
        child: const Text('Menu Favorite'),
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(40),
        ),
      ),
    ),
  );
}