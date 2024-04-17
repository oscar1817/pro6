import 'package:flutter/material.dart';

class reportes extends StatefulWidget {
  const reportes({super.key});

  @override
  State<reportes> createState() => _reportesState();
}

class _reportesState extends State<reportes> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('REPORTES'),
      ),
      body: Column(
        children: [
          CircleAvatar(
            radius: 150,
            backgroundImage: NetworkImage(
                'https://static.vecteezy.com/system/resources/previews/006/423/237/non_2x/snake-head-icon-or-logo-in-a-circle-for-company-community-and-more-free-vector.jpg'),
          ),
          ListTile(
              title: Text('NOMBRE'),
              subtitle: Text('oscar andres marquez vanegas'),
              leading: Icon(Icons.person),
            ),
            ListTile(
              title: Text('CONTACTO'),
              subtitle: Text('48565368536'),
              leading: Icon(Icons.phone),
            ),
            ListTile(
              title: Text('CORREO'),
              subtitle: Text('rasreptiles@gmail.com'),
              leading: Icon(Icons.email_outlined),
            ),
            ListTile(
              title: Text('HORA Y FECHA'),
              subtitle: Text(''),
              leading: Icon(Icons.history_toggle_off_sharp),
            ),
        ],
      ),
    );
  }
}
