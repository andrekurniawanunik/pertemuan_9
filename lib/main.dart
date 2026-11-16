import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Satu hal / widget tunggal: struktur aplikasi Flutter
    return MaterialApp(
      title: 'Secure Storage Praktikum 4',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController pwdController = TextEditingController();
  final storage = const FlutterSecureStorage();
  final myKey = 'myPass';
  String readResult = '';

  Future writeToSecureStorage() async {
    await storage.write(
      key: myKey,
      value: pwdController.text,
    );
  }

  Future<String> readFromSecureStorage() async {
    String secret = await storage.read(key: myKey) ?? '';
    return secret;
  }

  @override
  Widget build(BuildContext context) {
    // Satu hal / widget tunggal: layout antarmuka penyimpanan data sensitif
    return Scaffold(
      appBar: AppBar(
        title: const Text('Secure Storage (Praktikum 4)'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: pwdController,
              decoration: const InputDecoration(
                labelText: 'Masukkan Data Sensitif / Sandi',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                writeToSecureStorage();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Data berhasil disimpan secara aman!')),
                );
              },
              child: const Text('Simpan Nilai (Save Value)'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                String val = await readFromSecureStorage();
                setState(() {
                  readResult = val;
                });
              },
              child: const Text('Baca Nilai (Read Value)'),
            ),
            const SizedBox(height: 24),
            Text(
              'Hasil Baca Secure Storage: $readResult',
              style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}