import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Who extends StatelessWidget {
  //const Who({ Key? key }) : super(key: key);
  final Object stlAll = TextStyle(
    color: Colors.grey[900],
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
  final Object stlEmail = TextStyle(
    color: Colors.red,
    fontSize: 14,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quem somos'),
      ),
      //
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                children: [
                  Image(
                    width: 150,
                    image: AssetImage('src/img/logo.png'),
                  ),
                  Text(
                    'IUPS',
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
              Text(
                'Versão Beta 0.1',
                style: stlAll,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'IUPS é uma versão Beta, para ajudar a encontrar as unidades de Saúde na cidade de Palmas - TO\n'
                  'Trazendo junto o Cartão virtual do SUS',
                  style: stlAll,
                ),
              ),
              Text(
                'Gostou do aplicativo, deseja pagar um café?\nEntre em contato',
                style: stlAll,
              ),
              Text(
                'E-mail:',
                style: Theme.of(context).textTheme.headline6,
              ),
              TextButton(
                onPressed: () => openEmail('andreb@rede.ulbra.br'),
                child: Text(
                  'andreb@rede.ulbra.br',
                  style: stlEmail,
                ),
              ),
              TextButton(
                onPressed: () => openEmail('aldisseia@gmailcom'),
                child: Text(
                  'aldisseia@gmail.com',
                  style: stlEmail,
                ),
              ),
              TextButton(
                onPressed: () => openUrl(),
                child: Text('Nosso facebook'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  openUrl() async {
    const url = 'https://www.facebook.com/4lastpg';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Erro ao chamar $url';
    }
  }

  openEmail(mail) async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: mail,
      query: 'subject=app COVID-19 plus&body=Digite aqui a sua mensagem: ',
    );
    String url = params.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Erro ao chamar $url');
    }
  }
}
