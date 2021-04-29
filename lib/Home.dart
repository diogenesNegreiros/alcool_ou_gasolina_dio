import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();

}

class _HomeState extends State<Home> {

  String _resultado ="";
  TextEditingController _controleAlcool = TextEditingController();
  TextEditingController _controleGasolina = TextEditingController();

  void _calcularCombustivel(){

    //substitui virgula por ponto para o cálculo
    String _precoAlcool = _controleAlcool.text.replaceAll(",", ".");
    String _precoGasolina = _controleGasolina.text.replaceAll(",", ".");

    double valorAlcool = double.tryParse(_precoAlcool);
    double valorGasolina = double.tryParse(_precoGasolina);

setState(() {
  if(valorAlcool == null || valorGasolina == null){
    _resultado = "Digite um valor válido!";
  }else{
    double indice = valorAlcool / valorGasolina;
    if(indice < 0.7){
      _resultado = "É melhor abastecer com Alcool!";
    }else{
      _resultado = "É melhor abastecer com Gasolina! ";
    }

  }
});

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Álcool ou gasolina?",
        ),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.yellowAccent[90],
      body: Container(
         padding: EdgeInsets.all(32),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                    "Saiba se é melhor abastercer com álcool ou gasolina!",
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Colors.green[900],
                    )
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Image.asset("images/posto.png", width: 120, height: 120,)
              ),
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: TextField(
                  keyboardType: TextInputType.numberWithOptions(signed: true, decimal: true),
                  decoration: InputDecoration(
                      labelText: "Valor do litro do álcool"
                  ),
                  style: TextStyle(
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                    color: Colors.blue,
                  ),
                  controller: _controleAlcool,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: TextField(
                  keyboardType: TextInputType.numberWithOptions(signed: true, decimal: true),
                  decoration: InputDecoration(
                      labelText: "Valor do litro da gasolina"
                  ),
                  style: TextStyle(
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                    color: Colors.blue,
                  ),
                  controller: _controleGasolina,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15),
              ),

              Padding(
                padding: EdgeInsets.only(top: 15),
                child: RaisedButton(
                  color: Colors.green[800],
                  onPressed: _calcularCombustivel,
                  child: Text(
                      "Calcular",
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: Text(
                    _resultado,
                style: TextStyle(
                  fontSize: 30,
                  fontStyle: FontStyle.italic,
                  color: Colors.blue,
                ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        )

      ),
    );
  }
}
