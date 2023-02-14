// import 'package:flutter/material.dart';
// import 'package:wear/wear.dart';

// import '../../app/show_snackbar.dart';
// import '../../repository/user_repo.dart';



// class LoginScreenWear extends StatefulWidget {
//   const LoginScreenWear({super.key});

//   @override
//   State<LoginScreenWear> createState() => _LoginScreenWearState();
// }

// class _LoginScreenWearState extends State<LoginScreenWear> {
//   final _formKey = GlobalKey<FormState>();

//   final _usernameController = TextEditingController(text: 'kiran');
//   final _passwordController = TextEditingController(text: 'kiran123');

//   _loginUser() async {
//     final islogin = await UserRepositoryImpl()
//         .loginUser(_usernameController.text, _passwordController.text);
//     if (islogin) {
//       // write here
//       _goToAnotherPage();
//     } else {
//       _showMessage();
//     }
    
          

 
//   }

//   _goToAnotherPage() {
//     Navigator.pushNamed(context, '/Firstpage');
//   }

//   _showMessage() {
//     showSnackbar(context, 'Invalid username or password', Colors.red);
//   }

       
   

  

// List<Widget> lstBottonScreen =[
  

// ];
 
//   @override
//   Widget build(BuildContext context) {
//     return WatchShape(
//         builder: (BuildContext context, WearShape shape, Widget? child) {
//       return AmbientMode(builder: (context, mode, child) {
//         return Scaffold(
//           body: Form(
//             key: _formKey,
//             child: Column(
//               children: [
//                 TextFormField(
//                   controller: _usernameController,
//                   decoration: const InputDecoration(
//                     suffixIcon: Icon(Icons.man),
//                     labelText: 'username',
//                     contentPadding: EdgeInsets.symmetric(
//                       vertical: 6,
//                     ),
//                   ),
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'please enter username';
//                     }
//                     return null;
//                   },
//                 ),
//                 TextFormField(
//                   keyboardType: TextInputType.text,
//                   decoration: const InputDecoration(
//                     labelText: 'password',
//                     contentPadding: EdgeInsets.symmetric(
//                       vertical: 6,
//                     ),
//                   ),
//                   controller: _passwordController,
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'please enter username';
//                     }
//                     return null;
//                   },
//                 ),
//                 SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     child: const Text('Login'),
//                     onPressed: () {
//                       _loginUser();
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );

//       });
//     });
//   }
// }













// // import 'package:flutter/material.dart';
// // import 'package:motion_toast/motion_toast.dart';

// // import '../../repository/user_repo.dart';

// // class LoginWearOSScreen extends StatefulWidget {
// //   const LoginWearOSScreen({super.key});

// //   @override
// //   State<LoginWearOSScreen> createState() => _LoginWearOSScreenState();
// // }

// // class _LoginWearOSScreenState extends State<LoginWearOSScreen> {
// //   final _usernameController = TextEditingController();
// //   final _passwordController = TextEditingController();
// //   final _key = GlobalKey<FormState>();

// //   _loginUser() async {
// //     final user = await UserRepositoryImpl()
// //         .loginUser(_usernameController.text, _passwordController.text);
// //     if (user != null) {
// //       _goToAnotherPage();
// //     } else {
// //       _showMessage();
// //     }
// //   }

// //   _goToAnotherPage() {
// //     Navigator.pushReplacementNamed(context, "/dashboard");
// //   }

// //   _showMessage() {
// //     MotionToast.error(description: const Text('Invalid username or password'))
// //         .show(context);
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //         body: Padding(
// //       padding: const EdgeInsets.all(8.0),
// //       child: Center(
// //           child: SingleChildScrollView(
// //         child: Form(
// //           key: _key,
// //           child: Column(children: [
// //             TextFormField(
// //               controller: _usernameController,
// //               decoration: const InputDecoration(
// //                 labelText: 'Enter your username',
// //               ),
// //             ),
// //             const SizedBox(
// //               height: 8,
// //             ),
// //             TextFormField(
// //               obscureText: true,
// //               controller: _passwordController,
// //               decoration: const InputDecoration(
// //                 labelText: 'Enter your password',
// //               ),
// //             ),
// //             SizedBox(
// //                 width: double.infinity,
// //                 child: ElevatedButton(
// //                     onPressed: () {
// //                       _loginUser();
// //                     },
// //                     child: const Text("Login"))),
// //           ]),
// //         ),
// //       )),
// //     ));
// //   }
// // }
