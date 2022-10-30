import 'package:flutter/material.dart';
import 'package:ticket_making_widget/ticket_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.red,
        child: Column(
          children: [
            const SizedBox(height: 200,),

            ///The Ticket Widget
            TicketWidget(
              height: 200,
              width: MediaQuery.of(context).size.width-20,
              area: 80,
              isCornerRounded: true,
              child: Container(

                child: const Center(child: Text("Hello Aman")),

              ),
            ),
          ],
        ),
      ),
    );
  }
}
