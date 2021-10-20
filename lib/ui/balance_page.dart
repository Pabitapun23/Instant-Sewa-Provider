import 'package:flutter/material.dart';
import 'package:provider/state/service_profile_update_state.dart';
import 'package:provider/ui/recharge_page.dart';
import 'package:provider/util/hexcode.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class BalancePage extends StatefulWidget {
  @override
  _BalancePageState createState() => _BalancePageState();
}

class _BalancePageState extends State<BalancePage> {
  final _balanceState = RM.get<ServiceProviderUpdateState>();
  bool _isLoading = false;
  String amount;
  @override
  void initState() {
    _balanceState.setState((balanceState) async =>
    amount = await balanceState.transactionAmount());
    _isLoading = false;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Color _purple = HexColor('#603f8b');
    return Scaffold(
      appBar: AppBar(
        title: Text('Balance'),
        centerTitle: true,
        backgroundColor: _purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Remaining Balance',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
            ),
            Row(
              children: [
                Icon(Icons.attach_money),
                Text(
                  amount,
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
                ),
                Spacer(),
                Center(
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => RechargePage(),
                        ),
                      );
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    color: _purple,
                    padding: EdgeInsets.fromLTRB(35, 12, 35, 12),
                    child: Text(
                      'Recharge',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
