import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class Photo extends StatefulWidget {
  const Photo({Key? key}) : super(key: key);

  @override
  State<Photo> createState() => _PhotoState();
}

class _PhotoState extends State<Photo> {
  File? imagen;
  final picker = ImagePicker();

  dynamic _data;
  Future<void> readJson() async {
    String dataResponse = await DefaultAssetBundle.of(context)
        .loadString("assets/json/response.json");
    final jsonResult = jsonDecode(dataResponse);
    setState(() {
      _data = jsonResult;
    });
  }

  Future selImagen(op) async {
    var pickedFile;

    if (op == 1) {
      pickedFile = await picker.pickImage(source: ImageSource.camera);
    } else {
      pickedFile = await picker.pickImage(source: ImageSource.gallery);
    }

    setState(() {
      if (pickedFile != null) {
        imagen = File(pickedFile.path);
      } else {
        print('No se selcciono ninguna imagen');
      }
    });

    Navigator.of(context).pop();
  }

  opciones(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: const EdgeInsets.all(0),
            content: SingleChildScrollView(
                child: Column(
              children: [
                InkWell(
                  onTap: () {
                    selImagen(1);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(width: 1, color: Colors.green))),
                    child: Row(
                      children: const [
                        Expanded(
                          child: Text(
                            'Tomar una Foto',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        Icon(Icons.camera_alt, color: Colors.blue)
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    selImagen(2);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: const [
                        Expanded(
                          child: Text(
                            'Seleccionar una Foto',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        Icon(Icons.image_sharp, color: Colors.blue)
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(color: Colors.red.shade400),
                    child: Row(
                      children: const [
                        Expanded(
                          child: Text(
                            'Cancelar',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 4),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    Theme.of(context).colorScheme.secondary),
                padding: MaterialStateProperty.all(
                    const EdgeInsets.fromLTRB(16, 24, 16, 24)),
                textStyle: MaterialStateProperty.all(
                    Theme.of(context).textTheme.button),
                elevation: MaterialStateProperty.all(0),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16))),
              ),
              onPressed: () {
                opciones(context);
              },
              child: const Text('Seleccione una Imagen'),
            )),
        Padding(
            padding: const EdgeInsets.fromLTRB(16, 4, 16, 20),
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                side: BorderSide(
                    color: Theme.of(context).colorScheme.primary, width: 2.0),
              ),
              onPressed: () {
                if (imagen != null) {
                  // Make POST to API

                  // Fake POST and Response
                  readJson();
                  _data.isNotEmpty
                      ? (showModalBottomSheet<void>(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(32),
                                topRight: Radius.circular(32)),
                          ),
                          backgroundColor: Colors.white,
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              height: 600,
                              padding: const EdgeInsets.all(16),
                              child: ListView(
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 200,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            image: DecorationImage(
                                              image: FileImage(imagen!),
                                              fit: BoxFit.cover,
                                            )),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 16, 0, 16),
                                        child: Text(
                                          _data["disease"]["label_name"]
                                              .toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline4,
                                          textAlign: TextAlign.left,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            );
                          }))
                      : Container();
                }
              },
              child: Text(
                'Diagnosticar',
                style: Theme.of(context).textTheme.button,
              ),
            )),
        const SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
              child: imagen == null ? const Center() : Image.file(imagen!)),
        ),
      ],
    );
  }
}
