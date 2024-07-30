import 'package:flutter/material.dart';
import 'package:hop_on/first_screen.dart';

class search_box extends StatefulWidget {
  const search_box({super.key});

  @override
  State<search_box> createState() => _search_boxState();
}

class _search_boxState extends State<search_box> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "Let's Go",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 200,
                width: 360,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(20.0), // Set circular border radius
                  border: Border.all(
                    color: Colors.blue, // Border color
                    width: 2.0, // Border width
                  ),
                ),
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: Padding(
                    padding: EdgeInsets.only(top: 40, right: 20),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 22),
                                  child: Container(
                                    width: 20.0,
                                    height: 20.0,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 40),
                                  child: Container(
                                    height: 90,
                                    child: Row(
                                      children: [
                                        VerticalDivider(
                                          color: const Color.fromARGB(
                                              255, 0, 0, 0),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: 22, bottom: 60),
                                  child: Container(
                                    width: 20.0,
                                    height: 20.0,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(bottom: 50),
                                  child: Container(
                                    width: 280,
                                    height: 170,
                                    child: Column(
                                      children: [
                                        TextField(
                                          decoration: InputDecoration(
                                              // filled: true,
                                              // fillColor: Colors.black,
                                              labelText: "From",
                                              labelStyle: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 176, 213, 221),
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.bold)),
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 150, 190, 226),
                                            fontSize: 20.0, // Set the font size
                                          ),
                                        ),
                                        TextField(
                                          decoration: InputDecoration(
                                            // filled: true,
                                            // fillColor: Colors.black,
                                            labelText: "To",
                                            labelStyle: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 176, 213, 221),
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold),
                                            border: InputBorder.none,
                                          ),
                                          style: TextStyle(
                                            color: const Color.fromARGB(
                                                255,
                                                255,
                                                255,
                                                255), // Set the input text color
                                            fontSize: 20.0, // Set the font size
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // text field done

            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => first_screen()));
                },
                child: Text('Search', style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(300, 50),
                  backgroundColor: Color(0xff4c505b),
                  textStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ), // Set the button size
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),

            Container(
              height: 20.0, // Set the height of the divider
              child: Divider(
                color: const Color.fromARGB(
                    255, 233, 231, 231), // Set the color of the divider
                thickness: 8.0, // Set the thickness of the divider
              ),
            ),

            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Icon(Icons.star, size: 26),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Saved Places",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              child: Container(
                height: 300,
                width: 360,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Saved_places("ketan Hospital"),
                      Saved_places("Railway Station"),
                      Saved_places("Jaipur Electronic Market"),
                      Saved_places("Alka"),
                      Saved_places("M.G.H"),
                      Saved_places("ketan Hospital"),
                      Saved_places("ketan Hospital"),
                      Saved_places("ketan Hospital"),
                      Saved_places("ketan Hospital"),
                      Saved_places("ketan Hospital"),
                    ],
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

Widget Saved_places(String text) {
  return Padding(
    padding: EdgeInsets.only(left: 10),
    child: Container(
      height: 55,
      width: 350,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: const Color.fromARGB(255, 189, 189, 189), // Border color
            width: 1.0, // Border width
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 6),
              child: Icon(Icons.location_on_outlined, size: 20.0),
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      text,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
