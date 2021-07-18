import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hackatagro/pages/details/detail.dart';

class CollectionPhotos extends StatefulWidget {
  const CollectionPhotos({Key? key}) : super(key: key);

  @override
  _CollectionPhotosState createState() => _CollectionPhotosState();
}

class _CollectionPhotosState extends State<CollectionPhotos> {
  Dio dio = Dio();
  var items = [
    {
      'id': '1',
      'title': 'Safra de Tomate',
      'description':
          'Cultura de tomates com boa localizacao no centro de Sao Paulo',
      'img':
          'https://images.unsplash.com/photo-1534940519139-f860fb3c6e38?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1047&q=80',
      'price': 'R\$ 2450,00'
    },
    {
      'id': '2',
      'title': 'Safra de Alface',
      'description':
          'Cultura de alface com boa localizacao no centro de Sao Paulo',
      'img':
          'https://images.unsplash.com/photo-1622206151226-18ca2c9ab4a1?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80',
      'price': 'R\$ 3450,00'
    },
    {
      'id': '3',
      'title': 'Safra de Morango',
      'description':
          'Cultura de morango com boa localizacao no centro de Sao Paulo',
      'img':
          'https://images.unsplash.com/photo-1519180392711-496e450edf6a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80',
      'price': 'R\$ 4450,00'
    },
    {
      'id': '4',
      'title': 'Safra de Uva',
      'description':
          'Cultura de uva com boa localizacao no centro de Sao Paulo',
      'img':
          'https://images.unsplash.com/photo-1537640538966-79f369143f8f?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1053&q=80',
      'price': 'R\$ 2450,00'
    },
    {
      'id': '5',
      'title': 'Safra de Alface',
      'description':
          'Cultura de alface com boa localizacao no centro de Sao Paulo',
      'img':
          'https://images.unsplash.com/photo-1622206151226-18ca2c9ab4a1?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80',
      'price': 'R\$ 3450,00'
    },
    {
      'id': '6',
      'title': 'Safra de Tomate',
      'description':
          'Cultura de tomates com boa localizacao no centro de Sao Paulo',
      'img':
          'https://images.unsplash.com/photo-1534940519139-f860fb3c6e38?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1047&q=80',
      'price': 'R\$ 2450,00'
    },
    {
      'id': '7',
      'title': 'Safra de Morango',
      'description':
          'Cultura de morango com boa localizacao no centro de Sao Paulo',
      'img':
          'https://images.unsplash.com/photo-1519180392711-496e450edf6a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80',
      'price': 'R\$ 4450,00'
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: StaggeredGridView.countBuilder(
              physics: ScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailPage(items[index])));
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.75,
                    width: MediaQuery.of(context).size.width * 0.50,
                    margin: EdgeInsets.all(8),
                    child: InkWell(
                      onTap: () async {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    DetailPage(items[index])));
                      },
                      child: Hero(
                        tag: items[index]["img"]!,
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(items[index]["img"]!),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
              staggeredTileBuilder: (int index) =>
                  StaggeredTile.count(2, index.isEven ? 3 : 1.5),
              shrinkWrap: true,
              itemCount: items.length,
              mainAxisSpacing: 1,
              crossAxisSpacing: 1,
              crossAxisCount: 4,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {}, child: Icon(Icons.shopping_cart_outlined)),
    );
  }
}
