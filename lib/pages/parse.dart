import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> getPrediction(Map<String, dynamic> inputData) async {
  
  final url = Uri.parse('http://127.0.0.1:5000/predict'); 

  try {
    // Send POST request with input data
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(inputData),
    );

    // Handle response
    if (response.statusCode == 200) {
      return jsonDecode(response.body); // Returns prediction and probability
    } else {
      throw Exception("Error: ${response.statusCode}");
    }
  } catch (e) {
    throw Exception("Failed to connect to the server: $e");
  }
}

// Just change the api in flutter to this one
// 127.0.0.1