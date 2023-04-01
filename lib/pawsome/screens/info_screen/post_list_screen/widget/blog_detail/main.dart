import 'package:flutter/material.dart';
import 'package:pawsome/components/appbar/main.dart';
import 'package:pawsome/pawsome/theming.dart';

class AnimalCareScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar("Animal Care", context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.network(
              'https://imagesvc.meredithcorp.io/v3/mm/image?q=60&c=sc&poi=%5B900%2C533%5D&w=2000&h=1333&url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F47%2F2021%2F03%2F12%2Fpomeranian-white-puppy-921029690-2000.jpg',
              fit: BoxFit.cover,
              height: 200.0,
              width: double.infinity,
            ),
            SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'How to Care for Animals',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    '1. Provide clean water and food',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  Text(
                    '2. Give them plenty of exercise',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  Text(
                    '3. Keep their living area clean and comfortable',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  Text(
                    '4. Take them to the vet regularly for checkups',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  Text(
                    '5. Show them love and attention',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'By following these simple tips, you can provide the best care for your animals and ensure they are healthy and happy.',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
