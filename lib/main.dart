import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:order_ticket/controllers/ticket_controller.dart';
import 'package:order_ticket/controllers/product_controller.dart';
import 'package:order_ticket/controllers/user_controller.dart';
import 'package:order_ticket/views/open_ticket.dart';
import 'package:order_ticket/views/open_ticket_details.dart';
import 'package:order_ticket/views/product_screen.dart';
import 'package:order_ticket/views/saved_ticket.dart';
import 'package:order_ticket/views/user_profile.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => ProductController()),
    ChangeNotifierProvider(create: (context) => UserController()),
    ChangeNotifierProvider(create: (context) => TicketController()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Khaja Ghar',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF4F4F4),
        textTheme: GoogleFonts.mulishTextTheme(
            Theme.of(context).textTheme.apply(bodyColor: Colors.black)),
        pageTransitionsTheme: const PageTransitionsTheme(builders: {
          TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
        }),
        primaryColor: Colors.blue,
      ),
      routes: {
        ProductScreen.id: (context) => const ProductScreen(),
        OpenTicket.id: (context) => const OpenTicket(),
        UserProfile.id: (context) => const UserProfile(),
        OpenTicketDetails.id: (context) => const OpenTicketDetails(),
        SavedTicket.id: (context) => const SavedTicket(),
      },
      initialRoute: ProductScreen.id,
    );
  }
}
