import 'package:flutter/material.dart';
import 'package:flutter_formation/model/course.dart';
import 'package:flutter_formation/pages/infos_page.dart';

final cours = List<Course>.generate(
  10,
  (i) => Course(
    name: "Course $i",
    description:
        "Le lorem ipsum est, en imprimerie, une suite de mots sans signification utilisée à titre provisoire pour calibrer une mise en page, le texte définitif venant remplacer le faux-texte dès qu'il est prêt ou que la mise en page est achevée. Généralement, on utilise un texte en faux latin, le Lorem ipsum ou Lipsumn $i",
    image: "assets/images/image_list_page.jpeg",
    price: "29,9€",
    note: "$i",
  ),
);

class ListPage extends StatefulWidget {
  ListPage({Key? key}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Liste des formations"),
        centerTitle: true,
      ),
      body: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            Course crs = Course(
              name: cours[index].name,
              description: cours[index].description,
              image: cours[index].image,
              price: cours[index].price,
              note: cours[index].note,
            );
            return Container(
              height: 70,
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => InfoPage(course: crs),
                    ),
                  );
                },
                leading: Image.asset(crs.image ?? "/"),
                title: Text(crs.name ?? ""),
                subtitle: Row(
                  children: [
                    Text("${crs.price ?? ''} - ${crs.note ?? ''}"),
                    Icon(
                      Icons.star,
                      size: 18.0,
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) => Divider(),
          itemCount: cours.length),
    );
  }
}
