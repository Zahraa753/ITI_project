import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerExample extends StatefulWidget {
  @override
  _ImagePickerExampleState createState() => _ImagePickerExampleState();
}

class _ImagePickerExampleState extends State<ImagePickerExample> {
  File? _image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Image Picker Example',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 201, 188, 204),
          ),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        spacing: 20,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                backgroundImage: _image == null ? null : FileImage(_image!),
                radius: 90,
              ),
              GestureDetector(onTap: pickImage, child: Icon(Icons.camera_alt)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Builder(
                builder: (context) => FloatingActionButton(
                  onPressed: () {},
                  child: Text('Upload'),
                ),
              ),
              SizedBox(width: 20),
              FloatingActionButton(onPressed: () {}, child: Text('Load')),
            ],
          ),
        ],
      ),
    );
  }

  void pickImage() async {
    var image = await ImagePicker().pickImage(source: ImageSource.camera);

    setState(() {
      _image = image != null ? File(image.path) : null;
    });
  }
}
