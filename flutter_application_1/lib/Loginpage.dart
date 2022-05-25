import 'package:flutter/material.dart';
import 'package:flutter_application_1/Home.dart';
import 'package:flutter_application_1/Homepage.dart';
import 'package:flutter_application_1/singin.dart';
import 'Forgotpassword.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Loginpage extends StatelessWidget {
  const Loginpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: loginpage(
        type: 0,
      ),
    );
  }
}

class loginpage extends StatefulWidget {
  const loginpage({Key? key, required this.type}) : super(key: key);
  final int type;

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  double? sizeBetweenFeiled = 50.0;
  late final int type;
  final _form = GlobalKey<FormState>();
  final _passwordFocus = FocusNode();
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();
  final auth = FirebaseAuth.instance;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  final TextEditingController _emailController = TextEditingController();
  // password text box

  void despose() {
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log in'),
        elevation: 0,
        backgroundColor: Colors.blueAccent,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
      ),
      body: Container(
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
                  height: 200,
                  child: ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      SingleChildScrollView(
                        child: Container(
                          color: Colors.white,
                          // decoration: InputDecoration(
                          //     border: OutlineInputBorder(
                          //   borderRadius: BorderRadius.circular(50),
                          // )),
                          child: TextFormField(
                            textAlign: TextAlign.left,
                            controller: _userNameController,
                            decoration: InputDecoration(
                                labelText: 'email',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
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
                      ),
                      const SizedBox(height: 25),
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
            const SizedBox(height: 5),
            isLoading
                ? const Center(
                    child: CircularProgressIndicator(color: Colors.black))
                : ElevatedButton(
                    child: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                    onPressed: () {
                      final isValid = _form.currentState!.validate();
                      if (!isValid) {
                        return;
                      }
                      _form.currentState!.save();
                      loginUser(
                          _userNameController.text, _passwordController.text);
                    },
                  ),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => signin()));
              },
              child: const Text(
                'Do not have account? SignUp',
                style: TextStyle(color: Colors.black, fontSize: 18.0),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Forgotpassword()));
              },
              child: const Text(
                'Forgot password?',
                style: TextStyle(color: Colors.black, fontSize: 18.0),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> loginUser(String name, String password) async {
    try {
      setState(() {
        isLoading = true;
      });
      await auth.signInWithEmailAndPassword(email: name, password: password);
      if (widget.type == 1) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Home()));
      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Home()));
      }
    } on FirebaseAuthException catch (error) {
      String errorMessage = "";
      if (error.code == "user-not-found") {
        errorMessage = error.code;
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("No user found for that email")));
      } else if (error.code == "wrong-password") {
        errorMessage = error.code;
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Wrong password provided for that user")));
      } else if (error.code == "invalid-email") {
        errorMessage = error.code;
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("invalid email")));
      }

      setState(() {
        isLoading = false;
      });
    } catch (error) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(error.toString())));
    }
  }
}
