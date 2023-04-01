import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pawsome/components/appbar/main.dart';
import 'package:pawsome/pawsome/screens/info_screen/post_list_screen/widget/blog_card/main.dart';

class PostListScreen extends StatefulWidget {
  const PostListScreen({Key? key}) : super(key: key);

  @override
  _PostListScreenState createState() => _PostListScreenState();
}

class _PostListScreenState extends State<PostListScreen> {
  final List<Map<String, dynamic>> _blogs = [
    {
      'title': 'How to groom your dog ?',
      'summary':
          'Brush your dogs coat regularly, ideally daily if they have long hair. This helps to remove dirt and loose hair, prevent mats and tangles, and distribute natural oils throughout the coat. Use a brush or comb that is appropriate for your dogs hair type.,',
      'date': 'March 23, 2023',
      'tags': ['Grooming', 'Brushing', 'Hair'],
      'image':
          'https://bpanimalhospital.com/wp-content/uploads/shutterstock_1547371985.jpg',
    },
    {
      'title': 'The Benefits of Regular Exercise for Your Furry Friend',
      'summary':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vitae suscipit justo. Nulla facilisi. Nam eget eleifend lectus. Nam efficitur velit nec mi luctus venenatis.',
      'date': 'March 23, 2023',
      'tags': ['Lorem', 'Ipsum', 'Dolor'],
      'image':
          'https://i0.wp.com/twoplusdogs.co.uk/wp-content/uploads/2020/12/dog.jpg?fit=1000%2C664&ssl=1',
    },
    {
      'title': 'Traveling with Pets: Tips and Tricks for a Stress-Free Trip',
      'summary':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vitae suscipit justo. Nulla facilisi. Nam eget eleifend lectus. Nam efficitur velit nec mi luctus venenatis.',
      'date': 'March 23, 2023',
      'tags': ['Lorem', 'Ipsum', 'Dolor'],
      'image':
          'https://firebasestorage.googleapis.com/v0/b/pawsome-59b88.appspot.com/o/victor-grabarczyk-N04FIfHhv_k-unsplash.jpg?alt=media&token=9d7b80f8-b97a-451b-b1bc-ee1417f21e57',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar("Blogs", context),
      body: Column(
        children: [
          SafeArea(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _blogs.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: BlogCard(
                    title: _blogs[index]['title'],
                    summary: _blogs[index]['summary'],
                    date: _blogs[index]['date'],
                    tags: _blogs[index]['tags'],
                    image: _blogs[index]['image'],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
