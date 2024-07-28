import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'displaydata.dart';
import 'main.dart';

class Skills extends StatefulWidget {
  const Skills({super.key});
  @override
  State<Skills> createState() => _LoginPageState();
}

class _LoginPageState extends State<Skills> {
  TextEditingController skillcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    EmpData obj3 = EmpData.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Skills",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromRGBO(14, 161, 125, 1),
      ),
      body: Column(
        children: [
          Container(
            height: 400,
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
                        controller: skillcontroller,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 20),
                          border: InputBorder.none,
                          hintText: "java, OPP, c++",
                          hintStyle: GoogleFonts.poppins(
                              fontSize: 17,
                              color: const Color.fromRGBO(0, 0, 0, 0.4)),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          obj3.skills.add(skillcontroller.text);
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 49,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromRGBO(14, 161, 125, 1),
                        ),
                        child: Text("Add skill",
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 250,
                      child: ListView.builder(
                          itemCount: obj3.skills.length,
                          itemBuilder: (context, index) {
                            return Container(
                                margin: const EdgeInsets.all(10),
                                height: 20,
                                child: Text(
                                  obj3.skills[index],
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400),
                                ));
                          }),
                    )
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
