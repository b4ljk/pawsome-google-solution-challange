import 'package:flutter/material.dart';
import 'package:pawsome/pawsome/screens/shelter/feed.dart';
import 'package:pawsome/pawsome/screens/lostfound/main.dart';

import '../../../../components/my_elevated_button.dart';
import '../../../theming.dart';

class ShelterDetailScreen extends StatefulWidget {
  const ShelterDetailScreen({Key? key}) : super(key: key);

  @override
  _ShelterDetailScreenState createState() => _ShelterDetailScreenState();
}

class _ShelterDetailScreenState extends State<ShelterDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 48, left: 8, right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Icon(Icons.pets),
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Shelter Name",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                "Shelter Description",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec nec magna faucibus, rhoncus sapien a, rutrum tortor. Duis vel augue nec quam malesuada blandit non eu odio. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Quisque sodales pharetra metus, ac maximus purus lacinia vel. Nam sodales metus purus, in pulvinar risus pretium quis. Sed vitae eleifend enim, eu egestas leo. Nunc gravida, quam vitae gravida facilisis, massa lorem varius sapien, a porttitor magna odio eget ipsum. Donec bibendum, nibh sed pharetra posuere, est sapien ultricies velit, eu volutpat ex nisl et nulla. Etiam posuere felis eu mauris elementum, vel luctus purus dignissim. Sed sed nulla mauris.",
                style: TextStyle(fontSize: 16),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                "Currently Listed Adoptable Pets",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
            GridView.count(
              crossAxisCount: 1,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.all(16),
              children: [
                Post(
                  snap: null,
                ),
                Post(
                  snap: null,
                ),
                Post(
                  snap: null,
                ),
                Post(
                  snap: null,
                )
              ],
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(children: [
                Expanded(
                  child: MyElevatedButton(
                      onPressed: () {},
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(style: TextStyle(fontSize: 20), "🌱"),
                            SizedBox(
                              width: 4,
                            ),
                            Text("Donate")
                          ])),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: MyElevatedButton(
                    gradient: const LinearGradient(colors: [
                      PawsomeTheme.gradientBlue,
                      PawsomeTheme.nearlyDarkBlue,
                    ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                    onPressed: () {},
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(style: TextStyle(fontSize: 20), "🎒"),
                          SizedBox(
                            width: 4,
                          ),
                          Text("Volunteer")
                        ]),
                  ),
                )
              ]),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget _buildPetCard(BuildContext context, String name, String imagePath) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                name,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
