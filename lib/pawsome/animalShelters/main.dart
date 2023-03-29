import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pawsome/components/shelter/shelter_card.dart';
import 'package:pawsome/pawsome/animalShelters/petdetail.dart';
import 'package:pawsome/pawsome/screens/shelter/feed.dart';
import 'package:pawsome/pawsome/ui_view/body_measurement.dart';
import 'package:pawsome/pawsome/ui_view/glass_view.dart';
import 'package:pawsome/pawsome/ui_view/mediterranean_diet_view.dart';
import 'package:pawsome/pawsome/ui_view/title_view.dart';
import 'package:pawsome/pawsome/theming.dart';
import 'package:pawsome/pawsome/animalShelters/meals_list_view.dart';
import 'package:pawsome/pawsome/animalShelters/water_view.dart';
import 'package:flutter/material.dart';

class MyDiaryScreen extends StatefulWidget {
  const MyDiaryScreen({Key? key, this.animationController}) : super(key: key);

  final AnimationController? animationController;
  @override
  _MyDiaryScreenState createState() => _MyDiaryScreenState();
}

class _MyDiaryScreenState extends State<MyDiaryScreen>
    with TickerProviderStateMixin {
  Animation<double>? topBarAnimation;

  List<Widget> listViews = <Widget>[];
  final ScrollController scrollController = ScrollController();
  double topBarOpacity = 0.0;

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
            getMainListViewUI(),
            getAppBarUI(),
            SizedBox(
              height: MediaQuery.of(context).padding.bottom,
            ),
            SafeArea(
                child: Padding(
              padding: EdgeInsets.only(
                  top: AppBar().preferredSize.height + 5, bottom: 35),
              child: GetData(
                collection: "pets",
              ),
            )),
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
            padding: EdgeInsets.only(
              top: AppBar().preferredSize.height +
                  MediaQuery.of(context).padding.top +
                  24,
              bottom: 62 + MediaQuery.of(context).padding.bottom,
            ),
            itemCount: listViews.length,
            scrollDirection: Axis.vertical,
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
                                'Animal shelters',
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

class GetData extends StatefulWidget {
  GetData({Key? key, required this.collection}) : super(key: key);

  final String collection;

  @override
  State<GetData> createState() => _GetDataState();
}

class _GetDataState extends State<GetData> {
  final ScrollController _scrollController = ScrollController();
  final int _batchSize = 10;
  List<DocumentSnapshot> _documents = [];
  bool _isLoading = false;
  bool _hasMoreData = true;

  @override
  void initState() {
    super.initState();
    _loadData();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (!_isLoading &&
        _hasMoreData &&
        _scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent) {
      _loadData();
    }
  }

  Future<void> _loadData() async {
    setState(() {
      _isLoading = true;
    });

    QuerySnapshot querySnapshot;
    if (_documents.isEmpty) {
      querySnapshot = await FirebaseFirestore.instance
          .collection(widget.collection)
          .orderBy('name')
          .limit(_batchSize)
          .get();
    } else {
      querySnapshot = await FirebaseFirestore.instance
          .collection(widget.collection)
          .orderBy('name')
          .startAfterDocument(_documents.last)
          .limit(_batchSize)
          .get();
    }

    if (querySnapshot.docs.length < _batchSize) {
      _hasMoreData = false;
    }

    setState(() {
      _isLoading = false;
      _documents.addAll(querySnapshot.docs);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      itemCount: _documents.length + (_hasMoreData ? 1 : 0),
      itemBuilder: (BuildContext context, int index) {
        if (index == _documents.length) {
          return Center(
              child: _isLoading ? CircularProgressIndicator() : SizedBox());
        }

        final document = _documents[index];
        return ShelterItem(
          document: document,
        );
      },
    );
  }
}

class Shelters {
  Shelters(
      {required this.location,
      required this.image,
      required this.name,
      required this.breed,
      required this.phone,
      required this.shelter_id});

  final String location;
  final String image;
  final String name;
  final String breed;
  final String shelter_id;
  final String phone;

  factory Shelters.fromJson(Map<String, dynamic> json) {
    return Shelters(
      location: json['location'],
      image: json['image'],
      name: json['name'],
      breed: json['breed'],
      shelter_id: json['shelter_id'],
      phone: json['phone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'location': location,
      'image': image,
      'name': name,
      'breed': breed,
      'shelter_id': shelter_id,
      'phone': phone,
    };
  }
}
