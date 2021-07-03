class DatabaseSql {
  List newsSu = [
    'CREATE TABLE `news_su` ( `idnews_su` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, `title` TEXT, `subtitle` TEXT, `text` TEXT, `date_in` TEXT, `date_at` TEXT );'
  ];
  List people = [
    'CREATE TABLE `people` ( `idpeople` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, `type` INTEGER DEFAULT 1, `name` TEXT NOT NULL, `sex` INTEGER DEFAULT 1, `birth` TEXT, `cns` TEXT, `cpf` TEXT , `img_url` TEXT );'
  ];
  List us = [
    'CREATE TABLE `us` ( `idus` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, `type` INTEGER DEFAULT 0, `name` TEXT NOT NULL, `location` TEXT, `phone` TEXT, `office_hours` TEXT, `geolocation` TEXT );',
    "insert into `us` ('type', 'name', 'location', 'phone', 'office_hours', 'geolocation') values "
        "('0','USF LOIANE MORENO VIEIRA', 'ARSE 24', '6332127963', 'Segunda a sexta das 7h às 19h', '-10.19433151,-48.31337571'),"
        "('0','USF ARNE 64', '508 NORTE', '6332185611' , 'Segunda a sexta das 7h às 19h', '10.16596820,-48.30821514'),"
        "('0','USF ARNE 53', '406 NORTE','63 32185361', 'Segunda a sexta das 7h às 19h','0.16853550,-48.31748486'),"
        "('0','USF DEISE DE FÁTIMA', 'ARSE 13 108 SUL', '6332185024','Segunda a sexta das 7h às 19h ', '-10.18688623,-48.31883669'),"
        "('0','USF EUGENIO PINHEIRO', 'JARDIM AURENY I', '6332185434', 'Segunda a domingo das 7h às 19h','-10.31467402,-48.30557048'), "
        "('0','USF AURENY II', 'JARDIM AURENY II', '6332185410','Segunda a sexta das 7h às 19h', '-10.32683415,-48.30280244' ), "
        "('0','USF LIBERDADE', 'JARDIM AURENY III', '6332185411', 'Segunda a sexta das 7h às 19h', '-10.31621181,-48.31855774'),"
        "('0','USF ALTO BONITO', 'JARDIM AURENY IV', '6332185386', 'Segunda a sexta das 7h às 18h', '-10.30147337,-48.30057621'),"
        "('0','USF NOVO HORIZONTE', 'AURENY IV', '6332185414', 'Segunda a sexta das 7h às 19h', '-10.30101644,-48.30729246' ),"
        "('0','USF PROF.: ISABEL AULER ARSO 23', '207 SUL', '32185032', 'Segunda a sexta das 7h às 19h', '-10.19386214,-48.35184664'),"
        "('0','USF FRANCISCO JUNIOR ARSO 41', '403 SUL', '6332185362', 'Segunda a sexta das 7h às 19h', '-10.20730353,-48.34331989 '),"
        "('0','USF ASR-SE 75', '712 SUL', '6332185331', 'Segunda a sexta das 7h às 19h', '-10.22558086,-48.31504941'), "
        "('0','USF ARSE 82', '806 SUL', '6332185487', 'Segunda a sexta das 7h às 21h', '-10.23327591,-48.31973791'),"
        "('0','USF SATILO ALVES DE SOUSA ARSO 111', '1103 SUL', '6332127994', 'Segunda a sexta das 7h às 21h', '-10.25161140,-48.33686113'), "
        "('0','USF ARSE 13', '1304 SUL', '6332185415', 'Segunda a sexta das 7h às 19h', '-10.26465643,-48.32525790'),"
        "('0','USF ALBERTINO SANTOS ARSE 101', '1004 SUL',  '6332185359', 'Segunda a sexta das 7h às 21h', '-10.24844485,-48.32459807'),"
        "('0','USF VALERIA MARTINS ARSE 122', '1206 SUL', '632185449', 'Segunda a sexta das 7h às 21h', '-10.25875306,-48.32366467'), "
        "('0','USF TAQUARI', 'JARDIM TAQUARI', '6330311100', 'Segunda a domingo das 7h às 19h', '-10.34623309,-48.33260179'),"
        "('0','USF LAURIDES LIMA MILHOMEM', 'AURENY III','6332127993', 'Segunda a sexta das 7h às 19h', '-10.30448283,-48.31883669' ),"
        "('0','USF JOSE LUCIO DE CARVALHO', 'LAGO SUL', '6332185453', 'Segunda a sexta das 7h às 19h', '-10.33001114,-48.31928730'),"
        "('0','USF JOSE LUIZ OTAVIANI ARNO 33', '307 NORTE', '63332127954', 'Segunda a sexta das 7h às 19h', '-10.16756812,-48.35165083'), "
        "('0','USF ARNO 71', '603 NORTE', '6332185368', 'Segunda a sexta das 7h às 19h', '-10.15413225,-48.32702279'),"
        "('0','USF ARNO 61', '503 NORTE', '6332127958', 'Segunda a sexta das 7h às 19h', '-10.15577898,-48.34584117'), "
        "('0','USF ARNO 42', '405 NORTE', '6332185388', 'Segunda a sexta das 7h às 19h', '-10.16231568,-48.34617376'),"
        "('0','USF ARNO 41', '403 NORTE', '6332185205', 'Segunda a sexta das 7h às 21h', '-10.16257801,-48.33821833'),"
        "('0','USF SANTA FÉ', 'SETOR SANTA FÉ', '6332185466', 'Segunda a sexta das 7h às 19h', '-10.33059866,-48.29227209'),"
        "('0','USF SANTA BARBARA', 'SETOR SANTA BÁRBARA','6332185420', 'Segunda a sexta das 7h às 18h', '-10.33887874,-48.30761433'), "
        "('0','USF MORADA DO SOL', 'SETOR MORADA DO SOL', '63321-5419', 'Segunda a sexta das 7h às 19h', '-10.33746844,-48.28426838'), "
        "('0','USF BELA VISTA', 'JARDIM BELA VISTA', '6332185412', 'Segunda a sexta das 7h às 19h', '-10.35059361,-48.29631686'),"
        "('0','USF JOSE HERMES RODRIGUES DAMASO', 'SETOR SUL', '6332185267', 'Segunda a sexta das 7h às 19h', '-10.34008039,-48.29512596'),"
        "('0','USF WALTERLY WAGNER JOSE RIBEIRO', 'TAQUARUÇU GRANDE', '63992166849', 'Segunda a sexta das 7h às 19h', '-10.18356040,-48.33377930'), "
        "('0','USF MARIAZINHA RODRIGUES DA SILVA', 'BURITIRANA', '6335331038', 'Segunda a sexta das 7h às 19h', '-10.18356040,-48.33377930'),"
        "('0','USF WALTER PEREIRA MORATO', 'TAQUARUÇU', '6335541122', 'Segunda a domingo das 7h às 19h', '-10.31581735,-48.16007674'),"
        "('1','SAMU ACSU-SE 100', '1002 SUL', '194','24h','-10.24622348,-48.33244085' ),"
        "('1','UPA NORTE ARNO 21', '203 NORTE', '6332185110', '24h', '-10.17499955,-48.34040723'), "
        "('1','UPA SUL', 'JARDIM AURENY II', '6332185569', '24h', '-10.33187497,-48.30019319');  "
  ];

  /*  getSql() {
    List<String> sql = [people, newsSu, us];
    return sql;
  } */
  List getTables() {
    List tables = [
      newsSu,
      people,
      us,
    ];
    return tables;
  }

  Future<void> create(dynamic db) async {
    List tables = this.getTables();
    print('Criando e povoando tabelas, espere...');

    try {
      tables.forEach((val) async {
        await val.forEach((element) async {
          await db.execute(element);
        });
      });
    } catch (e) {
      print(e);
    }
  }
}
