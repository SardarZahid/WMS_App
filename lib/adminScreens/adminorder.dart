import 'package:flutter/material.dart';
import 'package:myapp/model/ordermodel.dart'; // Import the order model and global list

class AdminOrderScreen extends StatefulWidget {
  const AdminOrderScreen({super.key});

  @override
  _AdminOrderScreenState createState() => _AdminOrderScreenState();
}

class _AdminOrderScreenState extends State<AdminOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Orders'),
        centerTitle: true,
      ),
      body: orderList.isEmpty
          ? const Center(
              child: Text(
                'No orders submitted yet.',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: orderList.length,
              itemBuilder: (context, index) {
                final order = orderList[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 15),
                  child: ListTile(
                    title: Text(
                      order.name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      'Location: ${order.location}\nWaste Type: ${order.wasteType}\nWaste Weight: ${order.wasteWeight}\nPhone: ${order.phoneNumber}',
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        // Remove the order from the list and refresh UI
                        setState(() {
                          orderList.removeAt(index);
                        });
                      },
                    ),
                  ),
                );
              },
            ),
    );
  }
}
