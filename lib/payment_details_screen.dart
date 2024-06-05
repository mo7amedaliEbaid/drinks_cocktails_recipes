import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PaymentDetailsScreen extends StatelessWidget {
  final String orderRef;

  PaymentDetailsScreen({required this.orderRef});

  Future<Map<String, dynamic>> _checkOrder() async {
    final url = Uri.parse('https://secure.telr.com/gateway/order.json');
    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Basic MTY3NDY6MTc0MjFlMjlNJCNIRlJ0I1hOZEczUDc1',
    };
    final body = json.encode({
      "method": "check",
      "store": 26170,
      "authkey": "4S78X-xLw3t^bVH7",
      "order": {
        "ref": orderRef
      }
    });

    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      // Handle error
 //     Exception('Error: ${response.statusCode}');
      throw Exception('Error: ${response.statusCode}');
      print('Error: ${response.statusCode}');
     // return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Details'),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: _checkOrder(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data == null) {
            return Center(child: Text('No data'));
          } else {
            final order = snapshot.data?['order'];
            final status = order['status'];

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Order Reference: ${order['ref']}'),
                  Text('Cart ID: ${order['cartid']}'),
                  Text('Amount: ${order['amount']} ${order['currency']}'),
                  Text('Description: ${order['description']}'),
                  Text('Status Code: ${status['code']}'),
                  Text('Status Text: ${status['text']}'),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
