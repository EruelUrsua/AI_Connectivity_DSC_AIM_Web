import 'package:ai_hack_web/pages/parse.dart';
import 'package:flutter/material.dart';
import 'package:appbar_dropdown/appbar_dropdown.dart';


class HospitalPage extends StatefulWidget {
  const HospitalPage({super.key});

  @override
  State<HospitalPage> createState() => _HospitalPageState();
  
}

class _HospitalPageState extends State<HospitalPage> {
  // static const String id = "hospitalpage";
  @override
  Widget build(BuildContext context) {
    String? prediction;
List<dynamic>? probability;


Map<String, dynamic> simulatedInput = {
    "Temperature": 42.0,
    "Humidity": 95.0,
    "Precipitation": 120.0,
    "Signal Strength": -100.0,
    "Packet Loss": 15.0
  };
    Future<void> fetchPrediction() async {
    try {
      final result = await getPrediction(simulatedInput);
      setState(() {
        prediction = result['prediction'].toString();
        probability = result['probability'];
      });
    } catch (e) {
      setState(() {
        prediction = "Error: $e";
      });
    }
  }
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
        
     //   child: getPrediction(),
  
      
      ),
    );
  }

}


