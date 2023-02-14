import 'package:bakery_app/Screen/register.dart';
import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';

import '../model/user.dart';
import '../repository/user_repo.dart';
import 'dashboad.dart';
import 'forgetpassword.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  _login() async {
    print("hello");
    final islogin = await UserRepositoryImpl()
        .loginUser(_usernameController.text, _passwordController.text);
    if (islogin) {
      _goToAnotherPage();
    } else {
      _showMessage();
    }
  }

  _goToAnotherPage() {
    Navigator.pushNamed(context, "/dashboardScreen");
  }

  _showMessage() {
    // showSnackbar(context, 'Invalid username or password', Colors.red);
    MotionToast.error(description: Text("Login failed"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor:  Color.fromARGB(255, 249, 130, 33),
        centerTitle: true,
      ),
      // backgroundColor: Color(0xffD3D3D),
      body: SafeArea(
        child: SingleChildScrollView(
            child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200,
                width: double.infinity,
                // ignore: prefer_const_constructors
                decoration: BoxDecoration(
                    image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/"))),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //     child: Image.asset("assets/images/bakery.jpeg")),
                    const Center(
                      child: Padding(
                        padding: EdgeInsets.all(25.0),
                        child: Text(
                          "Welcome",
                          style: TextStyle(
                              fontSize: 28, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: _usernameController,
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Email';
                        }
                        ;
                      },
                    ),
                    // ignore: prefer_const_constructors
                    SizedBox(
                      height: 15,
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
                    // ignore: prefer_const_constructors
                    SizedBox(
                      height: 15,
                    ),
                    Center(
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(2)),
                            ),
                          ),
                          onPressed: () {
                            // _login();

                            Navigator.pushNamed(context, "/dashboardScreen");
                          },
                          // ignore: prefer_const_constructors
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 18.0),
                            child: const Text('Login'),
                          ),
                        ),
                      ),
                    ),
                    // ignore: prefer_const_constructors
                    SizedBox(
                      height: 15,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Dont have Account?'),
                        InkWell(
                            onTap: () => {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Register()),
                                  )
                                },
                            // ignore: prefer_const_constructors
                            child: Text(
                              ' Register here',
                              style: const TextStyle(
                                color: Colors.blue,
                              ),
                            ))
                      ],
                    ),
                    // ignore: prefer_const_constructors
                    SizedBox(
                      height: 5,
                    ),
                    Center(
                        child: InkWell(
                            onTap: () => {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const Forgetpwd()),
                                  )
                                },
                            child: const Text('Forgot Password?'))),
                  ],
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
