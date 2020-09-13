import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:secohand/constant.dart';
import 'package:secohand/components/textbox.dart';
import 'package:image_picker/image_picker.dart';
import 'package:secohand/firebase_repository/firebase_repository.dart';

class SellYourPhone extends StatefulWidget {
  @override
  _SellYourPhoneState createState() => _SellYourPhoneState();
}

class _SellYourPhoneState extends State<SellYourPhone> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _villageController = TextEditingController();
  final TextEditingController _brandController = TextEditingController();
  final TextEditingController _modelController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _ramController = TextEditingController();
  final TextEditingController _memoryController = TextEditingController();
  final TextEditingController _batteryController = TextEditingController();
  bool _chargerValue;
  String _screenConditon = 'not mentioned';
  File _image;
  final picker = ImagePicker();
  final _formKey = GlobalKey<FormState>();

  final PhonesRepository _phonesRepository = FirebasePhoneRepository();

  clearAll(){
    _nameController.clear();
    _numberController.clear();
    _villageController.clear();
    _brandController.clear();
    _modelController.clear();
    _ageController.clear();
    _ramController.clear();
    _memoryController.clear();
    _batteryController.clear();
    _chargerValue=null;
    _screenConditon='not mentioned';
    _image = null;
  }

  Future getImageFromCamera() async {
    final pickedFile =
        await picker.getImage(source: ImageSource.camera, imageQuality: 50);
    setState(() {
      _image = File(pickedFile.path);
    });
  }

  Future getImageFromGallery() async {
    final pickedFile =
        await picker.getImage(source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      _image = File(pickedFile.path);
    });
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        getImageFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      getImageFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Center(
            child: Text(
          'SELL YOUR PHONE',
          style: appbar,
        )),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Icon(
            FeatherIcons.plus,
            color: background,
          )
        ],
      ),
      body: Builder(builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextBox(
                    text: 'Name',
                    controller: _nameController,
                    validator: (_) {
                      return _.trim().isEmpty ? 'Please enter your name' : null;
                    },
                  ),
                  TextBox(
                    text: 'Mobile/WhatsApp number',
                    controller: _numberController,
                    keyboardType: TextInputType.number,
                    validator: (_) {
                      return _.trim().isEmpty
                          ? 'Please enter phone number'
                          : null;
                    },
                  ),
                  TextBox(
                    text: 'Village',
                    controller: _villageController,
                    validator: (_) {
                      return _.trim().isEmpty
                          ? 'Please enter where you live'
                          : null;
                    },
                  ),
                  TextBox(
                    text: 'Mobile Brand',
                    controller: _brandController,
                    validator: (_) {
                      return _.trim().isEmpty ? 'Please enter some text' : null;
                    },
                  ),
                  TextBox(
                    text: 'Mobile Model',
                    controller: _modelController,
                    validator: (_) {
                      return null;
                    },
                  ),
                  TextBox(
                    text: 'months old',
                    controller: _ageController,
                    keyboardType: TextInputType.number,
                    validator: (_) {
                      return _.trim().isEmpty
                          ? 'Please enter phone number'
                          : null;
                    },
                  ),
                  TextBox(
                    text: 'RAM in GB',
                    controller: _ramController,
                    keyboardType: TextInputType.number,
                    validator: (_) {
                      return null;
                    },
                  ),
                  TextBox(
                    text: 'Memory in GB',
                    controller: _memoryController,
                    keyboardType: TextInputType.number,
                    validator: (_) {
                      return null;
                    },
                  ),
                  TextBox(
                    text: 'Battery Capacity',
                    controller: _batteryController,
                    keyboardType: TextInputType.number,
                    validator: (_) {
                      return null;
                    },
                  ),
                  Row(
                    children: [
                      Text(
                        'Charger Included?',
                        style: typedText.copyWith(color: Colors.black54),
                      ),
                      Expanded(
                        child: ListTile(
                          contentPadding: EdgeInsets.all(0),
                          title: Text(
                            'Yes',
                            style: typedText,
                          ),
                          leading: Radio(
                              value: true,
                              groupValue: _chargerValue,
                              onChanged: (value) {
                                setState(() {
                                  _chargerValue = value;
                                });
                              }),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          contentPadding: EdgeInsets.all(0),
                          title: Text(
                            'No',
                            style: typedText,
                          ),
                          leading: Radio(
                              value: false,
                              groupValue: _chargerValue,
                              onChanged: (value) {
                                setState(() {
                                  _chargerValue = value;
                                });
                              }),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Screen Condition?',
                        style: typedText.copyWith(color: Colors.black54),
                      ),
                      Expanded(
                        child: ListTile(
                          contentPadding: EdgeInsets.all(0),
                          title: Text(
                            'Good',
                            style: typedText,
                          ),
                          leading: Radio(
                              value: 'good',
                              groupValue: _screenConditon,
                              onChanged: (value) {
                                setState(() {
                                  _screenConditon = value;
                                });
                              }),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          contentPadding: EdgeInsets.all(0),
                          title: Text(
                            'Broken',
                            style: typedText,
                          ),
                          leading: Radio(
                              value: 'broken',
                              groupValue: _screenConditon,
                              onChanged: (value) {
                                setState(() {
                                  _screenConditon = value;
                                });
                              }),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Upload Phone Photo',
                        style: typedText.copyWith(color: Colors.black54),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 100,
                          width: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            color: Colors.black26,
                            image: DecorationImage(
                                image: _image == null
                                    ? AssetImage('images/placeholder.png')
                                    : FileImage(_image),
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                      IconButton(
                          icon: Icon(
                            FeatherIcons.upload,
                            size: 25,
                          ),
                          onPressed: () {
                            _showPicker(context);
                          })
                    ],
                  ),
                  //-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//
                  //-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Hero(
                      tag: 'button',
                      child: RawMaterialButton(
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            try {
                              Scaffold.of(context)
                                ..hideCurrentSnackBar()
                                ..showSnackBar(SnackBar(
                                  content: Text('Sending your request...'),
                                ));
                              await _phonesRepository.addNewPhone(PhoneInfo(
                                  name: _nameController.text,
                                  number: _numberController.text,
                                  village: _villageController.text,
                                  company: _brandController.text,
                                  model: _modelController.text,
                                  old: int.parse(_ageController.text),
                                  ram: int.parse(_ramController.text),
                                  memory: int.parse(_memoryController.text),
                                  battery: int.parse(_batteryController.text),
                                  charger: _chargerValue,
                                  screen: _screenConditon));
                                  
                            } catch (e) {
                              Scaffold.of(context)
                                ..hideCurrentSnackBar()
                                ..showSnackBar(SnackBar(
                                  content: Text('Order Failure'),
                                  backgroundColor: Colors.red,
                                ));
                            }
                            clearAll();
                          Scaffold.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(SnackBar(
                              content: Text('Success'),
                              backgroundColor: Colors.green,
                            ));
                          }
                          
                        },
                        constraints: BoxConstraints(),
                        elevation: 5.0,
                        fillColor: iconAdd,
                        child: Text(
                                'SUBMIT',
                                style: buttonText,
                              ),
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
