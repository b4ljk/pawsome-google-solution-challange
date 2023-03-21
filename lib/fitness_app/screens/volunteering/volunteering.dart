import 'package:pawsome/components/calendar/calendar_popup.dart';
import 'package:pawsome/components/my_elevated_button.dart';
import 'package:pawsome/fitness_app/ui_view/body_measurement.dart';
import 'package:pawsome/fitness_app/ui_view/glass_view.dart';
import 'package:pawsome/fitness_app/ui_view/mediterranean_diet_view.dart';
import 'package:pawsome/fitness_app/ui_view/title_view.dart';
import 'package:pawsome/fitness_app/fitness_app_theme.dart';
import 'package:pawsome/fitness_app/my_diary/meals_list_view.dart';
import 'package:pawsome/fitness_app/my_diary/water_view.dart';
import 'package:flutter/material.dart';

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

  @override
  void initState() {
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
      color: FitnessAppTheme.background,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Stack(
              children: <Widget>[
                getAppBarUI(),
                getMainListViewUI(),
                SizedBox(
                  height: MediaQuery.of(context).padding.bottom,
                ),
              ],
            ),
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
                              print(isLostPets);
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
                              print(isLostPets);
                            },
                          ),
                  ]),
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
                    color: FitnessAppTheme.white.withOpacity(topBarOpacity),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(32.0),
                    ),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: FitnessAppTheme.grey
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
                                  fontFamily: FitnessAppTheme.fontName,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 22 + 6 - 6 * topBarOpacity,
                                  letterSpacing: 1.2,
                                  color: FitnessAppTheme.darkerText,
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
