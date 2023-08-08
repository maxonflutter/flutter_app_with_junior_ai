import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isEditing = false;
  final _formKey = GlobalKey<FormState>();
  String _name = 'John Doe';
  String _email = 'john.doe@example.com';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage('https://via.placeholder.com/150'),
                child: IconButton(
                  icon: Icon(Icons.camera_alt),
                  onPressed: () {},
                ),
              ),
              TextFormField(
                initialValue: _name,
                enabled: _isEditing,
                decoration: InputDecoration(
                  labelText: 'Name',
                  icon: Icon(Icons.person),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
                onSaved: (value) {
                  setState(() {
                    _name = value!;
                  });
                },
              ),
              TextFormField(
                initialValue: _email,
                enabled: _isEditing,
                decoration: InputDecoration(
                  labelText: 'Email',
                  icon: Icon(Icons.email),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
                onSaved: (value) {
                  setState(() {
                    _email = value!;
                  });
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  ElevatedButton(
                    child: Text(_isEditing ? 'Save' : 'Edit'),
                    onPressed: () {
                      if (_isEditing && _formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                      }
                      setState(() {
                        _isEditing = !_isEditing;
                      });
                    },
                  ),
                  if (_isEditing)
                    ElevatedButton(
                      child: Text('Cancel'),
                      onPressed: () {
                        setState(() {
                          _isEditing = false;
                        });
                      },
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}