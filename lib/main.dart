// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.red,
//         dialogBackgroundColor: Colors.redAccent ,
//         fontFamily: 'Robotot'
//       ),
//       home: MyHomePage(),import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.red,
//         dialogBackgroundColor: Colors.redAccent ,
//         fontFamily: 'Robotot'
//       ),
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatelessWidget {
//   const MyHomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.purpleAccent,
//       appBar: AppBar(
//         backgroundColor: Colors.yellowAccent,
//         title: Text("Flutter Demo"),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             MyButton(),
//             const SizedBox(height: 20),
//             const Icon(
//               Icons.food_bank_outlined,
//               color: Colors.yellow,
//               size: 100.0,
//             ),
//             const SizedBox(height: 20,),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class MyButton extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {

//     return ElevatedButton(
//       style: ElevatedButton.styleFrom(
//         padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
//         textStyle: TextStyle(
//           fontSize: 20,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//       onPressed: (){
//         print('Thank you for clicking!');
//       },
//       child: Text('Click Me'),
//     );
//   }
// }
//     );
//   }
// }

// class MyHomePage extends StatelessWidget {
//   const MyHomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.purpleAccent,
//       appBar: AppBar(
//         backgroundColor: Colors.yellowAccent,
//         title: Text("Flutter Demo"),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             MyButton(),
//             const SizedBox(height: 20),
//             const Icon(
//               Icons.food_bank_outlined,
//               color: Colors.yellow,
//               size: 100.0,
//             ),
//             const SizedBox(height: 20,),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class MyButton extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {

//     return ElevatedButton(
//       style: ElevatedButton.styleFrom(
//         padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
//         textStyle: TextStyle(
//           fontSize: 20,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//       onPressed: (){
//         print('Thank you for clicking!');
//       },
//       child: Text('Click Me'),
//     );
//   }
// }

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dynamic UI with List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ItemListScreen(),
    );
  }
}

class ItemListScreen extends StatefulWidget {
  @override
  _ItemListScreenState createState() => _ItemListScreenState();
}

class _ItemListScreenState extends State<ItemListScreen> {
  List<String> items = [
    'moon',
    'star',
    'you',
    'love',
    'gege',
    'coco',
    'error',
    'run',
    'i',
    'selpon'
  ];

  List<bool> addedItems = List.filled(10, false);

  void showDetails(String item) {
    print('Details of $item');
  }

  void addItem(int index) {
    setState(() {
      addedItems[index] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Item List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: addedItems[index] ? Colors.green[100] : Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              items[index],
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              showDetails(items[index]);
                            },
                            child: Text('Details'),
                          ),
                          SizedBox(width: 8),
                          ElevatedButton(
                            onPressed: addedItems[index]
                                ? null
                                : () {
                                    addItem(index);
                                  },
                            child: Text(
                              addedItems[index] ? 'Added' : 'Add',
                            ),
                            style: ElevatedButton.styleFrom(
                              iconColor: addedItems[index]
                                  ? Colors.green
                                  : Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
