import 'package:flutter/material.dart';

void main()=> runApp(MaterialApp(
  theme: ThemeData(fontFamily: 'Inter'),
    home: messagePage(),
    ));
class messagePage extends StatefulWidget {
  const messagePage({super.key});

  @override
  State<messagePage> createState() => _messagePageState();
}

class _messagePageState extends State<messagePage> with SingleTickerProviderStateMixin {
  late TabController _controller;

  List<Map<String, dynamic>> chatList =[
    {
      'profile pic': 'assets/images/sweetgirl.jpg',
      'message': 'Exactly',
      'icon': false,
      'time': '18:51',
      'name': 'Jessica Williams'
    },
    {
      'profile pic': 'assets/images/cooperate.jpg',
      'message': 'Where have you been',
      'icon': true,
      'time': '18:51',
      'name': 'Micheal Alan'
    },
    {
      'profile pic': 'assets/images/summerbody.jpg',
      'message': 'will you be available tommorrow',
      'icon': false,
      'time': '18:51',
      'name': 'Sophie Ensley',
    },
    {
      'profile pic': 'assets/images/lovelygirl.jpg',
      'message': 'i saw you last night',
      'icon': false,
      'time': '18:51',
      'name': 'Clara Moore'
    },
    {
      'profile pic': 'assets/images/gymgirl.jpg',
      'message': 'Baby gir whatup with you?',
      'icon': true,
      'time': '18:51',
      'name': 'Maria'
    },
    {
      'profile pic': 'assets/images/whiteProfile.jpg',
      'message': 'Hey',
      'icon': true,
      'time': '18:51',
      'name': 'Sweet Perry'
    },
    {
      'profile pic': 'assets/images/beauty.jpg',
      'message': 'when are you coming?',
      'icon': false,
      'time': '8:00',
      'name': 'Sophie Wiiliams'
    },
    {
      'profile pic': 'assets/images/boy.jpg',
      'message': 'alright see you tomorrow',
      'icon': false,
      'time': '8:21',
      'name': 'Micheal Alan'
    },
    {
      'profile pic': 'assets/images/smiles.jpg',
      'message': 'Hey',
      'icon': true,
      'time': '18:51',
      'name': 'Sweet Perry'
    }

  ];

  @override
  void initState() {
    _controller =TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(backgroundColor: Color(0xFFFFFFFF),
        leading: IconButton(onPressed: (){},
            icon: Icon(Icons.more_horiz),
        ),
        title: Text('Chats',style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){},
              icon: Icon(Icons.add)
          )
        ],
      ),
      body: Padding(padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TabBar(controller: _controller,
                unselectedLabelColor: Color(0xFF898989),
                labelStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),
                tabs: [
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Tab(text: 'Online',),SizedBox(width: 5,), Icon(Icons.circle, color: Colors.green,size: 10,)
                    ],
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Tab(text: 'Offline',), SizedBox(width: 5,), Icon(Icons.circle,size: 10,color: Colors.grey,),
                    ],
                  )
                ]
            ),
            Expanded(
                child: TabBarView(controller: _controller,
                    children: [
                      Padding(padding: EdgeInsets.fromLTRB(0, 16, 16, 0),
                        child: Column(
                          children: [
                            Expanded(
                                child: ListView.builder(
                                    itemCount: chatList.length,
                                    itemBuilder: (context, index){
                                      final chats = chatList[index];
                                      return ListTile(contentPadding: EdgeInsets.zero,
                                        leading: CircleAvatar(radius: 30,
                                          backgroundImage: AssetImage(chats['profile pic']),
                                        ),
                                        title: Text(chats['name'],style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                                        subtitle: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                               if (chats['icon']) Icon(Icons.check, size: 17,),
                                                SizedBox(width: 5,) ,Text(chats['message'], style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: Color(0xFF898989)),)
                                              ],
                                            )
                                          ],
                                        )
                                      );
                                    }
                                )

                            )
                          ],
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(16),
                        child: Column(
                          children: [
                          ],
                        ),
                      )
                    ]
                ),
            )
          ],
        ),
      ),
    );
  }
}

