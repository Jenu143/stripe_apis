import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task1/constant/string.dart';
import 'package:task1/provider/customer_provider.dart';

class GetCustomerScreen extends StatefulWidget {
  const GetCustomerScreen({Key? key}) : super(key: key);

  @override
  State<GetCustomerScreen> createState() => _GetCustomerScreenState();
}

class _GetCustomerScreenState extends State<GetCustomerScreen> {
  CustomerProvider providers = CustomerProvider();
  @override
  void initState() {
    providers = Provider.of<CustomerProvider>(context, listen: false);
    providers.getCustomerProvider();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<CustomerProvider>(
        builder: (context, value, child) {
          if (value.customApiResponse.status != 200) {
            return circulerProgress();
          } else {
            if (value.customApiResponse.data!.data == null) {
              return circulerProgress();
            } else {
              if (value.customApiResponse.data!.data!.isEmpty) {
                return Center(
                  child: noCreatedCustomerText(),
                );
              } else {
                return createdCustomerList(context, value);
              }
            }
          }
        },
      ),
    );
  }

  Center circulerProgress() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  //^ created customer list
  Center createdCustomerList(BuildContext context, CustomerProvider value) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            color: Colors.grey.withOpacity(0.1),
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
              itemCount: value.customApiResponse.data?.data?.length,
              itemBuilder: (context, index) {
                var nData = value.customApiResponse.data?.data;

                return ListTile(
                  leading: Text(
                    "${index + 1}",
                    style: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  title: Text(
                    "${nData?[index].id}",
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: IconButton(
                    onPressed: () async {
                      await providers
                          .deletCustomer(id: "${nData?[index].id}")
                          .then((value) async {
                        await providers.getCustomerProvider();
                      });
                    },
                    icon: const Icon(Icons.delete, color: Colors.purple),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  //^ no created customer
  Center noCreatedCustomerText() {
    return Center(
      child: Text(
        Strings.noCustomer,
        style: TextStyle(
          color: Colors.grey.shade500,
          fontWeight: FontWeight.bold,
          fontSize: 20,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}
