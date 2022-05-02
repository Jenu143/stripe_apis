import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task1/provider/card_provider.dart';

class GetCardScreen extends StatefulWidget {
  const GetCardScreen({Key? key}) : super(key: key);

  @override
  State<GetCardScreen> createState() => _GetCardScreenState();
}

class _GetCardScreenState extends State<GetCardScreen> {
  CardProvider cardProvider = CardProvider();
  @override
  void initState() {
    cardProvider = Provider.of<CardProvider>(context, listen: false);
    cardProvider.getGetProvider();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<CardProvider>(
        builder: (context, value, child) {
          if (value.customModal.data?.data != null) {
            var nData = value.customModal.data?.data;
            return ListView.builder(
              itemCount: nData?.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Text(
                    "${index + 1}",
                    style: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  title: Text("${nData?[index].id}"),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () async {
                      await cardProvider
                          .deleteCardProvider(id: "${nData?[index].id}")
                          .then((value) async {
                        await cardProvider.getGetProvider();
                      });
                    },
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
