import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Home.dart';
import 'package:flutter_application_1/Homepage.dart';
import 'package:flutter_application_1/Loginpage.dart';
import 'Forgotpassword.dart';

class Signin extends StatelessWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: signin(),
    );
  }
}

class signin extends StatefulWidget {
  const signin({Key? key}) : super(key: key);

  @override
  State<signin> createState() => _signinState();
}

class _signinState extends State<signin> {
  double? sizeBetweenFeiled = 10.0;

  final _form = GlobalKey<FormState>();
  final _passwordFocus = FocusNode();
  final _userNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;
  late UserCredential userCredential;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text('Sign in'),
          backgroundColor: Colors.blueAccent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ),
        body: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              height: size.height,
              color: Theme.of(context).colorScheme.onPrimary,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Form(
                    key: _form,
                    child: Padding(
                      padding: const EdgeInsets.all(22.0),
                      child: SizedBox(
                        height: 251,
                        child: ListView(
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            Container(
                              color: Colors.white,
                              child: TextFormField(
                                textAlign: TextAlign.left,
                                controller: _userNameController,
                                cursorColor: Colors.white,
                                decoration: InputDecoration(
                                    labelText: 'username',
                                    focusColor: Colors.white,
                                    hoverColor: Colors.white,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4),
                                    )),
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.text,
                                onFieldSubmitted: (_) {
                                  FocusScope.of(context)
                                      .requestFocus(_passwordFocus);
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Username must be entered';
                                  }
                                  return null;
                                },
                                onSaved: (value) {},
                              ),
                            ),
                            SizedBox(height: sizeBetweenFeiled),
                            Container(
                              color: Colors.white,
                              child: TextFormField(
                                textAlign: TextAlign.left,
                                controller: _emailController,
                                decoration: InputDecoration(
                                    labelText: 'email',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4),
                                    )),
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.text,
                                onFieldSubmitted: (_) {
                                  FocusScope.of(context)
                                      .requestFocus(_passwordFocus);
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Email must be entered';
                                  }
                                  return null;
                                },
                                onSaved: (value) {},
                              ),
                            ),
                            SizedBox(height: sizeBetweenFeiled),
                            Container(
                              color: Colors.white,
                              child: TextFormField(
                                textAlign: TextAlign.left,
                                obscureText: true,
                                controller: _passwordController,
                                decoration: InputDecoration(
                                    labelText: 'password',
                                    focusColor: Colors.white,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4),
                                    )
                                    //hintText: 'password',
                                    ),
                                textInputAction: TextInputAction.done,
                                keyboardType: TextInputType.text,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Password must be entered';
                                  }
                                  return null;
                                },
                                onSaved: (value) {},
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 70),
                  isLoading
                      ? const Center(
                          child: CircularProgressIndicator(color: Colors.black))
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              child: const Padding(
                                padding: EdgeInsets.all(6.0),
                                child: Text(
                                  'Sigin in ',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18.0),
                                ),
                              ),
                              onPressed: () {
                                registerUser(
                                    _emailController.text,
                                    _userNameController.text,
                                    _passwordController.text,
                                    0);
                              },
                            ),
                            const SizedBox(width: 5),
                          ],
                        ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Loginpage()));
                    },
                    child: const Text(
                      'Already have account? SignIn',
                      style: TextStyle(color: Colors.black, fontSize: 18.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Future<void> registerUser(
      String email, String name, String password, int typeAccount) async {
    try {
      setState(() {
        isLoading = true;
      });
      userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Account created successfully ")));
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
    } on FirebaseAuthException catch (error) {
      setState(() {
        isLoading = false;
      });
      String errorMessage = "";
      switch (error.code) {
        case "weak-password":
          errorMessage = "The password provided is too weak.";
          break;
        case "email-already-in-use":
          errorMessage = "The account already exists for that email.";
          break;
        default:
          errorMessage = "An undefined Error happened.";
      }
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(errorMessage)));
    } catch (error) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(error.toString())));
    }
  }
}
