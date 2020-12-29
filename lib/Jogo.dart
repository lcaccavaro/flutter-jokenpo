import 'dart:math';

import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  
  var _image = AssetImage("images/padrao.png");
  var _resultado = "";

  void _opcaoSelecionada(String escolhaUsuario){

    var opcoes = ["pedra", "papel", "tesoura"];
    var numeroSorteado = Random().nextInt(3);
    var escolhaApp = opcoes[numeroSorteado];

    switch(escolhaApp){
      case "pedra":
        setState(() {
          this._image = AssetImage("images/pedra.png");
        });  
      break;
      case "papel":
        setState(() {
          this._image = AssetImage("images/papel.png");
        });
      break;
      case "tesoura":
        setState(() {
          this._image = AssetImage("images/tesoura.png");
        });
      break;
    }

    //validações
    if( (escolhaUsuario == "pedra" && escolhaApp == "tesoura")
      || (escolhaUsuario == "papel" && escolhaApp == "pedra")
      || (escolhaUsuario == "tesoura" && escolhaApp == "papel")
    ){
      //usuário ganhou
      setState(() {
        this._resultado = "Você ganhou!!!";
      });
    }
    else if( (escolhaApp == "pedra" && escolhaUsuario == "tesoura")
          || (escolhaApp == "papel" && escolhaUsuario == "pedra")
          || (escolhaApp == "tesoura" && escolhaUsuario == "papel") 
    ){
      //app ganhou
      setState(() {
        this._resultado = "Você perdeu!!!";
      });
    }
    else{
      //empate
      setState(() {
        this._resultado = "Empatou!!!";
      });
    }

  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JokenPo'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          
          //Texto
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha do App",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              )
            ),
          ),
          
          //Imagem
          Image(
            image: this._image
          ),

          Padding(
            padding: EdgeInsets.only(top: 40, bottom: 40),
            child: Text( this._resultado,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.blue,
                        fontStyle: FontStyle.italic
                      ),
                    ),
          ),

          //Texto resultado
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha uma opção abaixo",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              )
            ),
          ),

          //Linha com as opções
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[

              GestureDetector(
                onTap: ()=> this._opcaoSelecionada("pedra"),
                child: Image.asset(
                          "images/pedra.png", 
                          height: 100,
                        ),
              ),

              GestureDetector(
                onTap: ()=> this._opcaoSelecionada("papel"),
                child: Image.asset(
                          "images/papel.png", 
                          height: 100,
                        ),
              ),
              
              GestureDetector(
                onTap: ()=> this._opcaoSelecionada("tesoura"),
                child: Image.asset(
                          "images/tesoura.png", 
                          height: 100,
                        ),
              ),
              
            ],
          )

        ],
      ),
    );
  }
}