import 'package:flutter/material.dart';
import '../model/user.dart';
import 'detail.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _checkvalue_1 = false;
  bool _checkvalue_2 = false;
  bool _checkvalue_3 = false;
  int _gender = 0;
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmpassController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          // SingleChildScrollView: ko bị thay đổi kích thước (VD:tự bật bàn phím để nhập -> UI ko bị thay đổi kích thước)
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    alignment: Alignment.center,
                    child: const Text(
                      'User Information',
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    )),
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: "Full name",
                    icon: Icon(Icons.person),
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: "Email",
                    icon: Icon(Icons.email),
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    labelText: "Password",
                    icon: Icon(Icons.password),
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _confirmpassController,
                  decoration: const InputDecoration(
                    labelText: "Confirm password",
                    icon: Icon(Icons.password),
                  ),
                ),
                const SizedBox(height: 16),
                const Text("What is your gender?"),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(0),
                        title: const Text("Male"),
                        leading: Transform.translate(
                            offset: const Offset(16, 0),
                            child: Radio(
                              value: 1,
                              groupValue: _gender,
                              onChanged: (value) {
                                setState(() {
                                  _gender = value!; // ko cho phép null
                                });
                              },
                            )),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(0),
                        title: const Text("Female"),
                        leading: Transform.translate(
                            offset: const Offset(16, 0),
                            child: Radio(
                              value: 2,
                              groupValue: _gender,
                              onChanged: (value) {
                                setState(() {
                                  _gender = value!;
                                });
                              },
                            )),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(0),
                        title: const Text("Other"),
                        leading: Transform.translate(
                            offset: const Offset(16, 0),
                            child: Radio(
                              value: 3,
                              groupValue: _gender,
                              onChanged: (value) {
                                setState(() {
                                  _gender = value!;
                                });
                              },
                            )),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Text("What is your favorite?"),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        contentPadding: const EdgeInsets.all(0),
                        title: const Text("Music"),
                        value: _checkvalue_1,
                        onChanged: (value) {
                          setState(() {
                            _checkvalue_1 = value!;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        contentPadding: const EdgeInsets.all(0),
                        title: const Text("Movie"),
                        value: _checkvalue_2,
                        onChanged: (value) {
                          setState(() {
                            _checkvalue_2 = value!;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        contentPadding: const EdgeInsets.all(0),
                        title: const Text("Book"),
                        value: _checkvalue_3,
                        onChanged: (value) {
                          setState(() {
                            _checkvalue_3 = value!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          var fullName = _nameController.text;
                          var email = _emailController.text;
                          var gender = 'None';
                          var check = '';
                          if (_gender == 1) {
                            gender = 'Male';
                          } else if (_gender == 2) {
                            gender = 'Female';
                          } else {
                            gender = 'Other';
                          }

                          if (_checkvalue_1 == true) {
                            check += 'Music,';
                          }
                          if (_checkvalue_2 == true) {
                            check += 'Movie,';
                          }
                          if (_checkvalue_3 == true) {
                            check += 'Book,';
                            
                          }
                          if(check!=""){
                            check = check.substring(0, check.length - 1); //câu lệnh xóa dấu , cuối cùng
                          }
                          //create class
                          var objUser = User(
                            fullName: fullName,
                            email: email,
                            gender: gender,
                            favorite: check
                          );
                          Navigator.push(
                            context,
                              MaterialPageRoute(builder: (context) => Detail(user: objUser),
                              ),
                          );
                        },
                        child: const Text(
                          'Register',
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {},
                        child: const Text('Login'),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
    );
  }
}
