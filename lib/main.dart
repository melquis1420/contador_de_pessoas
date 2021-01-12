import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      title: "Contador de Pessoas",
      home: Home()));
}



class Home extends StatefulWidget { //stful+tab
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _people=0;

  String _infoText="Pode Entrar!";

  void _changePeople(int delta){
    setState(() { //atualiza a tela
      _people += delta;

      if(_people < 0){
        _infoText="Mundo Invertido??";
      }else if(_people<10){
        _infoText="Pode Entrar!";
      }else{
        _infoText=("Local Locato!!");
      }
    });


  }


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset( //pubspec.yaml
          "images/restaurant.jpg", //caminho da imagem
          fit: BoxFit.cover, //estilo de preenchimento
          height: 1000.0, //tamanho do preenchimento da imagem
        ),
        Column(
          //bloco coluna

          mainAxisAlignment:
          MainAxisAlignment.center, //alinhou a coluna no centro
          children: [
            //filhos da coluna

            Text("Pessoas:$_people",
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
            Row(
              //crio uma linha
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  //cria a margem
                  padding: EdgeInsets.all(10.0),
                  //seleciona estilo e tamanho da margem
                  child: FlatButton(
                    //cria botão
                    child: //children aceita mais de um filho. child aceita um unico filho
                    Text(
                      "+1",
                      style: TextStyle(fontSize: 40.0, color: Colors.white),
                    ),
                    onPressed: () {
                      _changePeople(1);
                      },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(

                    child: Text(
                      "-1",
                      style: TextStyle(fontSize: 40.0, color: Colors.white),
                    ),
                    onPressed: () {
                      _changePeople(-1);
                    },
                  ),
                )
              ],
            ),
            Text(_infoText,
                style: TextStyle(
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontSize: 30.0))
          ],
        )
      ],
    );
  }
}
