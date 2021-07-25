import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_formation/pages/list_page.dart';

class LoginPage extends StatelessWidget {
  String mail = "";
  String mdp = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page de login"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              _buildHeader(context),
              SizedBox(
                height: 15,
              ),
              _buildTitle(),
              _buildForm(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      child: Image.asset(
        'assets/images/header_login_page.jpeg',
        // height: MediaQuery.of(context).size.height * 0.5,
        // width: MediaQuery.of(context).size.width * 3.5),
      ),
    );
  }

  Widget _buildTitle() {
    return Center(
      child: Text(
        "Connectez-vous !",
        style: TextStyle(fontSize: 28),
      ),
    );
  }

  Widget _buildForm(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: [
            Container(
              child: TextFormField(
                onChanged: (textMail) {
                  mail = textMail;
                  log(mail);
                },
                decoration: InputDecoration(
                  labelText: "Votre email...",
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              child: TextFormField(
                onChanged: (textMdp) {
                  mdp = textMdp;
                  log(mdp);
                },
                decoration: InputDecoration(
                  labelText: "Votre mdp...",
                ),
                obscureText: true,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: ElevatedButton(
                    onPressed: () {
                      log("TODO : MDP oublié");
                    },
                    child: Text("MDP Oublié ?"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.lightBlueAccent,
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Container(
                  child: ElevatedButton(
                    onPressed: () {
                      if (mail == "test" && mdp == "test") {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ListPage(),
                          ),
                        );
                      } else {
                        log("Erreur identification");
                      }
                    },
                    child: Text("Login"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blueAccent,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
