

import 'package:carousel_slider/carousel_slider.dart';
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
  var _dropDownValue = '';
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
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child:DropdownButton(
                hint: _dropDownValue == null
                    ? Text('Dropdown')
                    : Text(
                  _dropDownValue,
                  style: TextStyle(color: Colors.pink),
                ),
                isExpanded: true,
                iconSize: 30.0,
                style: TextStyle(color: Colors.pink),
                items: ['Кб-45', 'Кб-46', 'Кб-47','Кб-48'].map(
                      (val) {
                    return DropdownMenuItem<String>(
                      value: val,
                      child: Text(val),
                    );
                  },
                ).toList(),
                onChanged: (val) {
                  setState(
                        () {
                      _dropDownValue = val!;

                    },
                  );
                },
              ),
            ),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(83, 13, 215, 1.0),
                        fixedSize: const Size(50, 20),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50))),
                  child: const Text('Login'),
                  onPressed: (){

                    if (nameController.text+surnameController.text == "NazarMaksymiv" || nameController.text+surnameController.text =="PetroPetrenko"){
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return NewRoute(surnameController.text,nameController.text,_dropDownValue);
                      })).then((value) => surnameController.clear()).then((value) => nameController.clear());}
                    else{
                      showDialog(context: context, builder:
                        (BuildContext context)=> AlertDialog(
                        title: const Text("Попередження"),
                        content: const Text("Такого користувача не уснує\nСпобуйте ввести  дані ще раз"),
                        actions: <Widget>[
                          TextButton(onPressed: ()=> Navigator.pop(context,'OK'),
                            child: const Text('OK'),)
                        ],
                        )
                      );
                    }
                  }
                )
            ),
          ],
        ));
  }
}

class NewRoute extends StatelessWidget {
  final String surname,name,val;
    const NewRoute(this.surname, this.name,this.val, {super.key});

  @override
  Widget build(BuildContext context) {

    var user = {};
    var shc = ['1 пара','2 пара','3 пара','4 пара','5 пара','6 пара'];
    var user1 = {
      'Понеділок'   : ['ТРІБ', 'БПЗ','-','БПЗ лаб.','-','-'],
      'Вівторок'  : ['-','-','-','Основи охорон праці', 'ТНПЗ лаб.','ТПЗ лаб.'],
      'Середа'    : ['ТНПЗ лек.','ТПЗ лек.','-','-','-','-'],
      'Четвер':['','','Основи охорон праці лаб.','Основи охорони праці пр.','-','-'],
      "П'ятниця":['-','АІБ лаб.','АІБ лаб.','-','-','-']
      };
    var user2 = {
      'Понеділок'   : ['-', '-','-','ТРІБ','БПЗ','-'],
      'Вівторок'  : ['-','-','-','Основи охорон праці', 'БПЗ лаб.','-'],
      'Середа'    : ['ТНПЗ лек.','ТПЗ лек.','-','ТНПЗ лаб.','ТПЗ лаб.','-'],
      'Четвер':['','','Основи охорон праці лаб.','Основи охорони праці пр.','-','-'],
      "П'ятниця":['-','-','-','-','-','-']
    };
    var user3 = {
      'Понеділок'   : ['-', '-','-','ТРІБ','БПЗ','Прикладна криптографія'],
      'Вівторок'  : ['-','-','-','Основи охорон праці', 'БПЗ лаб.','-'],
      'Середа'    : ['-','Основи охорон праці лек.','-','-','-','-'],
      'Четвер':['','','АШПЗ','ТРІБ лек.','-','-'],
      "П'ятниця":['-','Прикладна криптографія','-','ТРІБ','-','-']
    };
    var user4 = {
      'Понеділок'   : ['-','Прикладна криптографія','-','ТРІБ','-','-'],
      'Вівторок'  : ['-', '-','-','ТРІБ','БПЗ','Прикладна криптографія'],
      'Середа'    : ['-','-','-','Основи охорон праці', 'БПЗ лаб.','-'],
      'Четвер':['','','Основи охорон праці лаб.','Основи охорони праці пр.','-','-'],
      "П'ятниця":['-','-','-','-','-','-']
    };

    if(name+surname =="NazarMaksymiv" && val=="Кб-45" ){
      user!.clear();
      user.addAll(user1);
    }
    else if(name+surname =="NazarMaksymiv" && val=="Кб-46"){
      user!.clear();
      user.addAll(user2);
    }
    else if(name+surname =="PetroPetrenko" && val=="Кб-47"){
      user!.clear();
      user.addAll(user3);
    }
    else if(name+surname =="PetroPetrenko" && val=="Кб-48"){
      user!.clear();
      user.addAll(user4);
    }
    return Scaffold(

      backgroundColor: const Color.fromRGBO(46, 116, 196, 1.0),
      appBar: AppBar(

        title: const Text("Розклад занять"),
      ),

      body: ListView(


          children: [
            CarouselSlider(
              items: [

                ListView.builder(



                    padding: const EdgeInsets.all(8),
                    itemCount: shc.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(



                          padding: EdgeInsets.symmetric(vertical: 10),

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(shc[index], style: TextStyle(fontSize: 22)),
                              Text( user['Понеділок']![index], style: TextStyle(fontSize: 18))
                            ],
                          )
                      );
                    }
                ),


                ListView.builder(

                    padding: const EdgeInsets.all(8),
                    itemCount: shc.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(

                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(shc[index], style: TextStyle(fontSize: 22)),
                              Text( user['Вівторок']![index], style: TextStyle(fontSize: 18))
                            ],
                          )
                      );
                    }
                ),
                ListView.builder(

                    padding: const EdgeInsets.all(8),
                    itemCount: shc.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(

                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(shc[index], style: TextStyle(fontSize: 22)),
                              Text( user['Середа']![index], style: TextStyle(fontSize: 18))
                            ],
                          )
                      );
                    }
                ),
                ListView.builder(

                    padding: const EdgeInsets.all(8),
                    itemCount: shc.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(

                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(shc[index], style: TextStyle(fontSize: 22)),
                              Text( user['Четвер']![index], style: TextStyle(fontSize: 18))
                            ],
                          )
                      );
                    }
                ),
                ListView.builder(

                    padding: const EdgeInsets.all(8),
                    itemCount: shc.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(

                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(shc[index], style: TextStyle(fontSize: 22)),
                              Text( user["П'ятниця"]![index], style: TextStyle(fontSize: 18))
                            ],
                          )
                      );
                    }
                ),
                ListView.builder(

                    padding: const EdgeInsets.all(8),
                    itemCount: shc.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(

                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(shc[index], style: TextStyle(fontSize: 22)),
                              Text( user['Вівторок']![index], style: TextStyle(fontSize: 18))
                            ],
                          )
                      );
                    }
                ),

              ],
              options: CarouselOptions(

                height: 600,
                enlargeCenterPage: true,
                autoPlay: false,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
            ),
          ]
      ),
    );
  }
}



