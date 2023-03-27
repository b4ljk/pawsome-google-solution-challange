import 'package:flutter/material.dart';
import 'package:pawsome/pawsome/screens/info_screen/post_list_screen/widget/blog_card/main.dart';

class PostListScreen extends StatefulWidget {
  const PostListScreen({Key? key}) : super(key: key);

  @override
  _PostListScreenState createState() => _PostListScreenState();
}

class _PostListScreenState extends State<PostListScreen> {
  final List<Map<String, dynamic>> _blogs = [
    {
      'title': 'How to cut your dogs ball off?',
      'summary': '',
      'date': 'March 23, 2023',
      'tags': ['Lorem', 'Ipsum', 'Dolor'],
      'image':
          'https://firebasestorage.googleapis.com/v0/b/pawsome-59b88.appspot.com/o/victor-grabarczyk-N04FIfHhv_k-unsplash.jpg?alt=media&token=9d7b80f8-b97a-451b-b1bc-ee1417f21e57',
    },
    {
      'title': 'Lorem Ipsum Dolor Sit Amet',
      'summary':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vitae suscipit justo. Nulla facilisi. Nam eget eleifend lectus. Nam efficitur velit nec mi luctus venenatis.',
      'date': 'March 23, 2023',
      'tags': ['Lorem', 'Ipsum', 'Dolor'],
      'image':
          'https://firebasestorage.googleapis.com/v0/b/pawsome-59b88.appspot.com/o/victor-grabarczyk-N04FIfHhv_k-unsplash.jpg?alt=media&token=9d7b80f8-b97a-451b-b1bc-ee1417f21e57',
    },
    {
      'title': 'Lorem Ipsum Dolor Sit Amet',
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
      body: ListView.builder(
        itemCount: _blogs.length,
        itemBuilder: (context, index) {
          return Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
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
    );
  }
}
