import 'package:astrohub_user/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import '../utils/colors.dart';
import '../utils/helper_functions.dart';

class CheckoutPage extends StatefulWidget {
  static const String routeName = 'checkout';

  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  String paymentMethodGroupValue = PaymentMethod.cod;
  String? city;
  final addressController = TextEditingController();
  final postalCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Confirm Order'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(8.0),
              children: [
                buildHeaderSection('Product Information'),
                buildProductInfoSection(),
                buildTotalAmountSection(),
                buildHeaderSection('Delivery Address'),
                buildDeliveryAddressSection(),
                buildHeaderSection('Payment Method'),
                buildPaymentMethodSection(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ElevatedButton(
              onPressed: _saveOrder,
              style: ElevatedButton.styleFrom(
                  backgroundColor: kShrineBrown900,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0))),
              child: const Text('PLACE ORDER'),
            ),
          )
        ],
      ),
    );
  }

  Widget buildHeaderSection(String title) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Text(
        title,
        style: const TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey),
      ),
    );
  }

  Widget buildProductInfoSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Consumer<CartProvider>(
          builder: (context, provider, child) => Column(
            children: provider.cartList
                .map((cartModel) => ListTile(
              title: Text(cartModel.telescopeModel),
              trailing: Text(
                '${cartModel.quantity}x$currencySymbol${cartModel.price}',
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ))
                .toList(),
          ),
        ),
      ),
    );
  }

  Widget buildTotalAmountSection() {
    return Card(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ListTile(
            title: const Text('Total Amount'),
            trailing: Consumer<CartProvider>(
              builder: (context, provider, child) => Text(
                '$currencySymbol${provider.getCartSubTotal()}',
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ));
  }

  Widget buildDeliveryAddressSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            TextField(
              controller: addressController,
              decoration: InputDecoration(
                hintText: 'Street Address',
              ),
            ),
            TextField(
              controller: postalCodeController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Zip Code',
              ),
            ),
            DropdownButton<String>(
              value: city,
              hint: const Text('Select your city'),
              isExpanded: true,
              onChanged: (value) {
                setState(() {
                  city = value;
                });
              },
              items: cities
                  .map((city) => DropdownMenuItem<String>(
                value: city,
                child: Text(city),
              ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPaymentMethodSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Radio<String>(
              value: PaymentMethod.cod,
              groupValue: paymentMethodGroupValue,
              onChanged: (value) {
                setState(() {
                  paymentMethodGroupValue = value!;
                });
              },
            ),
            const Text(PaymentMethod.cod),
            Radio<String>(
              value: PaymentMethod.online,
              groupValue: paymentMethodGroupValue,
              onChanged: (value) {
                setState(() {
                  paymentMethodGroupValue = value!;
                });
              },
            ),
            const Text(PaymentMethod.online),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    addressController.dispose();
    postalCodeController.dispose();
    super.dispose();
  }

  void _saveOrder() async {
    if (addressController.text.isEmpty) {
      showMsg(context, 'Please provide your address');
      return;
    }
    if (postalCodeController.text.isEmpty) {
      showMsg(context, 'Please provide your zip code');
      return;
    }
    if (city == null) {
      showMsg(context, 'Please select your city');
      return;
    }

    EasyLoading.show(status: 'Please wait');
  }
}
