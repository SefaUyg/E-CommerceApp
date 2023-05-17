import 'package:flutter/material.dart';
import 'package:ecommerce_app/widgets/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OrderConfirmation extends StatelessWidget {
  static const String routeName = '/order-confirmation';
  
  static Route route(){
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (context) => OrderConfirmation());
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: CustomAppBar(title: 'Order Confirmation'),
      bottomNavigationBar: CustomNavBar(screen: routeName),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
              Container(color: Colors.black, width: double.infinity, height: 300),
              Positioned(
                left: (MediaQuery.of(context).size.width - 100) / 2,
                top: 125,
                child: SvgPicture.asset('assets/svgs/garlands.svg')),
              Positioned(
                top: 250,
                height: 100,
                width: MediaQuery.of(context).size.width,
                child:
                Text('Your order is complete!', textAlign: TextAlign.center, style: Theme.of(context).textTheme.headline3!.copyWith(color: Colors.white),)),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30),
                  Text('Thank you for purchasing on SUMBU E-Commerce', style: Theme.of(context).textTheme.headline6),
                  SizedBox(height: 10),
                  OrderSummary(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}