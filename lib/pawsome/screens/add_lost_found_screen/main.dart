import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pawsome/firebase/firestore.dart';
import 'package:pawsome/pawsome/screens/lostfound/animalcard.dart';
import 'package:toggle_switch/toggle_switch.dart';

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
  final _phoneController = TextEditingController();
  final _locationController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _picker = ImagePicker();
  bool isLost = false;
  int initialIndex = 0;
  DateTime? _selectedDate = DateTime.now();
  XFile? _imageFile;
  final storageRef = FirebaseStorage.instance.ref();

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);

    setState(() {
      _imageFile = pickedFile;
    });
  }

  void _onSubmit() async {
    if (_titleController.text.isEmpty ||
        _phoneController.text.isEmpty ||
        _locationController.text.isEmpty ||
        _descriptionController.text.isEmpty ||
        _imageFile == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all the fields')),
      );
      return;
    }
    if (_formKey.currentState!.validate()) {
      final pickedFile = _imageFile;
      if (pickedFile == null) return;
      final imageRef =
          storageRef.child('images/${DateTime.now()}${pickedFile.name}.png');
      String filePath = pickedFile.path;
      File file = File(filePath);
      final uploadTask = imageRef.putFile(file);
      final snapshot = await uploadTask.whenComplete(() => null);
      final downloadUrl = await snapshot.ref.getDownloadURL();
      print(downloadUrl);
      Firestore.lostAnimalRef.add(LostAnimal(
        isLost: isLost,
        name: _titleController.text,
        lostLocation: _locationController.text,
        phone: _phoneController.text,
        picture: downloadUrl,
        lostDate: _selectedDate.toString().substring(0, 10),
        description: _descriptionController.text,
      ));

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

  Future<DateTime?> selectDate(BuildContext context) async {
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    return selectedDate;
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
            crossAxisAlignment: CrossAxisAlignment.start,
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
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Name cannot be empty';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                keyboardType: TextInputType.phone,
                controller: _phoneController,
                decoration: const InputDecoration(
                  labelText: 'Phone',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Name cannot be empty';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              ToggleSwitch(
                minWidth: 140.0,
                initialLabelIndex: initialIndex,
                cornerRadius: 12.0,
                activeFgColor: Colors.white,
                inactiveBgColor: Colors.grey,
                inactiveFgColor: Colors.white,
                totalSwitches: 2,
                labels: ['I lost pet', 'I found pet'],
                activeBgColors: [
                  [Colors.pink],
                  [Colors.blue],
                ],
                onToggle: (index) {
                  print('switched to: $index');
                  setState(() {
                    initialIndex = index!;
                    isLost = index == 0;
                  });
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _locationController,
                decoration: InputDecoration(
                  labelText:
                      'Where did you ${isLost ? "lose" : "find"} the pet',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Name cannot be empty';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                      const EdgeInsets.all(0),
                    ),
                  ),
                  onPressed: () async {
                    _selectedDate = await selectDate(context);
                    setState(() {});
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(4)),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          Text("${isLost ? "Lost" : "Found"} Date: "),
                          Text(_selectedDate.toString().substring(0, 10))
                        ],
                      ),
                    ),
                  )),
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
                  onPressed: _onSubmit,
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
