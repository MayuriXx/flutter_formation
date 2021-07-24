import 'package:flutter/material.dart';
import 'package:flutter_formation/model/Cours.dart';

class InfoPage extends StatefulWidget {
  final Cours cours;

  InfoPage({Key? key, required this.cours}) : super(key: key);
  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  int selectedTab = 0;
  final List<String> avis = ["Super Cours", "Top", "Nul"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Détails du cours"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
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
      child: Image.asset(widget.cours.image ?? "/"),
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
                widget.cours.name ?? "no name",
                style: TextStyle(fontSize: 26),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                widget.cours.description ?? "no description",
                textAlign: TextAlign.justify,
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                      "${widget.cours.price ?? 'no price'} - ${widget.cours.note ?? 'no note'}"),
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
