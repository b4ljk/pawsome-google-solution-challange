import 'package:flutter/material.dart';
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
                    Text(
                      'Lost Date: ',
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Location: ${lostAnimal.lostLocation}',
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Phone: ${lostAnimal.phone}',
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      'Description:',
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
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
