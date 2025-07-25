import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize =>  Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: Text.rich(
          TextSpan(
            children: [
              TextSpan(text: 'E', style: TextStyle(fontSize: 30, color: Colors.red)),
              TextSpan(text: 'C', style: TextStyle(fontSize: 25, color: Colors.yellow)),
              TextSpan(text: 'O', style: TextStyle(fontSize: 30, color: Colors.green)),
              TextSpan(text: 'M', style: TextStyle(fontSize: 25, color:  Color.fromARGB(255, 243, 33, 236))),
              TextSpan(text: 'M', style: TextStyle(fontSize: 30, color: Colors.blue)),
              TextSpan(text: 'E', style: TextStyle(fontSize: 25, color: Colors.purple)),
              TextSpan(text: 'R', style: TextStyle(fontSize: 30, color: Colors.red)),
              TextSpan(text: 'C', style: TextStyle(fontSize: 25, color: Colors.yellow)),
              TextSpan(text: 'E', style: TextStyle(fontSize: 30, color: Colors.green)),
            ],
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 16, 78, 129),
       
        
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.settings),
             title: Text('Settings'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title:  Text('Settings')
            ),
          ],
        ),
      ),
    );
    
  }
}
