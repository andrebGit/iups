import 'package:flutter/material.dart';
import 'package:sus_plus/page/listUs.dart';
import 'package:url_launcher/url_launcher.dart';

class SolicitarCardSus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 15,
      height: MediaQuery.of(context).size.height / 1.1,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 4,
              child: Center(
                child: Container(
                  color: Colors.black.withAlpha(150),
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'COMO SOLICITAR O CARTÃO SUS?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.grey[100],
                        ),
                      ),
                      paddings(),
                    ],
                  ),
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                image: DecorationImage(
                  image: AssetImage("src/img/cns.png"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Text(
                    'A solicitação do Cartão SUS  é um processo simples e gratuito, o qual deve ser realizado numa unidade de saúde do sistema, bem como, as UBS (Unidade Básica de Saúde) presentes no bairro em que reside ou demais municípios próximos a sua residência, ou, na Secretaria de Saúde da sua cidade.',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 20,
                    ),
                  ),
                  // Endereço
                  paddings(val: 20.0),
                  Text(
                      'Depois é só ir até a unidade de saúde mais próxima de sua residência após 30 dias para retirar o mesmo, basta apresentar o protocolo e documento de identificação com foto',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 20,
                      )),
                  paddings(),
                  // Telefone

                  Text('O prazo para recebimento é de até 90 dias.',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[600],
                        fontSize: 20,
                      )),

                  paddings(),
                  Text(
                    'Para solicitar o cartão SUS é necessário ter em mãos os seguintes documentos:',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Registro Geral – RG\n'
                    'Cadastro de Pessoa Física – CPF\n'
                    'Certidões de casamento ou nascimento\n'
                    'Comprovante de residência atualizado.\n',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 18,
                    ),
                  ),
                  paddings(),
                  // MAP
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ListUs(),
                          // ListUs(),
                        ),
                      );
                    },
                    child: Container(
                      width: 200,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Icon(
                            Icons.list_alt,
                            color: Colors.white,
                            size: 70,
                          ),
                          Text(
                            'Toque para ver a lista de Unidades de Saúde',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget paddings({double val = 7.0}) {
    return Padding(padding: EdgeInsets.only(top: val));
  }
}
