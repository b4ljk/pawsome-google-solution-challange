import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:pawsome/pawsome/screens/shelter_screen/shelter_detail/main.dart';
import 'package:pawsome/pawsome/screens/shelter_screen/widget/shelter_component/main.dart';

class ShelterScreen extends StatefulWidget {
  const ShelterScreen({Key? key}) : super(key: key);

  @override
  _ShelterScreenState createState() => _ShelterScreenState();
}

class _ShelterScreenState extends State<ShelterScreen> {
  TextEditingController textController = TextEditingController();
  final List<Map<String, String>> shelters = [
    {
      'logo':
          'https://cdn.greensoft.mn/cache/images/b/6/c/5/a/b6c5a6a01360b10aab5565b2865b79522dcbbfa1.jpg',
      'name': 'Example Shelter 1',
      'location': 'New York, NY',
    },
    {
      'logo':
          'https://cdn.greensoft.mn/cache/images/b/6/c/5/a/b6c5a6a01360b10aab5565b2865b79522dcbbfa1.jpg',
      'name': 'Example Shelter 2',
      'location': 'Los Angeles, CA',
    },
    {
      'logo':
          'https://cdn.greensoft.mn/cache/images/b/6/c/5/a/b6c5a6a01360b10aab5565b2865b79522dcbbfa1.jpg',
      'name': 'Example Shelter 3',
      'location': 'Chicago, IL',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
              padding: const EdgeInsets.only(top: 4, right: 8, left: 50),
              child: AnimSearchBar(
                rtl: true,
                width: 400,
                textController: textController,
                onSuffixTap: () {
                  setState(() {
                    textController.clear();
                  });
                },
                onSubmitted: (String) {},
              )),
          Expanded(
            child: ListView.builder(
              itemCount: shelters.length,
              itemBuilder: (context, index) {
                return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 20.0),
                    child: InkWell(
                      onTap: () => {},
                      child: ShelterComponent(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ShelterDetailScreen()),
                          );
                        },
                        logo: shelters[index]['logo']!,
                        name: shelters[index]['name']!,
                        location: shelters[index]['location']!,
                      ),
                    ));
              },
            ),
          ),
        ],
      ),
    );
  }
}
