import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HospitalPage extends StatefulWidget {
  const HospitalPage({super.key});

  @override
  _HospitalPageState createState() => _HospitalPageState();
}

class _HospitalPageState extends State<HospitalPage> {

  final TextEditingController _temperatureController = TextEditingController();
  final TextEditingController _humidityController = TextEditingController();
  final TextEditingController _precipitationController = TextEditingController();
  final TextEditingController _signalStrengthController = TextEditingController();
  final TextEditingController _packetLossController = TextEditingController();
  final TextEditingController _latencyController = TextEditingController();

  String? prediction; 
  //List<dynamic>? probability; 

  Future<void> getPrediction() async {
    final url = Uri.parse('https://web-production-59db.up.railway.app/predict'); // Replace with your deployed backend URL

    Map<String, dynamic> inputData = {
      "Temperature": double.parse(_temperatureController.text),
      "Humidity": double.parse(_humidityController.text),
      "Precipitation": double.parse(_precipitationController.text),
      "Signal Strength": double.parse(_signalStrengthController.text),
      "Packet Loss": double.parse(_packetLossController.text),
      "Latency": double.parse(_latencyController.text),
    };

    try {
      // Send POST request
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(inputData),
      );

      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
        setState(() {
          prediction = result["Outage"] == 1 ? "Outage Likely" : "No Outage";
          // probability = result["Due to"]; // Causal features or probabilities
        });
      } else {
        setState(() {
          prediction = "Error: ${response.statusCode}";
        });
      }
    } catch (e) {
      setState(() {
        prediction = "Failed to connect to server.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hospital Outage Predictor'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Input Fields
            TextFormField(
              controller: _temperatureController,
              decoration: InputDecoration(labelText: "Temperature (°C)"),
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              controller: _humidityController,
              decoration: InputDecoration(labelText: "Humidity (%)"),
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              controller: _precipitationController,
              decoration: InputDecoration(labelText: "Precipitation (mm)"),
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              controller: _signalStrengthController,
              decoration: InputDecoration(labelText: "Signal Strength (dBm)"),
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              controller: _packetLossController,
              decoration: InputDecoration(labelText: "Packet Loss (%)"),
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              controller: _latencyController,
              decoration: InputDecoration(labelText: "Latency (ms)"),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),

            // Submit Button
            ElevatedButton(
              onPressed: getPrediction,
              child: Text('Get Prediction'),
            ),
            SizedBox(height: 20),

            if (prediction != null)
              Text("Prediction: $prediction", style: TextStyle(fontSize: 18)),

            // if (probability != null) ...[
            //   SizedBox(height: 20),
            //   Text("Top Causal Features:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            //   ...probability!.map((feature) {
            //     return Text(
            //       "${feature['Feature']}: ${feature['Importance']}%",
            //       style: TextStyle(fontSize: 16),
            //     );
            //   }).toList(),
            // ]
          ],
        ),
      ),
    );
  }
}
