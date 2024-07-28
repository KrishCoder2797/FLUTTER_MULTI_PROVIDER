import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'displaydata.dart';
import 'main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController idcontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController usernamecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Login Page",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromRGBO(14, 161, 125, 1),
      ),
      body: Column(
        children: [
          Container(
            height: 280,
            margin: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 30,
            ),
            child: Form(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 60,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 0),
                            color: Color.fromRGBO(0, 0, 0, 0.15),
                            spreadRadius: 0,
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      child: TextFormField(
                        controller: idcontroller,
                        // key: _loginKey,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 20),
                          border: InputBorder.none,
                          hintText: "Id",
                          hintStyle: GoogleFonts.poppins(
                              fontSize: 17,
                              color: const Color.fromRGBO(0, 0, 0, 0.4)),
                        ),
                      ),
                    ),
                    Container(
                      height: 60,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 0),
                            color: Color.fromRGBO(0, 0, 0, 0.15),
                            spreadRadius: 0,
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      child: TextFormField(
                        controller: namecontroller,
                        //key: _registerKey,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 20),
                          border: InputBorder.none,
                          hintText: "Name",
                          hintStyle: GoogleFonts.poppins(
                              fontSize: 17,
                              color: const Color.fromRGBO(0, 0, 0, 0.4)),
                        ),
                      ),
                    ),
                    Container(
                      height: 60,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 0),
                            color: Color.fromRGBO(0, 0, 0, 0.15),
                            spreadRadius: 0,
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      child: TextFormField(
                        controller: usernamecontroller,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 20),
                          border: InputBorder.none,
                          hintText: "UserName",
                          hintStyle: GoogleFonts.poppins(
                              fontSize: 17,
                              color: const Color.fromRGBO(0, 0, 0, 0.4)),
                        ),
                      ),
                    ),

                    
                    GestureDetector(
                      onTap: () {
                        EmpData obj2 = EmpData.of(context);

                        setState(() {
                          obj2.id = int.parse(idcontroller.text);
                          obj2.name = namecontroller.text;
                          obj2.userName = usernamecontroller.text;
                        });

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const DisplayData()));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 49,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromRGBO(14, 161, 125, 1),
                        ),
                        child: Text("Submit",
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            )),
                      ),
                    ),
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
