

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return const MaterialApp(

      home: Scaffold(
        backgroundColor: Color.fromRGBO(46, 116, 196, 1.0),
        body: MyStatefulWidget(),

      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Center(
              child: Container(
                height: 200,
                width: 400,
                alignment: Alignment.center,
                child: const Text(
                  "Login to system",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                  ),
                  // textAlign: TextAlign.center,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                style: const TextStyle(
                    fontSize: 17,
                    color: Colors.white
                ),
                controller: nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(),
                    borderRadius: BorderRadius.circular(30)
                  ),
                  labelText: "Name",
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                ),
                controller: surnameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(

                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(50)
                  ),
                  labelText: 'Surname',
                ),
              ),
            ),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(83, 13, 215, 1.0),
                        fixedSize: const Size(50, 20),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50))),
                  child: const Text('Login'),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return NewRoute(surnameController.text,nameController.text);
                    }));
                  }
                )
            ),
          ],
        ));
  }
}

class NewRoute extends StatelessWidget {
  final String password,name;
    const NewRoute(this.password, this.name, {super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(46, 116, 196, 1.0),
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: Center(
        child: Text('Welcome back\n$name $password',
        style: const TextStyle(color: Colors.white,fontSize: 27),)
      ),
    );
  }
}
