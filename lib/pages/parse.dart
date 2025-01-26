import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> getPrediction() async {
  // Define the API endpoint
  final url = Uri.parse('http://127.0.0.1:5000/predict');

  // Input data for the model
  final inputData = {
    "Temperature": 42,
    "Humidity": 95,
    "Precipitation": 120,
    "Signal Strength": -100,
    "Packet Loss": 15
  };

  try {
    // Send POST request
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(inputData),
    );

    // Parse the response
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print("Prediction: ${data['prediction']}");
      print("Probability: ${data['probability']}");
    } else {
      print("Error: ${response.statusCode}");
    }
  } catch (e) {
    print("Exception: $e");
  }
}