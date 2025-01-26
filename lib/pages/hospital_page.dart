import 'package:ai_hack_web/const/constant.dart';
import 'package:ai_hack_web/pages/parse.dart';
import 'package:flutter/material.dart';

class HospitalPage extends StatefulWidget {
  @override
  _HospitalPageState createState() => _HospitalPageState();
}

class _HospitalPageState extends State<HospitalPage> {
 
  String? prediction;
  //List<dynamic>? probability;

 
  Map<String, dynamic> simulatedInput = {
    "Temperature": 42.0,
    "Humidity": 95.0,
    "Precipitation": 120.0,
    "Signal Strength": -100.0,
    "Packet Loss": 15,
    "Latency": 5
  };

  Future<void> fetchPrediction() async {
    try {
      // Call the function with simulated input
      final result = await getPrediction(simulatedInput);
      setState(() {
        prediction = result['prediction'].toString();
       // probability = result['probability'];
      });
    } catch (e) {
      setState(() {
        prediction = "Error: $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Outage Prediction'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Simulated Input Data:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Text("Temperature: ${simulatedInput['Temperature']}°C"),
            Text("Humidity: ${simulatedInput['Humidity']}%"),
            Text("Precipitation: ${simulatedInput['Precipitation']} mm"),
            Text("Signal Strength: ${simulatedInput['Signal Strength']} dBm"),
            Text("Packet Loss: ${simulatedInput['Packet Loss']}%"),
             Text("Latency: ${simulatedInput['Latency']}ms"),
            SizedBox(height: 20),
            ElevatedButton(
              //style: ButtonStyle(backgroundColor: Colors.green),
              onPressed: fetchPrediction,
              child: Text('Get Prediction'),
              
            ),
            SizedBox(height: 20),
            if (prediction != null) Text("Prediction: $prediction", style: TextStyle(fontSize: 16)),
            // if (probability != null)
            //   Text("Probabilities: ${probability.toString()}", style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}