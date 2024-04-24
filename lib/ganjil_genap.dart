import 'package:flutter/material.dart';
import 'halaman_utama.dart';
import 'login_page.dart';

class GanjilGenapApp extends StatefulWidget {
  @override
  _GanjilGenapAppState createState() => _GanjilGenapAppState();
}

class _GanjilGenapAppState extends State<GanjilGenapApp> {
  TextEditingController _numberController = TextEditingController();
  var hasil = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      appBar: AppBar(
        title: const Text('Cek Bilangan Prima'), // Updated title
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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                keyboardType: TextInputType.number,
                controller: _numberController,
                showCursor: true,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.07),
                decoration: const InputDecoration(border: InputBorder.none),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(Size.fromHeight(
                      MediaQuery.of(context).size.height * 0.07)),
                ),
                onPressed: () {
                  setState(() {
                    int? angka = int.tryParse(_numberController.text);
                    if (angka != null) {
                      hasil = _isPrime(angka) ? 'Prima' : 'Bukan Prima';
                    } else {
                      hasil = 'Masukkan angka valid';
                    }
                  });
                },
                child: Text('Cek Bilangan Prima'),
              ),
              SizedBox(height: 16.0),
              Text(
                'Hasil: $hasil',
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.05),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Function to determine if a number is prime
  bool _isPrime(int number) {
    if (number <= 1) return false;
    if (number <= 3) return true;

    if (number % 2 == 0 || number % 3 == 0) return false;

    for (int i = 5; i * i <= number; i = i + 6) {
      if (number % i == 0 || number % (i + 2) == 0) {
        return false;
      }
    }
    return true;
  }
}