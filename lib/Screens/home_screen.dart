import 'package:flutter/material.dart';
import 'package:task1/Screens/get_card.dart';
import 'package:task1/Screens/get_customer.dart';
import 'package:task1/constant/circuler_dialog.dart';
import 'package:task1/constant/error_dialog.dart';
import 'package:task1/constant/string.dart';
import 'package:task1/model/cards/custom_card.dart';
import 'package:task1/model/cards/post_card_modal.dart';
import 'package:task1/model/customer/create_customer_model.dart';
import 'package:task1/provider/card_provider.dart';
import 'package:task1/provider/customer_provider.dart';
import 'package:task1/widgets/elevated_btn.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passController = TextEditingController();

  CustomerProvider customerProviders = CustomerProvider();

  CardProvider cardProvider = CardProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            createCustomerBtn(),
            const SizedBox(height: 20),
            getCustomerBtn(context),
            const SizedBox(height: 30),
            Divider(),
            const SizedBox(height: 30),
            craeteCardBtn(),
            const SizedBox(height: 20),
            getCardBtn(context),
          ],
        ),
      ),
    );
  }

  //^ get customer
  Widget getCustomerBtn(BuildContext context) {
    return ElevatedBtn(
      name: Strings.getCustomer,
      press: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const GetCustomerScreen(),
          ),
        );
      },
    );
  }

  //^ get Card
  Widget getCardBtn(BuildContext context) {
    return ElevatedBtn(
      name: Strings.getCustomer,
      press: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const GetCardScreen(),
          ),
        );
      },
    );
  }

  //^ create Card
  Widget craeteCardBtn() {
    return ElevatedBtn(
      name: Strings.createCard,
      press: () async {
        // loder
        circulerDialog(context);

        CustomModal<CreateCardModal> res =
            await cardProvider.createCardProvider();

        if (res.status != 200) {
          return errorDialog(
            context: context,
            error: Strings.errorText,
          );
        } else {
          navigatorPop(context: context);
          return errorDialog(
            context: context,
            error: Strings.succsessText,
          );
        }
      },
    );
  }

  //^ create customer
  Widget createCustomerBtn() {
    return ElevatedBtn(
      name: Strings.createCustomer,
      press: () async {
        // loder
        circulerDialog(context);

        CustomModal<CreateCustomerModel> res =
            await customerProviders.createApiProvider(
          description: "",
          name: "",
        );

        if (res.status != 200) {
          return errorDialog(
            context: context,
            error: Strings.errorText,
          );
        } else {
          navigatorPop(context: context);
          return errorDialog(
            context: context,
            error: Strings.succsessText,
          );
        }
      },
    );
  }
}
