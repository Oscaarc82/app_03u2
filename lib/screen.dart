import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:app__03u2_ourc_c/Item.dart';

class JsonListViewScreen extends StatefulWidget {
  const JsonListViewScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _JsonListViewScreenState createState() => _JsonListViewScreenState();
}

class _JsonListViewScreenState extends State<JsonListViewScreen> {
  late List<Item> items = []; // Inicialización de items como una lista vacía

  @override
  void initState() {
    super.initState();
    loadItems();
  }

  Future<void> loadItems() async {
    String jsonString =
        await DefaultAssetBundle.of(context).loadString('./data.json');
    List<dynamic> jsonList = json.decode(jsonString);

    setState(() {
      items = jsonList.map((item) => Item.fromJson(item)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Lista asistencia',
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20), // Espacio entre elementos
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Columna de "Nombre"
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nombre',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              SizedBox(width: 20), // Espacio entre columnas
              // Columna de "Número de control"
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Número de control',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              SizedBox(width: 20), // Espacio entre columnas
              // Columna de "Asistencia"
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Asistencia',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Divider(), // Línea divisora entre elementos
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Columna de "Nombre"
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(items[index].name),
                      ],
                    ),
                    const SizedBox(width: 90), // Espacio entre columnas
                    // Columna de "Número de control"
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(items[index].noControl),
                      ],
                    ),
                    const SizedBox(width: 90), // Espacio entre columnas
                    // Columna de "Asistencia"
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Checkbox(
                          value: items[index].isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              items[index].isChecked = value ?? false;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
