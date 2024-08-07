import 'package:flutter/material.dart';

class HandymanLogotype extends StatelessWidget {
  const HandymanLogotype({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 270,
      height: 170,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              width: 210,
              height: 46,
              color: Colors.white,
              child: const Center(
                child: Text(
                  "Handy",
                  style: TextStyle(
                      fontFamily: 'Akira',
                      fontSize: 40,
                      decoration: TextDecoration.none,
                      color: Colors.black),
                ),
              )),
          const SizedBox(
            height: 10,
          ),
          Container(
              width: 155,
              height: 46,
              color: Colors.white,
              child: const Center(
                child: Row(children: [
                  Text(
                    "Man",
                    style: TextStyle(
                        fontFamily: 'Akira',
                        fontSize: 40,
                        decoration: TextDecoration.none,
                        color: Colors.black),
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 3, bottom: 11),
                      child: Icon(
                        Icons.search_rounded,
                        color: Colors.black,
                        size: 24,
                      ))
                ]),
              )),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "finder app",
            style: TextStyle(
                fontFamily: 'Akira',
                fontSize: 11.5,
                decoration: TextDecoration.none,
                color: Colors.white),
          ),
        ],
      ),
    );
  }
}
