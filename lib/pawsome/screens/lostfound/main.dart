import 'package:pawsome/components/calendar/calendar_popup.dart';
import 'package:pawsome/pawsome/animalShelters/main.dart';
import 'package:pawsome/pawsome/screens/lostfound/animalcard.dart';
import 'package:pawsome/pawsome/theming.dart';
import 'package:flutter/material.dart';
import 'package:pawsome/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Volunteering extends StatefulWidget {
  const Volunteering({Key? key, this.animationController}) : super(key: key);

  final AnimationController? animationController;
  @override
  _VolunteeringState createState() => _VolunteeringState();
}

class _VolunteeringState extends State<Volunteering>
    with TickerProviderStateMixin {
  Animation<double>? topBarAnimation;

  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now().add(const Duration(days: 5));

  List<Widget> listViews = <Widget>[];
  final ScrollController scrollController = ScrollController();
  double topBarOpacity = 0.0;
  bool isLostPets = false;
  List<LostAnimal> lostAnimals = [
    LostAnimal(
        name: "Georgy",
        lostLocation: "Darkhan",
        phone: "99696969",
        picture:
            "https://scontent.fuln8-1.fna.fbcdn.net/v/t39.30808-6/336273520_196456646410655_7104023378553306563_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=Khv4FcQzu5sAX_fQvhr&_nc_ht=scontent.fuln8-1.fna&oh=00_AfA_hxdIKbl0BPt5evGwrBwT6n5q3wGq75Lp0e2HRk-Nog&oe=6425DF7C",
        lostDate: "1999/22/12",
        isLost: true,
        description: "My man tried to run home")
  ];
  List<LostAnimal> foundanimal = [
    LostAnimal(
        description:
            "When she was lost she was having a collar and a leash, her right arm is slightly hurt and she is probably dying cold out there anyone seen?",
        name: "name",
        lostDate: "2023/12/23",
        phone: "99199119",
        lostLocation: "Ulaanbaatar",
        isLost: false,
        picture:
            "https://scontent.fuln8-1.fna.fbcdn.net/v/t39.30808-6/335418226_1492717761132623_6255492581044566377_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=jxdYhdy85VcAX8MFUO8&_nc_ht=scontent.fuln8-1.fna&oh=00_AfBOjgjXVKEOJRPHnZY-Gx1_u7Rup2FmJ92_YhBbuEULLg&oe=64264604")
  ];

  getAnimalsData() {
    return isLostPets ? lostAnimals : foundanimal;
  }

  @override
  void initState() {
    CollectionReference users =
        FirebaseFirestore.instance.collection('shelters');
    // print(users);
    topBarAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: widget.animationController!,
            curve: Interval(0, 0.5, curve: Curves.fastOutSlowIn)));
    addAllListData();

    scrollController.addListener(() {
      if (scrollController.offset >= 24) {
        if (topBarOpacity != 1.0) {
          setState(() {
            topBarOpacity = 1.0;
          });
        }
      } else if (scrollController.offset <= 24 &&
          scrollController.offset >= 0) {
        if (topBarOpacity != scrollController.offset / 24) {
          setState(() {
            topBarOpacity = scrollController.offset / 24;
          });
        }
      } else if (scrollController.offset <= 0) {
        if (topBarOpacity != 0.0) {
          setState(() {
            topBarOpacity = 0.0;
          });
        }
      }
    });
    super.initState();
  }

  void addAllListData() {
    listViews.add(Container());
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

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: PawsomeTheme.background,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: <Widget>[
            getAppBarUI(),
            getMainListViewUI(),
            SizedBox(
              height: MediaQuery.of(context).padding.bottom,
            ),
            Padding(
              padding: EdgeInsets.only(top: AppBar().preferredSize.height),
              child: SafeArea(
                  child: Column(
                children: [
                  Container(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          !isLostPets
                              ? EnabledButton(text: "Found pets")
                              : DisabledButton(
                                  text: "Found pets",
                                  onPressed: () {
                                    setState(() {
                                      isLostPets = !isLostPets;
                                    });
                                  },
                                ),
                          SizedBox(width: 12),
                          isLostPets
                              ? EnabledButton(text: "Lost pets")
                              : DisabledButton(
                                  text: "Lost pets",
                                  onPressed: () {
                                    setState(() {
                                      isLostPets = !isLostPets;
                                    });
                                  },
                                ),
                        ]),
                  ),
                  Expanded(
                      child: GetFirestoreData(
                          collection: 'lostfound', isLost: isLostPets))
                ],
              )),
            )
          ],
        ),
      ),
    );
  }

  Widget getMainListViewUI() {
    return FutureBuilder<bool>(
      future: getData(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (!snapshot.hasData) {
          return const SizedBox();
        } else {
          return ListView.builder(
            controller: scrollController,
            padding: EdgeInsets.only(top: AppBar().preferredSize.height),
            itemCount: listViews.length,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              widget.animationController?.forward();
              return listViews[index];
            },
          );
        }
      },
    );
  }

  Widget getAppBarUI() {
    return Column(
      children: <Widget>[
        AnimatedBuilder(
          animation: widget.animationController!,
          builder: (BuildContext context, Widget? child) {
            return FadeTransition(
              opacity: topBarAnimation!,
              child: Transform(
                transform: Matrix4.translationValues(
                    0.0, 30 * (1.0 - topBarAnimation!.value), 0.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: PawsomeTheme.white.withOpacity(topBarOpacity),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(32.0),
                    ),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: PawsomeTheme.grey
                              .withOpacity(0.4 * topBarOpacity),
                          offset: const Offset(1.1, 1.1),
                          blurRadius: 10.0),
                    ],
                  ),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: MediaQuery.of(context).padding.top,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 16,
                            right: 16,
                            top: 16 - 8.0 * topBarOpacity,
                            bottom: 12 - 8.0 * topBarOpacity),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Center(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Lost and Found',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontFamily: PawsomeTheme.fontName,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 22 + 6 - 6 * topBarOpacity,
                                  letterSpacing: 1.2,
                                  color: PawsomeTheme.darkerText,
                                ),
                              ),
                            )),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        )
      ],
    );
  }
}

class EnabledButton extends StatelessWidget {
  const EnabledButton({
    super.key,
    required this.text,
  });
  final text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(text),
      style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(HexColor("#6A88E5")),
          padding: MaterialStateProperty.all<EdgeInsets>(
              EdgeInsets.symmetric(horizontal: 50))),
    );
  }
}

class DisabledButton extends StatelessWidget {
  const DisabledButton(
      {super.key, required this.text, required this.onPressed});
  final text;
  final onPressed;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsets>(
                EdgeInsets.symmetric(horizontal: 50))),
        onPressed: () {
          onPressed();
        },
        child: Text(
          text,
          style: TextStyle(color: Colors.black26),
        ));
  }
}
