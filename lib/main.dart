import 'package:flutter/material.dart';

void main() => runApp(MeuApp());

class MeuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mover Imagem',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: TelaPrincipal(),
    );
  }
}

class TelaPrincipal extends StatefulWidget {
  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  double top = 100.0, left = 100.0;

  void moverImagem(String direcao) {
    setState(() {
      if (direcao == 'cima') top -= 10;
      if (direcao == 'baixo') top += 10;
      if (direcao == 'esquerda') left -= 10;
      if (direcao == 'direita') left += 10;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mover Imagem'),
        centerTitle: true, // Centraliza o título
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text('Clique nos botões para mover a imagem!', style: TextStyle(fontSize: 16)),
            SizedBox(height: 20),
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                    top: top,
                    left: left,
                    child: Image.asset('assets/centro-de-mesa-spider-man1.png', width: 200, height: 200),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Wrap(
              spacing: 10,
              children: [
                ElevatedButton(onPressed: () => moverImagem('cima'), child: Text('Cima')),
                ElevatedButton(onPressed: () => moverImagem('baixo'), child: Text('Baixo')),
                ElevatedButton(onPressed: () => moverImagem('esquerda'), child: Text('Esquerda')),
                ElevatedButton(onPressed: () => moverImagem('direita'), child: Text('Direita')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}