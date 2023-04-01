import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pawsome/components/appbar/main.dart';
import 'package:pawsome/pawsome/screens/lostfound/animalcard.dart';

class LostAnimalDetailScreen extends StatelessWidget {
  final LostAnimal lostAnimal;

  LostAnimalDetailScreen({required this.lostAnimal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(lostAnimal.name, context),
      extendBodyBehindAppBar: true,
      body: Padding(
        padding: EdgeInsets.only(top: AppBar().preferredSize.height + 8),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.network(
                lostAnimal.picture,
                fit: BoxFit.cover,
                height: 300.0,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 16.0),
                    Text(
                      lostAnimal.name,
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    SizedBox(height: 8.0),
                    Row(
                      children: [
                        Text(
                          "Lost Date:",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          ' ${lostAnimal.lostDate}',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ],
                    ),
                    SizedBox(height: 8.0),
                    Row(
                      children: [
                        Text(
                          "Location:",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          ' ${lostAnimal.lostLocation}',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ],
                    ),
                    SizedBox(height: 8.0),
                    Row(
                      children: [
                        Text(
                          "Contact:",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          ' ${lostAnimal.phone}',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ],
                    ),
                    SizedBox(height: 16.0),
                    Text('Description:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                    SizedBox(height: 8.0),
                    Text(
                      lostAnimal.description,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
