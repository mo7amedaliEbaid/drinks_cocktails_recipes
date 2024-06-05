import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'payment_details_screen.dart';

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final TextEditingController _amountController = TextEditingController();
  bool _isLoading = false;

  Future<void> _createOrder(String amount) async {
    setState(() {
      _isLoading = true;
    });

    final url = Uri.parse('https://secure.telr.com/gateway/order.json');
    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
  //    'Authorization': 'Basic MTY3NDY6MTc0MjFlMjlNJCNIRlJ0I1hOZEczUDc1',
    };
    final body = json.encode({
      "method": "create",
      "store": 26170,
      "authkey": "4S78X-xLw3t^bVH7",
      "framed": 0,
      "order": {
        "cartid": "1234",
        "test": "1",
        "amount": amount,
        "currency": "SAR",
        "description": "My purchase"
      },
      "return": {
        "authorised": "https://www.mysite.com/authorised",
        "declined": "https://www.mysite.com/declined",
        "cancelled": "https://www.mysite.com/cancelled"
      }
    });

    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      final orderRef = responseData['order']['ref'];
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PaymentDetailsScreen(orderRef: orderRef),
        ),
      );
    } else {
      // Handle error
      print('Error: ${response.statusCode}');
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Enter amount'),
            ),
            SizedBox(height: 20),
            _isLoading
                ? CircularProgressIndicator()
                : ElevatedButton(
              onPressed: () {
                if (_amountController.text.isNotEmpty) {
                  _createOrder(_amountController.text);
                }
              },
              child: Text('Pay Now'),
            ),
          ],
        ),
      ),
    );
  }
}
