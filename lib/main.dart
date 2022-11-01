import 'package:flutter/material.dart';
import 'FirstPage.dart';
import 'Secondpage.dart';


void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> first_page_list = ['Computer Vision', 'Generative'];
  List<String> index_to_eng = ['First', 'Second', 'Third', 'Fourth'];

  ReflectionFun(index){
    var NextPage = "${index_to_eng[index]}" + "Page";
    if (NextPage=='FirstPage'){
      return FirstPage();
    }else if(NextPage=='SecondPage'){
      return SecondPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GridView.builder(
        itemCount: first_page_list.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, //1 개의 행에 보여줄 item 개수
        childAspectRatio: 1 / 1, //item 의 가로 1, 세로 2 의 비율
        mainAxisSpacing: 15, //수평 Padding
        crossAxisSpacing: 15, //수직 Padding
      ),
          itemBuilder: (BuildContext context, int index ){
        return InkWell(
          onTap: (){
            // print("${index_to_eng[index]}" + "Page");


            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ReflectionFun(index)),
            );
          },
          child: Container(
            margin: EdgeInsets.all(15),
            padding: EdgeInsets.all(15),
            color: Colors.green,
            child: Column(
              children: [
                Image.asset("assets/deeplearning_generative.gif")
                // Text(first_page_list[index])
              ],
            ),
          ),
        );
    }
    ));
  }
}



