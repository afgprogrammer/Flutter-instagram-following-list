
import 'package:day26/models/user.dart';
import 'package:flutter/material.dart';

class FollowingPage extends StatefulWidget {
  const FollowingPage({ Key? key }) : super(key: key);

  @override
  _FollowingPageState createState() => _FollowingPageState();
}

class _FollowingPageState extends State<FollowingPage> with TickerProviderStateMixin {
  List<User> _selectedUsers = [];

  List<User> _users = [
    User('Elliana Palacios', '@elliana', 'https://images.unsplash.com/photo-1504735217152-b768bcab5ebc?ixlib=rb-0.3.5&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&s=0ec8291c3fd2f774a365c8651210a18b', false),
    User('Kayley Dwyer', '@kayley', 'https://images.unsplash.com/photo-1503467913725-8484b65b0715?ixlib=rb-0.3.5&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&s=cf7f82093012c4789841f570933f88e3', false),
    User('Kathleen Mcdonough', '@kathleen', 'https://images.unsplash.com/photo-1507081323647-4d250478b919?ixlib=rb-0.3.5&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&s=b717a6d0469694bbe6400e6bfe45a1da', false),
    User('Kathleen Dyer', '@kathleen', 'https://images.unsplash.com/photo-1502980426475-b83966705988?ixlib=rb-0.3.5&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&s=ddcb7ec744fc63472f2d9e19362aa387', false),
    User('Mikayla Marquez', '@mikayla', 'https://images.unsplash.com/photo-1541710430735-5fca14c95b00?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&ixid=eyJhcHBfaWQiOjE3Nzg0fQ', false)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text('Following', style: TextStyle(color: Colors.black),),
      ),
      body: Container(
        padding: EdgeInsets.only(right: 20, left: 20),
        color: Colors.white,
        height: double.infinity,
        width: double.infinity,
        child: ListView.builder(
          itemCount: _users.length,
          itemBuilder: (context, index) {
            return userComponent(user: _users[index]);
          },
        )
      ),
    );
  }

  userComponent({required User user}) {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 60,
                height: 60,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(user.image),
                )
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(user.name, style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500)),
                  SizedBox(height: 5,),
                  Text(user.username, style: TextStyle(color: Colors.grey[600])),
                ]
              )
            ]
          ),
          Container(
            height: 40,
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xffeeeeee)),
              borderRadius: BorderRadius.circular(50),
            ),
            child: MaterialButton(
              elevation: 0,
              color: user.isFollowedByMe ? Color(0xffeeeeee) : Color(0xffffff),
              onPressed: () {
                setState(() {
                  user.isFollowedByMe = !user.isFollowedByMe;
                });
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              child: Text(user.isFollowedByMe ? 'Unfollow' : 'Follow', style: TextStyle(color: Colors.black)),
            )
          )
        ],
      ),
    );
  }
}
