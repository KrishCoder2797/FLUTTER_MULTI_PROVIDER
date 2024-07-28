import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:state_management/loginscreeen.dart';
import 'package:state_management/main.dart';
import 'package:state_management/skills.dart';

class DisplayData extends StatefulWidget {
  const DisplayData({super.key});

  @override
  State<DisplayData> createState() => _LoginPageState();
}

class _LoginPageState extends State<DisplayData> {
  @override
  Widget build(BuildContext context) {
    EmpData obj = EmpData.of(context);

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Display Data",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          backgroundColor: const Color.fromRGBO(14, 161, 125, 1),
        ),
        body: Column(
          children: [
            const SizedBox(height: 50),
            Row(
              children: [
                const SizedBox(width: 180),
                Text("Emp id is:  ${obj.id}",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w600)),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const SizedBox(width: 180),
                Text(
                  "Emp name is:  ${obj.name}",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w600),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const SizedBox(width: 180),
                Text(
                  "Emp username is:  ${obj.userName}",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w600),
                )
              ],
            ),
            Divider(),
            const SizedBox(height: 50),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Skills()));
              },
              child: Container(
                alignment: Alignment.center,
                height: 49,
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromRGBO(14, 161, 125, 1),
                ),
                child: Text("Add Skills",
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    )),
              ),
            ),
          ],
        ));
  }
}
