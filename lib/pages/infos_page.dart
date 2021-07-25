import 'package:flutter/material.dart';
import 'package:flutter_formation/model/course.dart';

class InfoPage extends StatefulWidget {
  final Course course;

  InfoPage({Key? key, required this.course}) : super(key: key);
  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  int selectedTab = 0;
  final List<String> avis = ["Super Course", "Top", "Nul"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Détails du course"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: 1000,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildHeader(),
              SizedBox(
                height: 15,
              ),
              _buildInfos(),
              SizedBox(
                height: 15,
              ),
              _buildBtn(),
              Expanded(
                child: SizedBox(
                  height: 200,
                  child: _buildAvis(),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedTab,
        onTap: (int index) {
          setState(() {
            selectedTab = index;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.play_circle_fill_outlined), label: "Infos"),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Avis"),
        ],
      ),
    );
  }

  _buildHeader() {
    return Container(
      child: Image.asset(widget.course.image ?? "/"),
    );
  }

  _buildInfos() {
    if (selectedTab == 0) {
      return Container(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            children: [
              Text(
                widget.course.name ?? "no name",
                style: TextStyle(fontSize: 26),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                widget.course.description ?? "no description",
                textAlign: TextAlign.justify,
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                      "${widget.course.price ?? 'no price'} - ${widget.course.note ?? 'no note'}"),
                  Icon(
                    Icons.star,
                    size: 18.0,
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    } else {
      return Container(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            children: [
              Text(
                "Les avis : ",
                style: TextStyle(fontSize: 26),
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      );
    }
  }

  _buildBtn() {
    if (selectedTab == 0) {
      return Container(
        child: ElevatedButton.icon(
          onPressed: () {},
          icon: Icon(Icons.shopping_bag),
          label: Text(
            "Acheter".toUpperCase(),
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  _buildAvis() {
    if (selectedTab == 1) {
      return ListView.separated(
        shrinkWrap: true,
        itemCount: avis.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 50,
            // color: Colors.blueGrey[colors[index]],
            child: Center(
              child: Text(avis[index]),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => Divider(),
      );
    } else {
      return Container();
    }
  }
}
