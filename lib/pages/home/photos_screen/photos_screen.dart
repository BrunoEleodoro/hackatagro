import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class LatestPhotos extends StatefulWidget {
  @override
  _LatestPhotosState createState() => _LatestPhotosState();
}

class _LatestPhotosState extends State<LatestPhotos>
    with AutomaticKeepAliveClientMixin<LatestPhotos> {
  @override
  bool get wantKeepAlive => true;

  Dio dio = Dio();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var snapshot = [
      {
        'imageCreator': 'Lucas@email.com',
        'creatorUsername': 'Lucas',
        'imageCreatedAt': '2021-04-02 11:00',
        'imageLink':
            'https://images.unsplash.com/photo-1581177094826-3b9a100bf887?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80',
        'userImage': 'https://i.pravatar.cc/300'
      },
      {
        'imageCreator': 'Lucas@email.com',
        'creatorUsername': 'Lucas',
        'imageCreatedAt': '2021-04-02 11:00',
        'imageLink':
            'https://images.unsplash.com/photo-1598512752271-33f913a5af13?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80',
        'userImage': 'https://i.pravatar.cc/300'
      }
    ];
    super.build(context);
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: snapshot.length,
        itemBuilder: (BuildContext context, int index) {
          var imageCreator = snapshot[index]["imageCreator"];
          var creatorUsername = snapshot[index]["creatorUsername"];
          var imageCreatedAt =
              snapshot[index]["imageCreatedAt"].toString().split(' ')[0];
          String imageLink = snapshot[index]["imageLink"]!;
          String userImage = snapshot[index]["userImage"]!;

          return Padding(
            padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
            child: Card(
              elevation: 3,
              clipBehavior: Clip.antiAlias,
              child: Ink(
                color: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      child: InkWell(
                        onTap: () async {},
                        child: CachedNetworkImage(
                          placeholder: (context, url) =>
                              Center(child: CircularProgressIndicator()),
                          imageUrl: imageLink,
                          height: MediaQuery.of(context).size.height * 0.25,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(userImage),
                          radius: 25,
                          backgroundColor: Colors.transparent,
                        ),
                        title: Text(
                          '$imageCreator (@$creatorUsername)',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Padding(
                          padding: EdgeInsets.only(top: 5),
                          child: Text(
                            'Uploaded on $imageCreatedAt',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
