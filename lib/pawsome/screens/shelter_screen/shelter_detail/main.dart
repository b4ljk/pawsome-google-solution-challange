import 'package:flutter/material.dart';
import 'package:pawsome/components/calendar/calendar_popup.dart';
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
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now().add(const Duration(days: 5));
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
                    "UB shelter",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                "UB shelter is one of the biggest animal caring center in Mongolia.",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                "UB Shelter is a state-of-the-art animal shelter that is dedicated to providing high-quality care and support to animals in need. Our facility is spacious and modern, featuring a variety of enclosures and amenities designed to meet the needs of all types of animals."
                "At UB Shelter, we are committed to ensuring the health and well-being of every animal under our care. Our staff is highly trained and experienced in animal care, and we take a compassionate and personalized approach to each animal's needs. Whether an animal needs medical attention, behavioral support, or simply a safe and comfortable place to stay, we work tirelessly to ensure they receive the care and attention they deserve.",
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
            Post(
              snap: null,
            ),
            SafeArea(
              child: Padding(
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
                      onPressed: () {
                        showDemoDialog(context: context);
                      },
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
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  void showDemoDialog({BuildContext? context}) {
    showDialog<dynamic>(
      context: context!,
      builder: (BuildContext context) => CalendarPopupView(
        barrierDismissible: true,
        minimumDate: DateTime.now(),
        //  maximumDate: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 10),
        initialEndDate: endDate,
        initialStartDate: startDate,
        onApplyClick: (DateTime startData, DateTime endData) {
          setState(() {
            startDate = startData;
            endDate = endData;
          });
          print([startData, endData]);
        },
        onCancelClick: () {},
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
