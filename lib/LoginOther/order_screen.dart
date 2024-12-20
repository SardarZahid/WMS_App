import 'package:flutter/material.dart';
import 'package:myapp/model/ordermodel.dart';
// Import the order model and global list

class OrderScreenUI extends StatefulWidget {
  const OrderScreenUI({super.key});

  @override
  State<OrderScreenUI> createState() => _OrderScreenUIState();
}

class _OrderScreenUIState extends State<OrderScreenUI> {
  // Controllers for form inputs
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _wasteTypeController = TextEditingController();
  final TextEditingController _wasteWeightController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  void dispose() {
    // Dispose controllers
    _nameController.dispose();
    _locationController.dispose();
    _wasteTypeController.dispose();
    _wasteWeightController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  void _submitOrder() {
    if (_nameController.text.isNotEmpty &&
        _locationController.text.isNotEmpty &&
        _wasteTypeController.text.isNotEmpty &&
        _wasteWeightController.text.isNotEmpty &&
        _phoneNumberController.text.isNotEmpty) {
      setState(() {
        // Add the order to the global order list
        orderList.add(Order(
          name: _nameController.text,
          location: _locationController.text,
          wasteType: _wasteTypeController.text,
          wasteWeight: _wasteWeightController.text,
          phoneNumber: _phoneNumberController.text,
        ));

        // Clear the input fields after submission
        _nameController.clear();
        _locationController.clear();
        _wasteTypeController.clear();
        _wasteWeightController.clear();
        _phoneNumberController.clear();
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Order submitted successfully!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all fields!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Orders',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            _buildTextField('Name', _nameController),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: _buildTextField('Location', _locationController),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => print("Map Button Pressed"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1A237E),
                  ),
                  child: const Text('MAP', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
            const SizedBox(height: 10),
            _buildTextField('Waste Type', _wasteTypeController),
            const SizedBox(height: 10),
            _buildTextField('Waste Weight', _wasteWeightController),
            const SizedBox(height: 10),
            _buildTextField('Phone Number', _phoneNumberController),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitOrder,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1A237E),
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text('Submit', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
    );
  }
}
