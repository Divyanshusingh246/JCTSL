import 'package:flutter/material.dart';

class see_all_buses extends StatefulWidget {
  const see_all_buses({super.key});

  @override
  State<see_all_buses> createState() => _see_all_busesState();
}

class _see_all_busesState extends State<see_all_buses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        automaticallyImplyLeading: false,
        title: SafeArea(
          child: Column(
            children: [
              Row(
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
                    "Alka",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(
                    width: 180,
                  ),
                  Icon(
                    Icons.directions_walk,
                    color: Colors.grey,
                  ),
                  Text(
                    "2 min",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 20.0, // Set the height of the divider
                child: Divider(
                  color: const Color.fromARGB(
                      255, 233, 231, 231), // Set the color of the divider
                  thickness: 2.0, // Set the thickness of the divider
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            All_buses("AC7"),
            SizedBox(
              height: 10,
            ),
            All_buses("AC2"),
            SizedBox(
              height: 10,
            ),
            All_buses("AC1"),
            SizedBox(
              height: 10,
            ),
            All_buses("01   "),
            SizedBox(
              height: 10,
            ),
            All_buses("11   "),
            SizedBox(
              height: 10,
            ),
            All_buses("55   "),
            SizedBox(
              height: 10,
            ),
            All_buses("09   "),
            SizedBox(
              height: 10,
            ),
            All_buses("AC6"),
            SizedBox(
              height: 10,
            ),
            All_buses("AC2"),
            SizedBox(
              height: 10,
            ),
            All_buses("AC7"),
          ],
        ),
      ),
    );
  }
}

Widget All_buses(String text) {
  return Padding(
    padding: EdgeInsets.only(left: 10),
    child: Container(
      height: 75,
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
        padding: const EdgeInsets.all(10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.directions_bus, size: 20.0),
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
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    SizedBox(
                      width: 175,
                    ),
                    Icon(
                      Icons.network_wifi,
                      size: 16,
                      color: Colors.blueAccent,
                    ),
                    Text(
                      " In 3 min ",
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                  ],
                ),
                Text(
                  "To Broadway ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
