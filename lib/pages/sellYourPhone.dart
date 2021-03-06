import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:secohand/constant.dart';
import 'package:secohand/components/textbox.dart';
import 'package:image_picker/image_picker.dart';
import 'package:secohand/firebase_repository/firebase_repository.dart';
import 'package:path/path.dart' as p;
import 'package:flutter_typeahead/flutter_typeahead.dart';

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
  bool _isChargerAvailable;
  String _screenConditon = 'not mentioned';
  String _imageUrl;
  File _image;
  final picker = ImagePicker();
  final _formKey = GlobalKey<FormState>();

  RegExp phoneMatch = RegExp(r'^\d{10}$');

  final PhonesRepository _phonesRepository = FirebasePhoneRepository();

  clearAll() {
    _nameController.clear();
    _numberController.clear();
    _villageController.clear();
    _brandController.clear();
    _modelController.clear();
    _ageController.clear();
    _ramController.clear();
    _memoryController.clear();
    _batteryController.clear();
    _isChargerAvailable = null;
    _screenConditon = 'not mentioned';
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
                      return _.trim().isEmpty ? 'Name Required' : null;
                    },
                  ),
                  TextBox(
                    text: 'Mobile/WhatsApp number',
                    controller: _numberController,
                    keyboardType: TextInputType.number,
                    validator: (_) {
                      return phoneMatch.hasMatch(_) == false
                          ? 'Please enter Valid phone number'
                          : null;
                    },
                  ),
                  TextBox(
                    text: 'Village',
                    controller: _villageController,
                    validator: (_) {
                      return null;
                    },
                  ),
                  TypeAheadFormField(
                      textFieldConfiguration: TextFieldConfiguration(
                        textAlign: TextAlign.center,
                        controller: _brandController,
                        style: typedText,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 20),
                          hintText: 'Mobile Brand',
                          hintStyle: typedText.copyWith(color: Colors.black54),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                              style: BorderStyle.solid,
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            borderSide:
                                BorderSide(width: 1, color: Colors.black87),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            borderSide:
                                BorderSide(width: 1, color: Colors.black54),
                          ),
                        ),
                      ),
                      onSuggestionSelected: (suggestions) {
                        _brandController.text = suggestions;
                      },
                      itemBuilder: (context, suggestion) {
                        return ListTile(
                          title: Text(suggestion),
                        );
                      },
                      validator: (_) {
                        return _.trim().isEmpty ? 'Set your phone Brand' : null;
                      },
                      onSaved: (value) => _brandController.text = value,
                      suggestionsCallback: (pattern) {
                        return mobileBrands
                            .where((brand) =>
                                (RegExp(pattern, caseSensitive: false)
                                        .hasMatch(brand) ==
                                    true))
                            .toList();
                      }),
                  TextBox(
                    text: 'Mobile Model',
                    controller: _modelController,
                    validator: (_) {
                      return null;
                    },
                  ),
                  TextBox(
                    text: 'Months old',
                    controller: _ageController,
                    keyboardType: TextInputType.number,
                    validator: (_) {
                      return null;
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
                    text: 'Storage in GB',
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
                              groupValue: _isChargerAvailable,
                              onChanged: (value) {
                                setState(() {
                                  _isChargerAvailable = value;
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
                              groupValue: _isChargerAvailable,
                              onChanged: (value) {
                                setState(() {
                                  _isChargerAvailable = value;
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
                              value: 'Good',
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
                              value: 'Broken',
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
                        'Photo',
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
                              if (_image != null) {
                                try {
                                  Scaffold.of(context)
                                    ..hideCurrentSnackBar()
                                    ..showSnackBar(SnackBar(
                                      backgroundColor: Colors.blue,
                                      content: Text('Uploading image...'),
                                      duration: Duration(minutes: 30),
                                    ));
                                  _imageUrl =
                                      await _phonesRepository.uploadImage(
                                          p.basename(_image.path), _image);
                                } catch (e) {
                                  print(e);
                                  Scaffold.of(context)
                                    ..hideCurrentSnackBar()
                                    ..showSnackBar(SnackBar(
                                      backgroundColor: Colors.red,
                                      content: Text('Error Uploading image'),
                                    ));
                                }
                              }
                              Scaffold.of(context)
                                ..hideCurrentSnackBar()
                                ..showSnackBar(SnackBar(
                                  content: Text('Sending your request...'),
                                  duration: Duration(minutes: 30),
                                ));
                              await _phonesRepository.addNewPhone(PhoneInfo(
                                name: _nameController.text,
                                number: _numberController.text,
                                village: _villageController.text,
                                company: _brandController.text.toLowerCase(),
                                model: _modelController.text,
                                old: _ageController.text != ''
                                    ? int.parse(_ageController.text)
                                    : null,
                                ram: _ramController.text != ''
                                    ? int.parse(_ramController.text)
                                    : null,
                                memory: _memoryController.text != ''
                                    ? int.parse(_memoryController.text)
                                    : null,
                                battery: _batteryController.text != ''
                                    ? int.parse(_batteryController.text)
                                    : null,
                                charger: _isChargerAvailable,
                                screen: _screenConditon,
                                image: _imageUrl,
                              ));
                              clearAll();
                              Scaffold.of(context)
                                ..hideCurrentSnackBar()
                                ..showSnackBar(SnackBar(
                                  content: Text('Success'),
                                  backgroundColor: Colors.green,
                                ));
                              Navigator.popUntil(
                                  context, (route) => route.isFirst);
                            } catch (e) {
                              Scaffold.of(context)
                                ..hideCurrentSnackBar()
                                ..showSnackBar(SnackBar(
                                  content: Text('Order Failure'),
                                  backgroundColor: Colors.red,
                                ));
                            }
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
