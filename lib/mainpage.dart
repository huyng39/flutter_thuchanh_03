import 'package:flutter/material.dart';
import 'page/defaultwidget.dart';
import 'page/register.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({super.key});

  @override
  State<Mainpage> createState() => _mainPageState();
}

class _mainPageState extends State<Mainpage> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  _loadWidget(int index) {
    var nameWidgets = "Home";
    switch (index) {
      case 0:
        nameWidgets = "Home";
        break;
      case 1:
        nameWidgets = "Contact";
        break;
      case 2:
        nameWidgets = "Info";
        break;
      case 3:
        {
          return const Register();
        }
      default:
      nameWidgets = "None";
      break;
    }
    return DefaultWidget(title: nameWidgets);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("My app navigator"),
      ),
      drawer: Drawer(
        child: ListView(
          //Ko bỏ padding từ listview
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const[
                  CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage('https://qph.cf2.quoracdn.net/main-qimg-7fb4f710e8d9fd5e26ed30c6040cf0bd-lq'),
            ),
            SizedBox(
              height: 8,
            ),
            Text ('Ngô Nhật Huy',
            style: const TextStyle(color: Colors.white),
            ),
            Expanded(
              child:Text('20dh110616@st.huflit.edu.vn',
             style: const TextStyle(color: Colors.white),),
             )
            
            
          ],
              ),
           ),
           ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context);
              _selectedIndex = 0;
              setState(() {});
            },
           ),
           ListTile(
            leading: const Icon(Icons.mail),
            title: const Text('Contact'),
            onTap: () {
              Navigator.pop(context);
              _selectedIndex = 1;
              setState(() {});
            },
           ),
           ListTile(
            leading: const Icon(Icons.supervised_user_circle),
            title: const Text('Info'),
            onTap: () {
              Navigator.pop(context);
              _selectedIndex = 2;
              setState(() {});
            },
           ),
           ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Register'),
            onTap: () {
              Navigator.pop(context);
              _selectedIndex = 3;
              setState(() {});
            },
           ),
           const Divider(
            color: Colors.black,
           ),
           ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Logout'),
            onTap: () {
              Navigator.pop(context);
              _selectedIndex = 0;
              setState(() {});
            },
           ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_mail),
            label: 'Contact',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.supervised_user_circle),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Register',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
      body: _loadWidget(_selectedIndex),
    );
  }
}
