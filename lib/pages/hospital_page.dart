import 'package:ai_hack_web/pages/parse.dart';
import 'package:flutter/material.dart';
import 'package:appbar_dropdown/appbar_dropdown.dart';



class HospitalPage extends StatelessWidget {
  const HospitalPage({super.key});

  // static const String id = "hospitalpage";
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
         flexibleSpace: AppbarDropdown(
                items: [ "General Mindoro Hospital"," University of Metro Manila", "University of the Philippines"],
                selected: "General Mindoro Hospital",
                title: ( (user) => user.toString() ),
                onClick: ( (user) => print(user) ),
       ),
      ),

      body: Container(
         
      ),
    );
  }
}
