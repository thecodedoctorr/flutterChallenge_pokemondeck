import 'package:flutter/material.dart';
import '/provider/poke_provider.dart';
import '/components/poke_card.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<PokeProvider>(context, listen: false).getHomeData();
  }

  Future<void> _refreshData(BuildContext context) async {
    await Provider.of<PokeProvider>(context, listen: false).getHomeData();
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<PokeProvider>(context);
    final pokeData = data.pokeList;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 5, 20, 0),
        child: Column(
          children: [
            Expanded(
              child: data.isLoading
                  ? Center(child: Image.asset('images/pokeLoad.gif'))
                  : RefreshIndicator(
                      onRefresh: () => _refreshData(context),
                      child: ListView(
                        padding: EdgeInsets.only(top: 20),
                        children: [
                          Column(
                            children: pokeData
                                .map((item) => PokeCard(item, context))
                                .toList(),
                          ),
                        ],
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
