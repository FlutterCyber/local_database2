import 'package:flutter/material.dart';
import 'package:local_database2/model/user_model.dart';
import 'package:local_database2/pages/sign_in.dart';
import 'package:local_database2/services/db_service.dart';

class SignUpPage extends StatefulWidget {
  static final String id = "sign_up";

  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final addressController = TextEditingController();

  doSignUp(){
    String eml = emailController.text.toString().trim();
    String pass =passwordController.text.toString().trim();
    String adrs = addressController.text.toString().trim();
    var signup = UserSignUp(eml, pass, adrs);
    HiveDB().storeSignUp(signup);
    print(HiveDB().loadUserSignUp().emailSignUp);
    print(HiveDB().loadUserSignUp().passwordSignUp);
    print(HiveDB().loadUserSignUp().addressSignUp);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff077F7B),
      body: Container(
        // margin: EdgeInsets.all(20),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          //mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    "Welcome",
                    style: TextStyle(
                        fontSize: 17,
                        //fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Sign Up",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                ],
              ),
            ),
            // ikkinchi yarmi
            Expanded(
              child: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(),
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(left: 20, right: 20, bottom: 50),
                    //margin: EdgeInsets.all(15),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40.0),
                        topLeft: Radius.circular(40.0),
                      ),
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
                        const Text(
                          "Email",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        TextField(
                          controller: emailController,
                          decoration: const InputDecoration(
                            hintText: "Email",
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        const Text(
                          "Password",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        TextField(
                          controller: passwordController,
                          decoration: const InputDecoration(
                            hintText: "Enter your password",
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        const Text(
                          "Address",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        TextField(
                          controller: addressController,
                          decoration: const InputDecoration(
                            hintText: "Enter your address",
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xff077F7B),
                          ),
                          margin: EdgeInsets.only(left: 25, right: 25),
                          width: double.infinity,
                          height: 50,
                          child: FlatButton(
                            onPressed: () {
                              doSignUp();
                            },
                            child: const Center(
                              child: Text(
                                "Sign in",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                color: Colors.grey[200],
                                height: 2,
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            const Text(
                              "OR",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 16),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Container(
                                color: Colors.grey[200],
                                height: 2,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 50,
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: Image.asset(
                                  "assets/images/facebooklogo.png",
                                  fit: BoxFit.fill,
                                  color: Colors.blue,
                                ),
                                onPressed: () {},
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              IconButton(
                                icon: Image.asset(
                                  "assets/images/instagramlogo.png",
                                  fit: BoxFit.fill,
                                  color: Colors.red,
                                ),
                                onPressed: () {},
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              IconButton(
                                icon: Image.asset(
                                  "assets/images/twitterlogo.png",
                                  fit: BoxFit.fill,
                                  color: Colors.blue,
                                ),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Already have an account?",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.grey),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacementNamed(
                                    context, SignInPage.id);
                              },
                              child: const Text(
                                "Sign in",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
