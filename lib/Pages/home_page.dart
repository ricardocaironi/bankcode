import 'dart:convert';
import 'package:appcompass/Pages/details_page.dart';
import 'package:appcompass/Pages/login_page.dart';
import 'package:appcompass/services/fire_auth_service.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../model/userdata.dart';
import 'package:http/http.dart' as http;
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';


class HomePage extends StatefulWidget {
  const HomePage(this.user, {Key? key}) : super(key: key);

  final UserData user;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List> takeApi() async {
    var url = Uri.parse('https://brasilapi.com.br/api/banks/v1');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return jsonDecode(utf8.decode(response.bodyBytes));
    } else {
      throw Exception('Erro ao carregar dados do servidor');
    }
  }

  @override
  Widget build(BuildContext context) {
    void _signOut() async {
      await FireAuthService(context).signOut();
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
          ((route) => false));
    }

    // ignore: prefer_const_constructors
    return Scaffold(
      appBar: NewGradientAppBar(
        title: Text(
          'Banks',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        gradient: LinearGradient(
            colors: [Color.fromARGB(255, 109, 187, 144), Colors.blueGrey]),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.all(6)),
              FutureBuilder<List>(
                  future: takeApi(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text('Erro ao carregar taxas'),
                      );
                    }
                    if (snapshot.hasData) {
                      return ListView.separated(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            var bancos = snapshot.data![index];
                            return ListTile(
                                tileColor: Color.fromARGB(255, 108, 184, 168),
                                trailing: Icon(Icons.arrow_forward),
                                leading: Icon(Icons.account_balance),
                                title: Text(
                                    snapshot.data![index]['name'].toString()),
                                onTap: () {
                                  Navigator.of(context).push(
                                      PageTransition(
                                        type: PageTransitionType.rightToLeft,
                                          child:
                                              DetailsPage(bancos: bancos)));
                                });
                          },
                          separatorBuilder: (_, __) => Divider());
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }),
            ],
          ),
        ),
      ),
      drawer: Drawer(
        backgroundColor: Color.fromARGB(255, 145, 219, 203),
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('Ricardo'),
              accountEmail: Text('rcaironi@gmail.com'),
              currentAccountPicture: Image.asset('assets/img/bankcode.png'),
            ),
            ListTile(
              title: Text('Logout'),
              trailing: Icon(Icons.exit_to_app),
              onTap: _signOut,
            ),
            ListTile(
              title: Text('Search'),
              trailing: Icon(Icons.search),
              onLongPress: () {},
            ),
          ],
        ),
      ),
    );
  }
}
