import 'package:flutter/material.dart';
import 'package:flutter_qr_generator/pages/qr_page.dart';
import 'package:vcard_maintained/vcard_maintained.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Qr Generator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  generateQr() {
    final vCard = VCard();
    vCard.workPhone = workPhoneController.text;
    vCard.firstName = firstNameController.text;
    vCard.lastName = lastNameController.text;
    vCard.organization = organizationController.text;
    vCard.birthday = DateTime.tryParse(birthController.text);
    vCard.jobTitle = titleController.text;
    vCard.url = urlController.text;
    vCard.note = noteController.text;
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => QrPage(data: vCard.getFormattedString())));
  }

  final firstNameController = TextEditingController();
  final middleNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final organizationController = TextEditingController();
  final workPhoneController = TextEditingController();
  final birthController = TextEditingController();
  final titleController = TextEditingController();
  final urlController = TextEditingController();
  final noteController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text("Qr Generator"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: GridView.count(
            crossAxisCount: 2,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: firstNameController,
                  decoration: const InputDecoration(hintText: "Nombre"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: middleNameController,
                  decoration: const InputDecoration(hintText: "Segundo nombre"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: lastNameController,
                  decoration: const InputDecoration(hintText: "Apellido"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: organizationController,
                  decoration: const InputDecoration(hintText: "organizacion"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: workPhoneController,
                  decoration: const InputDecoration(hintText: "telefono"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: birthController,
                  decoration:
                      const InputDecoration(hintText: "bd: yyyyy-mm-dd"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: titleController,
                  decoration: const InputDecoration(hintText: "Titulo"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: urlController,
                  decoration: const InputDecoration(hintText: "Url"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: noteController,
                  decoration: const InputDecoration(hintText: "Nota"),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: generateQr,
        tooltip: 'Crear',
        child: const Icon(Icons.send),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
