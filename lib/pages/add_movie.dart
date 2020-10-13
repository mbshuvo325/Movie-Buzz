import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:moviebuzz/database/temp_db.dart';
import 'package:moviebuzz/models/movie.dart';

class AddNewMoviePage extends StatefulWidget {
  @override
  _AddNewMoviePageState createState() => _AddNewMoviePageState();
}

class _AddNewMoviePageState extends State<AddNewMoviePage> {
  var movie = Movie();
  final _formkey = GlobalKey<FormState>();
  DateTime _selectedDate;
  String category = 'Action';
  String _imagePath = null;
  bool _isCamera = true;

  void _saveMovie() {
    if (_formkey.currentState.validate()) {
      _formkey.currentState.save();
      movie.category = category;
    }
  }

  void _openDatePickerDialogue() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime(2030))
        .then((date) {
      setState(() {
        _selectedDate = date;
        movie.releaseDate = _selectedDate.millisecondsSinceEpoch;
      });
    });
  }

  void _captureImage() {
    ImagePicker().getImage(source: _isCamera ? ImageSource.camera : ImageSource.gallery).then((imgFile) {
      setState(() {
        _imagePath = imgFile.path;
        movie.image = _imagePath;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Movie'),
      ),
      body: Form(
        key: _formkey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Enter Movie Name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'this field must not be empty';
                  }
                  return null;
                },
                onSaved: (value) {
                  movie.name = value;
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Enter Movie Rating',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
                validator: (value) {
                  if (double.parse(value) < 0 || double.parse(value) > 10) {
                    return 'Rating must between 0 and 10';
                  }
                  return null;
                },
                onSaved: (value) {
                  movie.rating = double.parse(value);
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                maxLines: 5,
                decoration: InputDecoration(
                  labelText: 'Enter Movie description',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'this field must not be empty';
                  }
                  return null;
                },
                onSaved: (value) {
                  movie.description = value;
                },
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FlatButton(
                    child: Text(
                      'Choose a Date',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    onPressed: () {
                      _openDatePickerDialogue();
                    },
                  ),
                  Text(_selectedDate == null
                      ? 'No Date Choosen'
                      : DateFormat('EEE, MMM, dd, yyyy').format(_selectedDate)),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Select Category',
                style: TextStyle(color: Colors.grey),
              ),
              DropdownButton(
                value: category,
                items: categories
                    .map((cat) => DropdownMenuItem(
                          value: cat,
                          child: Text(cat),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    category = value;
                  });
                },
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: _imagePath == null
                        ? Text(
                            'No Image Selected',
                            textAlign: TextAlign.center,
                          )
                        : Image.file(File(_imagePath),fit: BoxFit.cover,),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.add_a_photo,
                      size: 40,
                      color: Colors.blueGrey,
                    ),
                    onPressed: () {
                      setState(() {
                        _isCamera = true;
                      });
                      _captureImage();
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.add_photo_alternate,
                      size: 40,
                      color: Colors.blueGrey,
                    ),
                    onPressed: () {
                      setState(() {
                        _isCamera = false;
                      });
                      _captureImage();
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              RaisedButton(
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                color: Theme.of(context).primaryColor,
                child: Text('Save'),
                onPressed: _saveMovie,
              )
            ],
          ),
        ),
      ),
    );
  }
}
