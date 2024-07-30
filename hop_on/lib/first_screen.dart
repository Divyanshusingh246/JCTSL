import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hop_on/route_map.dart';
import 'package:hop_on/search_box.dart';
import 'package:hop_on/see_all_buses.dart';
import 'package:shared_preferences/shared_preferences.dart';

class first_screen extends StatefulWidget {
  const first_screen({super.key});

  @override
  State<first_screen> createState() => _first_screenState();
}

class _first_screenState extends State<first_screen> {
  String currentUserName = '';
  @override
  // void initState() {
  //   super.initState();
  //   getCurrentLocation();
  // }
  void initState() {
    super.initState();
    _getCurrentUser(); // Retrieve the current user's name when the widget initializes
  }

  _getCurrentUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      currentUserName = prefs.getString('name') ??
          ''; // Get the current user's name from SharedPreferences
    });
  }

  User? currentUser;

  getCurrentLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      print("Location Denied");
      LocationPermission ask = await Geolocator.requestPermission();
    } else {
      Position currentPosition = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
      print("Latitude=${currentPosition.latitude.toString()}");
      print("Longitude=${currentPosition.longitude.toString()}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        title: Row(
          children: [
            // Icon(
            //   Icons.account_circle,
            //   size: 30,
            // ),
            SizedBox(
              width: 80,
            ),
            Text(
              "JCTSL",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      drawer: _buildDrawer(context, currentUserName),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => search_box()),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(30.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey, // Light grey color
                          spreadRadius: 0,
                          blurRadius: 4,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.search, size: 30.0), // Search icon
                        SizedBox(width: 10.0), // Spacer
                        Text(
                          'Enter Start Point',
                          style: TextStyle(fontSize: 20.0),
                        ), // Text
                      ],
                    ),
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 20),
                      curvedContainerWithIconAndText(context),
                      SizedBox(width: 20),
                      curvedContainerWithIconAndText(context),
                      SizedBox(width: 20),
                      curvedContainerWithIconAndText(context),
                      SizedBox(width: 20),
                      curvedContainerWithIconAndText(context),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 20.0, // Set the height of the divider
                child: Divider(
                  color: const Color.fromARGB(
                      255, 233, 231, 231), // Set the color of the divider
                  thickness: 8.0, // Set the thickness of the divider
                ),
              ),
              // NEAREST BUS STOP
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "Nearest Bus Stop",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey, // Light grey color
                        spreadRadius: 0,
                        blurRadius: 3,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 15,
                          ),
                          Icon(Icons.location_on_outlined),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "Alka",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          SizedBox(
                            width: 150,
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
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          "Next buses",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.blueAccent),
                        ),
                      ),
                      Next_buses("AC2", context),
                      Next_buses("AC7", context),
                      SizedBox(
                        height: 30,
                      ),
                      // Center(
                      //     child: Text(
                      //   "See all buses",
                      //   style: TextStyle(
                      //       fontWeight: FontWeight.bold,
                      //       fontSize: 16,
                      //       color: Color.fromARGB(255, 255, 210, 74)),
                      // )),
                      Center(
                        child: RichText(
                          text: TextSpan(
                            text: 'See all buses ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Color.fromARGB(255, 255, 210, 74)),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => see_all_buses()),
                                  ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "All Buses Routes",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => route_map()),
                    );
                  },
                  child: Container(
                    height: 300,
                    width: 340,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.amber,
                    ),
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: ClipRRect(
                          child: Image.asset("assets/buses_maps.jpg")),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget curvedContainerWithIconAndText(BuildContext context) {
  return GestureDetector(
    onTap: () {
      // Navigate to the next page when the container is clicked
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => search_box()),
      );
    },
    child: Container(
      height: 75,
      width: 175,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey, // Light grey color
            spreadRadius: 0,
            blurRadius: 3,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.route, size: 20.0), // Travel icon
              SizedBox(width: 20.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "From: ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text("chomu puliya "),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "To: ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text("mgh"),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget Next_buses(String text, context) {
  return Padding(
    padding: EdgeInsets.only(left: 10),
    child: Container(
      height: 75,
      width: MediaQuery.of(context).size.width,
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
                      width: 140,
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

class User {
  final String name;

  User(this.name);
}

// Function to build the drawer
Widget _buildDrawer(BuildContext context, String username) {
  User? currentUser;
  return Drawer(
    child: ListView(
      // ListView for scrollable drawer content
      children: [
        // Assume this is your current user object

        Padding(
          padding: const EdgeInsets.all(2 - .0),
          child: ListTile(
              title: Text(
            "Welcome",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          )),
        ),
        ListTile(
            title: Row(
          children: [
            Icon(
              Icons.account_circle,
              size: 35,
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              "$username",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        )),
        ListTile(
          title: Container(
            height: 20.0, // Set the height of the divider
            child: Divider(
              color: Color.fromARGB(
                  255, 210, 210, 210), // Set the color of the divider
              thickness: 8.0, // Set the thickness of the divider
            ),
          ),
        ),
        ListTile(title: drawer_text(Icons.interests_rounded, 'Setting')),
        SizedBox(
          height: 20,
        ),
        ListTile(title: drawer_text(Icons.language_rounded, "Change Language")),
        SizedBox(
          height: 20,
        ),
        ListTile(title: drawer_text(Icons.emergency_outlined, "Emergency")),
        SizedBox(
          height: 20,
        ),
        ListTile(title: drawer_text(Icons.feedback_rounded, "Feedback")),
        SizedBox(
          height: 20,
        ),
        ListTile(title: drawer_text(Icons.notes_outlined, "Terms & Condition")),
        SizedBox(
          height: 20,
        ),
        ListTile(
            title: drawer_text(Icons.privacy_tip_rounded, "Privacy Policy")),
        SizedBox(
          height: 20,
        ),
        ListTile(
            title: drawer_text(Icons.share_arrival_time_outlined, "Share App")),
      ],
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: first_screen(),
    );
  }
}

Widget drawer_text(IconData iconData, String text) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Icon(
        iconData,
        size: 20,
      ),
      SizedBox(width: 15), // Add spacing between icon and text
      Text(
        text,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    ],
  );
}
