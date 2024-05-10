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
              leading: Icon(Icons.report_off),
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
                          floatingActionButton: IconButton(
                            onPressed: (){
                              showModalBottomSheet(
                                isScrollControlled: true,
                                context: context,
                                 builder: (context){
                                   return Scaffold(
                                    appBar: AppBar(title: Text('FORMULARIO'),
                                    ),
                                    body: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: TextField(
                                              decoration: InputDecoration(
                                                labelText: 'ID',
                                                hintText: 'INGRESE SOLO EL CODIGO SOLICITADO',
                                                border: OutlineInputBorder()),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: TextField(
                                                decoration: InputDecoration(
                                                  labelText: 'TITLE',
                                                  hintText: 'INGRESE SOLO CARACTERES',
                                                  border: OutlineInputBorder()),
                                              ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: TextField(
                                                  decoration: InputDecoration(
                                                    labelText: 'BODY',
                                                    hintText: 'INGRESE SOLO CARACTERES',
                                                    border: OutlineInputBorder()),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: ElevatedButton.icon(
                                                    onPressed: (){},
                                                    icon: Icon(Icons.save),
                                                    label: Text('GUADAR')))
                                        ],
                                      ),
                                      ),
                                   );
                                 },);
                            },
                            icon: Icon(Icons.add),
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
      floatingActionButton: ElevatedButton.icon(
        onPressed: () {
          showModalBottomSheet(
            context: context,
             builder: (context){
              return Scaffold(
                appBar: AppBar(
                  title: Text('DATOS'),
                ),
                body: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(labelText: 'NOMBRES'),
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'NOMBRES'),
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'NOMBRES'),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.edit), 
                      label: Text('ACTUALIZAR'))
                  ],
                ),
              );
             });
        }, 
        icon: Icon(Icons.format_align_center), 
        label: Text("FORM")),
    );
  }
}
