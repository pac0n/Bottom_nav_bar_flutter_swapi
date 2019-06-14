//En un bottom navigation bar se establecen botones para mostrar una lista de personajes, planetas y vehiculos usando la API de StarWars (SWAPI). Francisco Garcés
import 'package:flutter/material.dart';
import 'package:swapi_en_flutter/personajes.dart';
import 'package:swapi_en_flutter/planetas.dart';
import 'package:swapi_en_flutter/vehiculos.dart';

void main() {
  runApp(new MaterialApp(
    // Title
      title: "Swapi en Flutter",
      // Home
      home: new Principal()));
}

class Principal extends StatefulWidget {
  @override
  PrincipalState createState() => new PrincipalState();
}

// SingleTickerProviderStateMixin is used for animation
class PrincipalState extends State<Principal> with SingleTickerProviderStateMixin {
  // Create a tab controller
  TabController controller;

  @override
  void initState() {
    super.initState();

    // Initialize the Tab Controller
    controller = new TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    // Dispose of the Tab Controller
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // Set the TabBar view as the body of the Scaffold
      body: new TabBarView(
        // Add tabs as widgets
        children: <Widget>[new PeoplePage(), new PlanetPage(), new VehiclesPage()],
        // set the controller
        controller: controller,
      ),
      // Set the bottom navigation bar
      bottomNavigationBar: new Material(
        // set the color of the bottom navigation bar
        color: Colors.cyan,
        // set the tab bar as the child of bottom navigation bar
        child: new TabBar(
          tabs: <Tab>[
            new Tab(
              // set icon to the tab
              icon: new Icon(Icons.face),
            ),
            new Tab(
              icon: new Icon(Icons.blur_circular),
            ),
            new Tab(
              icon: new Icon(Icons.airplanemode_active),
            ),
          ],
          // setup the controller
          controller: controller,
        ),
      ),
    );
  }
}
