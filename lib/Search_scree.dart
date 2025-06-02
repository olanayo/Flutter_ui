import 'package:flutter/material.dart';

void main()=> runApp(MaterialApp(
  theme: ThemeData(
    fontFamily: 'OpenSans'
  ),
  home: searchPage(),
));

class searchPage extends StatefulWidget {
  const searchPage({super.key});

  @override
  State<searchPage> createState() => _searchPageState();
}

class _searchPageState extends State<searchPage> {
  List<Map<String, dynamic>> friendsList =[
    {
      'name': "Kelvin Weeks",
      'avatar': "https://randomuser.me/api/portraits/men/32.jpg",
      'username': '@kellymillions',
      'action': 'Add Friend',
      'requested': 'Requested'
    },

    {
      'name': "Amanda Cochran",
      'avatar': "https://randomuser.me/api/portraits/women/44.jpg",
      'username': '@Miamanda',
      'action': 'Add Friend',
      'requested': 'Requested'
    },
    {
      'name': "James Alan",
      'avatar': "https://images.unsplash.com/photo-1603415526960-f7e0328c63b1",
      'username': '@jammyScrappy',
      'action': 'Add Friend',
      'requested': 'Requested'
    },
    {
      'name': "Sophie Ensley",
      'avatar': "https://images.unsplash.com/photo-1527980965255-d3b416303d12",
      'username': '@simplysophie',
      'action': 'Add Friend',
      'requested': 'Requested'
    },
    {
      'name': "Mike Brown",
      'avatar': "https://images.unsplash.com/photo-1535713875002-d1d0cf377fde",
      'username': '@1mikebrown',
      'action': 'Add Friend',
      'requested': 'Requested',
    },
    {
      'name': "Micheal Hart",
      'avatar': 'https://xsgames.co/randomusers/assets/avatars/male/18.jpg',
      'username': '@hatmikky',
      'action': 'Add Friend',
      'requested': 'Requested',
    },
    {
      'name': "Maria Crystal",
      'avatar': 'https://xsgames.co/randomusers/assets/avatars/female/25.jpg',
      'username': '@1mikebrown',
      'action': 'Add Friend',
      'requested': 'Requested'
    },
    {
      'name': "Hailey Chris",
      'avatar': 'https://xsgames.co/randomusers/assets/avatars/female/44.jpg',
      'username': '@1haleycheche',
      'action': 'Add Friend',
      'requested': 'Requested'
    },
    {
      'name': "Joe Christopher",
      'avatar': 'https://xsgames.co/randomusers/assets/avatars/male/36.jpg',
      'username': '@superjoe',
      'action': 'Add Friend',
      'requested': 'Requested'
    },
    {
      'name': "Daniel Antony",
      'avatar': 'https://i.pravatar.cc/150?img=4',
      'username': '@antony25',
      'action': 'Add Friend',
    'requested': 'Requested'
    }
  ];
  List<bool> isAdded = List.filled(10, false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Color(0xFFFFFFFF),
      body: SafeArea(
          child: Padding(
              padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Search for people',
                    hintStyle: TextStyle(fontStyle: FontStyle.italic),
                    contentPadding: EdgeInsets.symmetric(vertical: 6, horizontal: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    )
                  ),
                ),
                SizedBox(height: 10,),
                Expanded(
                    child: ListView.builder(
                    itemCount: friendsList.length,
                    itemBuilder: (context, index) {
                      final friends = friendsList [index];
                      return ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: CircleAvatar(radius: 30,
                          backgroundImage: NetworkImage(friends['avatar']),
                        ),
                        title: Text(friends['name'],style: TextStyle(fontWeight: FontWeight.w600),),
                        subtitle: Text(friends['username']),
                        trailing: TextButton(onPressed: (){
                          setState(() {
                            isAdded[index] = !isAdded[index];
                          });
                        },
                            child: Text(friends[isAdded[index]? 'requested':'action'],style: TextStyle(fontWeight: FontWeight.bold,color: isAdded[index]? Color(0xFF898989) : Colors.white,),) ,
                          style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            minimumSize: Size(110, 40),
                            backgroundColor: isAdded[index]? Color(0xFFD4D4D4) : Colors.blueAccent,
                          ),
                        )
                      );
                    }
                ),
                )
              ],
            ),
          )
      ),
    );
  }
}
