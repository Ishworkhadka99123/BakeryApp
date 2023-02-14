import 'package:flutter/material.dart';

import 'package:motion_toast/motion_toast.dart';

import '../model/user.dart';
import '../repository/user_repo.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _key = GlobalKey<FormState>();
  final _fnameController = TextEditingController(text: "abc");
  final _lnameController = TextEditingController(text: "abc");
  final _emailController = TextEditingController(text: "abc");
  final _passwordController = TextEditingController(text: "abc");
  String? _radioValue = "true";

  _saveUser() async {
    User user = User(
      fname: _fnameController.text,
      lname: _lnameController.text,
      email: _emailController.text,
      password: _passwordController.text,
    );

    int status = await UserRepositoryImpl().addUser(user);
    _showMessage(status);
  }

  _showMessage(int status) {
    if (status > 0) {
      MotionToast.success(
        description: const Text("Registration successfully"),
      ).show(context);
    } else {
      MotionToast.error(
        description: const Text("Registration Failed"),
      ).show(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
        backgroundColor: Color.fromARGB(255, 249, 130, 33),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Form(
              key: _key,
              child: Column(
                children: [
                  TextFormField(
                    controller: _fnameController,
                    decoration: InputDecoration(
                        labelText: 'First Name',
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.green),
                          borderRadius: BorderRadius.circular(5),
                        )),
                    validator: ((value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter first name';
                      }
                      return null;
                    }),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: _lnameController,
                    decoration: InputDecoration(
                        labelText: 'Last Name',
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.green),
                          borderRadius: BorderRadius.circular(5),
                        )),
                    validator: ((value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter last name';
                      }
                      return null;
                    }),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Select Gender: "),
                  ),
                  RadioListTile(
                      title: const Text("Male"),
                      value: "m",
                      groupValue: _radioValue,
                      onChanged: (value) {
                        setState(() {
                          _radioValue = value.toString();
                        });
                      }),
                  RadioListTile(
                      title: const Text("Female"),
                      value: "f",
                      groupValue: _radioValue,
                      onChanged: (value) {
                        setState(() {
                          _radioValue = value.toString();
                        });
                      }),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                        labelText: 'Email',
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.green),
                          borderRadius: BorderRadius.circular(5),
                        )),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                        labelText: 'Password',
                        hintText: 'Enter Password',
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.green),
                          borderRadius: BorderRadius.circular(5),
                        )),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Password';
                      }
                      if (value.length < 6) {
                        return 'Password length must be at least 6 characters';
                      }

                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    height: 40,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_key.currentState!.validate()) {
                          _saveUser();
                        }
                      },
                      child: const Text(
                        'Register',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: "Brand Bold",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
