import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pawsome/firebase/firestore.dart';
import 'package:pawsome/pawsome/screens/lostfound/animalcard.dart';

import '../../../components/my_elevated_button.dart';
import '../../theming.dart';

class AddLostFoundPetScreen extends StatefulWidget {
  const AddLostFoundPetScreen({Key? key}) : super(key: key);

  @override
  _AddLostFoundPetScreenState createState() => _AddLostFoundPetScreenState();
}

class _AddLostFoundPetScreenState extends State<AddLostFoundPetScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _picker = ImagePicker();
  XFile? _imageFile;

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    setState(() {
      _imageFile = pickedFile;
    });
  }

  void _onSubmit() {
    if (_formKey.currentState!.validate()) {
      // Perform submission logic here (e.g. upload image to server, save form data to database)
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Pet info submitted!')),
      );
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: const Text('Add Lost and Found Pet'),
        // ),
        body: SafeArea(
            child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              GestureDetector(
                onTap: () async {
                  final source = await showDialog<ImageSource>(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Select Image Source'),
                      content: SingleChildScrollView(
                        child: ListBody(
                          children: [
                            GestureDetector(
                              child: const Text('Gallery'),
                              onTap: () {
                                Navigator.of(context).pop(ImageSource.gallery);
                              },
                            ),
                            const SizedBox(height: 16),
                            GestureDetector(
                              child: const Text('Camera'),
                              onTap: () {
                                Navigator.of(context).pop(ImageSource.camera);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                  if (source != null) {
                    _pickImage(source);
                  }
                },
                child: AspectRatio(
                  aspectRatio: 1,
                  child: _imageFile == null
                      ? Container(
                          color: Colors.grey[200],
                          child: const Icon(Icons.camera_alt, size: 48),
                        )
                      : Image.file(File(_imageFile!.path), fit: BoxFit.cover),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Title cannot be empty';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
                maxLines: null,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Description cannot be empty';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              MyElevatedButton(
                  onPressed: () {
                    Firestore.lostAnimalRef.add(LostAnimal(
                        isLost: false,
                        name: "test",
                        lostLocation: "test",
                        phone: "phone",
                        picture: "picture",
                        lostDate: "lostDate",
                        description: "description"));
                  },
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(style: TextStyle(fontSize: 20), "🤞"),
                        SizedBox(
                          width: 4,
                        ),
                        Text("Submit")
                      ]))
            ],
          ),
        ),
      ),
    )));
  }
}
