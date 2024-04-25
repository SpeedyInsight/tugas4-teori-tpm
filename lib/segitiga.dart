import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tugas4/bantuan_segitiga.dart';
import 'halaman_utama.dart';
import 'login_page.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'dart:math' as math;


class segitigaApp extends StatefulWidget {
  @override
  segitigaAppState createState() => segitigaAppState();
}

class segitigaAppState extends State<segitigaApp> {
  TextEditingController _baseController = TextEditingController();
  TextEditingController _heightController = TextEditingController();
  var areaResult = '';
  var perimeterResult = '';
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      appBar: AppBar(
        title: const Text('Segitiga'), // Updated title
        automaticallyImplyLeading: true,
        backgroundColor: Theme.of(context).secondaryHeaderColor,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) {
                  return const LoginPage();
                }),
                (route) => false,
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        backgroundColor: colorScheme.surface,
        selectedItemColor: Colors.blue,
        unselectedItemColor: colorScheme.onSurface.withOpacity(.60),
        selectedLabelStyle: textTheme.caption,
        unselectedLabelStyle: textTheme.caption,
        onTap: (value) {
          if (value == 1) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => BantuanSegitiga()));
          } else if (value == 2) {
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
          } else {
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
            label: 'Bantuan',
            icon: Icon(Icons.help),
          ),
          BottomNavigationBarItem(
            label: 'Logout',
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                keyboardType: TextInputType.number,
                controller: _baseController,
                decoration: InputDecoration(
                  hintText: 'Masukkan Alas',
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                keyboardType: TextInputType.number,
                controller: _heightController,
                decoration: InputDecoration(
                  hintText: 'Masukkan Tinggi',
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    double? base = double.tryParse(_baseController.text);
                    double? height = double.tryParse(_heightController.text);

                    if (base != null && height != null) {
                      areaResult = _calculateArea(base, height).toStringAsFixed(2);
                      perimeterResult = _calculatePerimeter(base, height).toStringAsFixed(2);
                    } else {
                      areaResult = 'Masukkan nilai valid';
                      perimeterResult = 'Masukkan nilai valid';
                    }
                  });
                },
                child: Text('Hitung Luas & Keliling'),
              ),
              SizedBox(height: 16.0),
              Text(
                'Luas: $areaResult',
                style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.05),
                // style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 16.0),
              Text(
                'Keliling: $perimeterResult',
                style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.05),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Function to calculate the area of a triangle
  double _calculateArea(double base, double height) {
    return (base * height) / 2;
  }

  // Function to calculate the perimeter of a triangle
  double _calculatePerimeter(double base, double height) {
    double hypotenuse = _calculateHypotenuse(base, height);
    print(hypotenuse);
    return base + height + hypotenuse;
  }

  // Function to calculate the hypotenuse using Pythagorean theorem
  double _calculateHypotenuse(double base, double height) {
       return sqrt(base * base + height * height);
  }
}