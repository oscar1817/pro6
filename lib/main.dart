import 'package:flutter/material.dart';
import 'package:pro6/api/ras.dart';
import 'package:pro6/interfaz/desarrollador.dart';
import 'package:pro6/interfaz/reportes.dart';
import 'package:pro6/interfaz/grid.dart';

void main(List<String> args) {
  runApp(RAS());
}

class RAS extends StatelessWidget {
  const RAS({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: principio(),
    );
  }
}

class principio extends StatefulWidget {
  const principio({super.key});

  @override
  State<principio> createState() => _principioState();
}

class _principioState extends State<principio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RAS'),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green,
              ), //BoxDecoration
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.green),
                accountName: Text(
                  "RAS",
                  style: TextStyle(fontSize: 18),
                ),
                accountEmail: Text("rasreptiles@gmail.com"),
                currentAccountPictureSize: Size.square(50),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 165, 255, 137),
                  child: Text(
                    "R",
                    style: TextStyle(fontSize: 30.0, color: Colors.blue),
                  ), //Text
                ), //circleAvatar
              ), //UserAccountDrawerHeader
            ), //DrawerHeader

            ListTile(
              title: Text('INICIO'),
              leading: Icon(Icons.home),
            ),
            Divider(),
            ListTile(
              title: Text('REPORTES'),
              leading: Icon(Icons.report),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => reportes(),
                  ),
                );
              },
            ),
            Divider(),
            ListTile(
              title: Text('REPORTES'),
              leading: Icon(Icons.home),
              onTap: () {
                Buscaras().then((r) {
                  showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (context) {
                        return Scaffold(
                          appBar: AppBar(
                            title: Text("RAS"),
                          ),
                          body: ListView.builder(
                            itemCount: r.length,
                            itemBuilder: (BuildContext context, int i) {
                              return ListTile(
                                leading: CircleAvatar(
                                  backgroundImage: NetworkImage(r[i].url),
                                ),
                                title: Text(r[i].title),
                                trailing: Text(r[i].id.toString()),
                              );
                            },
                          ),
                        );
                      });
                });
              },
            ),
            Divider(),
            ListTile(
              title: Text('CONTACTO'),
              leading: Icon(Icons.phone),
            ),
            Divider(),
            ListTile(
              title: Text('DESARROLLADOR'),
              leading: Icon(Icons.contacts),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => programa(),
                  ),
                );
              },
            ),
            Divider(),
            ListTile(
              title: Text('GRIND'),
              leading: Icon(Icons.home_max_outlined),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => serpientes(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          CircleAvatar(
            radius: 150,
            backgroundImage: NetworkImage(
                'https://png.pngtree.com/png-clipart/20200225/original/pngtree-coral-snake-poisonous-and-danger-mammal-vector-png-image_5307894.jpg'),
          ),
          Text('RAS')
        ],
      ),
    );
  }
}
