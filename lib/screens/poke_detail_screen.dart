import 'package:flutter/material.dart';
import '/models/pokemon.dart';
import '/provider/poke_provider.dart';
import '/components/poke_about.dart';
import '/components/poke_moves.dart';
import '/components/poke_stats.dart';
import '/components/request_error.dart';
import '/components/type_card.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class PokeDetailScreen extends StatefulWidget {
  static const routeName = '/pokeDetailScreen';

  @override
  _PokeDetailScreenState createState() => _PokeDetailScreenState();
}

class _PokeDetailScreenState extends State<PokeDetailScreen> {
  int _selectedIndex = 0;
  var _isInit = true;

  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInit) {
      final pokeId = ModalRoute.of(context).settings.arguments as String;
      Provider.of<PokeProvider>(context, listen: false)
          .getPokeData(pokeId)
          .then((_) {});
    }
    _isInit = false;
  }

  Widget _buttonBuilder(Pokemon pokeData, String title, int myIndex) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = myIndex;
        });
      },
      child: Container(
        height: 35,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: _selectedIndex == myIndex ? Colors.teal : Colors.transparent,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Text(
            title,
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w200,
                color: _selectedIndex == myIndex ? Colors.white : Colors.black),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final providerData = Provider.of<PokeProvider>(context);
    final pokeData = providerData.pokemon;

    return Scaffold(
        backgroundColor: providerData.isLoading
            ? Colors.white
            : providerData.isRequestError
                ? Colors.white
                : Colors.white60,
        body: providerData.isLoading
            ? Center(child: Image.asset('images/pokeLoad.gif'))
            : providerData.isRequestError
                ? RequestError()
                : Column(
                    children: [
                      Container(
                        child: FadeInImage.assetNetwork(
                          placeholder: 'images/pokeLoad.gif',
                          image: pokeData.sprite,
                          imageScale: 0.5,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: MediaQuery.of(context).size.width - 20,
                          padding: EdgeInsets.only(top: 3),
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                toBeginningOfSentenceCase(pokeData.name),
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                '#' + pokeData.id.toString(),
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w400),
                              ),
                              SizedBox(height: 5),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  if (pokeData.type1 != null)
                                    TypeCard(pokeData.type1),
                                  if (pokeData.type2 != null)
                                    SizedBox(width: 10),
                                  if (pokeData.type2 != null)
                                    TypeCard(pokeData.type2),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  _buttonBuilder(pokeData, 'ABOUT', 0),
                                  _buttonBuilder(pokeData, 'STATS', 1),
                                  _buttonBuilder(pokeData, 'MOVES', 2),
                                ],
                              ),
                              _selectedIndex == 0
                                  ? Expanded(
                                      child: PokeAbout(pokeData),
                                    )
                                  : _selectedIndex == 1
                                      ? PokeStats(pokeData)
                                      : Expanded(
                                          child: PokeMoves(pokeData),
                                        )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ));
  }
}
