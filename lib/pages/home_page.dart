import 'package:ai_hack_web/pages/hospital_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:appbar_dropdown/appbar_dropdown.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
       flexibleSpace: AppbarDropdown(
                items: [ "General Mindoro Hospital"," University of Metro Manila", "University of the Philippines"],
                selected: "Establishments",
                title: ( (user) => user.toString() ),
                onClick: ( (user) => print(user) ),
       ),
       
      ),
      sideBar: SideBar(
        items: [
          // AdminMenuItem(
          //   title: 'Room 1',
          //   route: '/',
          //   icon: Icons.dashboard,
          // ),
          AdminMenuItem(
            title: 'Hospital Rooms',
            icon: Icons.file_copy,
            children: [
               AdminMenuItem(
                title: 'Room 1',
                route: '/hospitalpage',
                
              ),
              const AdminMenuItem(
                title: 'Second Level Item 1',
                route: '/secondLevelItem1',
              ),
              const AdminMenuItem(
                title: 'Second Level Item 2',
                route: '/secondLevelItem2',
              ),
              const AdminMenuItem(
                title: 'Third Level',
                children: [
                  AdminMenuItem(
                    title: 'Third Level Item 1',
                    route: '/thirdLevelItem1',
                  ),
                  AdminMenuItem(
                    title: 'Third Level Item 2',
                    route: '/thirdLevelItem2',
                  ),
                ],
              ),
            ],
          ),
        ],
        selectedRoute: '/',
        onSelected: (item) {
          if (item.route != null) {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => HospitalPage()));
          }
        },
        header: Container(
          height: 50,
          width: double.infinity,
          color: const Color(0xff444444),
          child: const Center(
            child: Text(
              'Facilities',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        footer: Container(
          height: 50,
          width: double.infinity,
          color: const Color(0xff444444),
          child: const Center(
            child: Text(
              'footer',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.all(10),
          child: const Text(
            '',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 36,
            ),
          ),
        ),
      ),
    );
  }
}