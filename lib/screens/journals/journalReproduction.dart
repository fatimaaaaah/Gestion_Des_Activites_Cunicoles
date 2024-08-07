import 'package:flutter/material.dart';
import 'package:projetlicence/screens/journals/ajouterPorter.dart';
import './femelleRabbit.dart';
import './porteeDetailsScreen.dart';

class JournalReproduction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
         centerTitle: true,
        title: const Text(
          'Reproduction',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: FemellesListScreen(),
    );
  }
}

class FemellesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: femellesList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(femellesList[index].name),
            subtitle: Text('Née le ${femellesList[index].birthDate.day}/${femellesList[index].birthDate.month}/${femellesList[index].birthDate.year}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PorteeDetailsScreen(femelle: femellesList[index]),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Naviguer vers l'écran d'ajout de portée
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AjouterPorteeScreen(),
            ),
          );
        },
        backgroundColor: Colors.green,
        child: Icon(Icons.add),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
     debugShowCheckedModeBanner: false,
    home: FemellesListScreen(),
  ));
}

