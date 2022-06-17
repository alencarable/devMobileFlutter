//import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
//import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const myapp());
}

class myapp extends StatelessWidget {
  const myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pages',
      routes: {
        '/': (context) => login(),
        'homepage': (context) => homepage(),
        'logoff': (context) => logoff(),
        'entreterimento': (context) => entreterimento(),
        'gurus': (context) => gurus(),
        'pensadores': (context) => pensadores(),
        'fraseDia': (context) => fraseDia(),
      },
    );
  }
}

// Página de Login
class login extends StatelessWidget {
  //Variável do login do usuário
  String email = '';
  String senha = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: const DecorationImage(
              image: AssetImage('asset/images/login.png'), fit: BoxFit.cover),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Center(
                  child: Column(
                    children: [
                    Text('MyApp Frases ',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),),
                    Icon(
                      Icons.tag_faces_outlined,
                      color: Colors.amber,
                      size: 32,
                    ),
                    ],
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.all(20)),
              TextField(
                onChanged: (Text) {
                  email = Text;
                  print(email);
                },
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white38,
                  labelText: 'Email',
                  border: const OutlineInputBorder(),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(6),
              ),
              TextField(
                onChanged: (value) {
                  senha = value;
                  print(senha);
                },
                obscureText: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white38,
                  labelText: 'Senha',
                  border: OutlineInputBorder(),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(17),
              ),
              TextButton(
                onPressed: () {
                  if (email == "alencarable@fit.br" && senha == "P3dr0#F1t!") {
                    print("Entrada autorizada");
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Center(child: Text("Bem vinde!")),
                            content: Text("Deseja entrar:"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.popAndPushNamed(
                                      context, 'homepage');
                                },
                                child: Text('Vamos lá!'),
                              ),
                              TextButton(
                                //é opcional apenas para fins de demonstrção
                                onPressed: () {
                                  Navigator.popAndPushNamed(context, 'logoff');
                                },
                                child: Text('Agora não'),
                              ),
                            ],
                          );
                        });
                  } else {
                    print("Email ou senha incorreto, favor tente novamente!");
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Center(child: Text('Senha Incorreta!')),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.popAndPushNamed(context, 'login');
                                },
                                child: Text('Tente novamente'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.popAndPushNamed(context, 'logoff');
                                },
                                child: Text('Sair'),
                              ),
                            ],
                          );
                        });
                  }
                },
                child: Text(
                  'Entrar',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.lime[600],
                  onSurface: Colors.limeAccent[400],
                  padding: EdgeInsets.all(18),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(23)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Homepage
class homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              'Homepage',
              style: TextStyle(
                color: Colors.white,
                fontSize: 33,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.black,
      ),
      drawer: Drawer(
        child: menu(),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('asset/images/home.png'), fit: BoxFit.cover),
        ),
        child: homepageContent(),
      ),
    );
  }
}

// Menu
class menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.black,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.all(12)),
            Column(
              children: [
                Text(
                  '  Menu',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Padding(padding: EdgeInsets.all(10)),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '  Categorias:',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(10),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '  - Entreterimento',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.popAndPushNamed(context, 'entreterimento');
                  },
                  icon: Icon(
                    Icons.local_movies_outlined,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '  - Gurus',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.popAndPushNamed(context, 'gurus');
                  },
                  icon: Icon(
                    Icons.self_improvement_outlined,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '  - Contemporâneos',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.popAndPushNamed(context, 'pensadores');
                  },
                  icon: Icon(
                    Icons.emoji_objects_outlined,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '  - Frase do Dia',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.popAndPushNamed(context, 'fraseDia');
                  },
                  icon: Icon(
                    Icons.textsms_outlined,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '  - Logout',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.popAndPushNamed(context, 'logoff');
                  },
                  icon: Icon(
                    Icons.logout_outlined,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Padding(padding: EdgeInsets.all(100)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Desenvolvido por: Pedro Alencar ',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Icon(
                  Icons.copyright,
                  size: 20,
                  color: Colors.white,
                ),
              ],
            ),
            Padding(padding: EdgeInsets.all(10)),
          ],
        ),
      ),
    );
  }
}

//Página principal
class homepageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _name = 'Pedro';
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            Container(
              height: 150,
              width: 200,
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Olá, $_name!',
                    style: TextStyle(
                      fontSize: 37,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 190,
              width: 380,
              padding: EdgeInsets.all(10),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                color: Colors.white38,
                elevation: 10,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ListTile(
                      leading: Icon(
                        Icons.local_movies_outlined,
                        size: 80,
                        color: Colors.black,
                      ),
                      title: Text(
                        'Entreterimento...',
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      onTap: () {
                        Navigator.popAndPushNamed(context, 'entreterimento');
                      },
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: 190,
              width: 380,
              padding: EdgeInsets.all(10),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                color: Colors.white38,
                elevation: 10,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ListTile(
                      leading: Icon(
                        Icons.self_improvement_outlined,
                        size: 80,
                        color: Colors.black,
                      ),
                      title: Text(
                        'Gurus...',
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      onTap: () {
                        Navigator.popAndPushNamed(context, 'gurus');
                      },
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: 190,
              width: 380,
              padding: EdgeInsets.all(10),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                color: Colors.white38,
                elevation: 10,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ListTile(
                      leading: Icon(
                        Icons.emoji_objects_outlined,
                        size: 80,
                        color: Colors.black,
                      ),
                      title: Text(
                        'Contemporâneos..',
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      onTap: () {
                        Navigator.popAndPushNamed(context, 'pensadores');
                      },
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: 190,
              width: 380,
              padding: EdgeInsets.all(10),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                color: Colors.white38,
                elevation: 10,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ListTile(
                      leading: Icon(
                        Icons.textsms_outlined,
                        size: 80,
                        color: Colors.black,
                      ),
                      title: Text(
                        'Frase do dia...',
                        style: TextStyle(
                          fontSize: 55,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      onTap: () {
                        Navigator.popAndPushNamed(context, 'fraseDia');
                      },
                    )
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

class entreterimento extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              'Entreterimento',
              style: TextStyle(
                color: Colors.white,
                fontSize: 33,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        automaticallyImplyLeading: false,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.popAndPushNamed(context, 'homepage'),
        ),
        backgroundColor: Colors.black,
      ),
      drawer: Drawer(
        child: menu(),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('asset/images/mensages.png'),
              fit: BoxFit.cover),
        ),
        child: entreterimentoContent(),
      ),
    );
  }
}

class entreterimentoContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
          child: Column(
        children: [
          Padding(padding: EdgeInsets.all(5)),
          Container(
            height: 300,
            width: 375,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('asset/images/film.jpeg'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
          Padding(padding: EdgeInsets.all(10)),
          Container(
            height: 80,
            width: 380,
            padding: EdgeInsets.all(10),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              color: Colors.white38,
              elevation: 10,
              child: Center(
                  child: Text(
                'Abaixo você encontra as 10 melhores frases de filmes de todos os tempos!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              )),
            ),
          ),
          Padding(padding: EdgeInsets.all(8)),
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: Colors.white38,
            elevation: 10,
            child: Center(
                child: Text(
              '"Que a força esteja com você" \n- Star Wars (1997)',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
              ),
            )),
          ),
          Padding(padding: EdgeInsets.all(3)),
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: Colors.white38,
            elevation: 10,
            child: Center(
                child: Text(
              '“Não há lugar como nosso lar.” \n– O Mágico de Oz (1939)',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
              ),
            )),
          ),
          Padding(padding: EdgeInsets.all(3)),
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: Colors.white38,
            elevation: 10,
            child: Center(
                child: Text(
              '“Carpe diem. Aproveitem o dia, rapazes. Tornem suas vidas extraordinárias.” \n– Sociedade dos Poetas Mortos (1989)',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
              ),
            )),
          ),
          Padding(padding: EdgeInsets.all(3)),
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: Colors.white38,
            elevation: 10,
            child: Center(
                child: Text(
              '“Elementar, meu caro Watson.” \n– As Aventuras de Sherlock Holmes (1939)',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
              ),
            )),
          ),
          Padding(padding: EdgeInsets.all(3)),
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: Colors.white38,
            elevation: 10,
            child: Center(
                child: Text(
              '“Eu sou o rei do mundo!” \n– Titanic (1997)',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
              ),
            )),
          ),
          Padding(padding: EdgeInsets.all(3)),
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: Colors.white38,
            elevation: 10,
            child: Center(
                child: Text(
              '“E.T., telefone, minha casa.” \n– E.T. – O Extraterrestre (1982)',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
              ),
            )),
          ),
          Padding(padding: EdgeInsets.all(3)),
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: Colors.white38,
            elevation: 10,
            child: Center(
                child: Text(
              '“Ao infinito e além!” \n– Toy Story (1995)',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
              ),
            )),
          ),
          Padding(padding: EdgeInsets.all(3)),
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: Colors.white38,
            elevation: 10,
            child: Center(
                child: Text(
              '“Ou você morre herói, ou vive o suficiente para se tornar o vilão.” \n– Batman: O Cavaleiro das Trevas (2008)',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
              ),
            )),
          ),
          Padding(padding: EdgeInsets.all(3)),
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: Colors.white38,
            elevation: 10,
            child: Center(
                child: Text(
              '“Houston, temos um problema.” \n– Apollo 13 (1995)',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
              ),
            )),
          ),
          Padding(padding: EdgeInsets.all(3)),
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: Colors.white38,
            elevation: 10,
            child: Center(
                child: Text(
              '“I’ll be Back.” (Eu Voltarei) \n– O Exterminador do Futuro (1984)',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
              ),
            )),
          ),
          Padding(padding: EdgeInsets.all(20)),
        ],
      )),
    );
  }
}

//Página do Guru
class gurus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              'Gurus',
              style: TextStyle(
                color: Colors.white,
                fontSize: 33,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        automaticallyImplyLeading: false,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.popAndPushNamed(context, 'homepage'),
        ),
        backgroundColor: Colors.black,
      ),
      drawer: Drawer(
        child: menu(),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('asset/images/mensages.png'),
              fit: BoxFit.cover),
        ),
        child: guruContent(),
      ),
    );
  }
}

class guruContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(5)),
            Container(
              height: 300,
              width: 375,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('asset/images/steve_jobs.jpeg'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
            Padding(padding: EdgeInsets.all(10)),
            Container(
              height: 80,
              width: 380,
              padding: EdgeInsets.all(10),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                color: Colors.white38,
                elevation: 10,
                child: Center(
                    child: Text(
                  'Abaixo você encontra as 10 melhores frases de gurus de todos os tempos!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                )),
              ),
            ),
            Padding(padding: EdgeInsets.all(8)),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: Colors.white38,
              elevation: 10,
              child: Center(
                  child: Text(
                '"Seja um parâmetro de qualidade. Algumas pessoas não estão acostumadas a um ambiente onde a excelência é esperada.” \n– Steve Jobs',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),
              )),
            ),
            Padding(padding: EdgeInsets.all(3)),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: Colors.white38,
              elevation: 10,
              child: Center(
                  child: Text(
                '“A chave do sucesso nos negócios é perceber para onde o mundo se dirige e chegar lá primeiro”. \n– Bill Gates',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),
              )),
            ),
            Padding(padding: EdgeInsets.all(3)),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: Colors.white38,
              elevation: 10,
              child: Center(
                  child: Text(
                '“Nada vai dar certo a não ser que você faça” \n– Maya Angelou',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),
              )),
            ),
            Padding(padding: EdgeInsets.all(3)),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: Colors.white38,
              elevation: 10,
              child: Center(
                  child: Text(
                '“O poder não vem do conhecimento monopolizado, mas sim do conhecimento compartilhado.” \n– Bill Gates',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),
              )),
            ),
            Padding(padding: EdgeInsets.all(3)),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: Colors.white38,
              elevation: 10,
              child: Center(
                  child: Text(
                '“Entre estímulo e resposta há um espaço. Nesse espaço está nosso poder de escolher nossa resposta. E é nela que reside o crescimento e nossa liberdade” \n– Viktor Frankl',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),
              )),
            ),
            Padding(padding: EdgeInsets.all(3)),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: Colors.white38,
              elevation: 10,
              child: Center(
                  child: Text(
                '“Encante sua audiência com um conteúdo que proporcione experiências.” \n– Robert Rose',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),
              )),
            ),
            Padding(padding: EdgeInsets.all(3)),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: Colors.white38,
              elevation: 10,
              child: Center(
                  child: Text(
                '“Você precisa criar conteúdo que é ridiculamente bom – conteúdo que é útil, agradável e inspirador.” \n– Ann Handley',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),
              )),
            ),
            Padding(padding: EdgeInsets.all(3)),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: Colors.white38,
              elevation: 10,
              child: Center(
                  child: Text(
                '“A criatividade é a inteligência divertida.” \n– Albert Einstein',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),
              )),
            ),
            Padding(padding: EdgeInsets.all(3)),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: Colors.white38,
              elevation: 10,
              child: Center(
                  child: Text(
                '“A melhor maneira de prever o futuro é criá-lo.” \n– Peter Drucker',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),
              )),
            ),
            Padding(padding: EdgeInsets.all(3)),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: Colors.white38,
              elevation: 10,
              child: Center(
                  child: Text(
                '“A falha é simplesmente a oportunidade de começar novamente, desta vez de forma mais inteligente.” \n– Henry Ford',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),
              )),
            ),
            Padding(
              padding: EdgeInsets.all(20),
            ),
          ],
        ),
      ),
    );
  }
}

//Página de Pensadores Contemporâneos
class pensadores extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              'Pensadores Contemporâneos',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        automaticallyImplyLeading: false,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.popAndPushNamed(context, 'homepage'),
        ),
        backgroundColor: Colors.black,
      ),
      drawer: Drawer(
        child: menu(),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('asset/images/mensages.png'),
              fit: BoxFit.cover),
        ),
        child: pensadoresContent(),
      ),
    );
  }
}

// Pensadores contemporâneos conteúdo
class pensadoresContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(5)),
            Container(
              height: 480,
              width: 375,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('asset/images/pensador.jpeg'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
            Padding(padding: EdgeInsets.all(10)),
            Container(
              height: 94,
              width: 380,
              padding: EdgeInsets.all(10),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                color: Colors.white38,
                elevation: 10,
                child: Center(
                    child: Text(
                  'Abaixo você encontra as 10 melhores frases de pensadores contemporâneos de todos os tempos!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                )),
              ),
            ),
            Padding(padding: EdgeInsets.all(8)),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: Colors.white38,
              elevation: 10,
              child: Center(
                  child: Text(
                ' "A necessidade geral da arte é a necessidade racional que leva o homem a tomar consciência do mundo interior e exterior e a lazer um objeto no qual se reconheça a si próprio.” \n– Friedrich Hegel',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),
              )),
            ),
            Padding(padding: EdgeInsets.all(3)),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: Colors.white38,
              elevation: 10,
              child: Center(
                  child: Text(
                ' “A nossa felicidade depende mais do que temos nas nossas cabeças, do que nos nossos bolsos.”. \n– Arthur Schopenhauer',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),
              )),
            ),
            Padding(padding: EdgeInsets.all(3)),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: Colors.white38,
              elevation: 10,
              child: Center(
                  child: Text(
                '“Tudo é relativo, eis o único princípio absoluto.” \n– Auguste Comte',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),
              )),
            ),
            Padding(padding: EdgeInsets.all(3)),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: Colors.white38,
              elevation: 10,
              child: Center(
                  child: Text(
                ' “Os filósofos limitaram-se a interpretar o mundo de diversas maneiras; o que importa é modificá-lo.” \n– Karl Marx',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),
              )),
            ),
            Padding(padding: EdgeInsets.all(3)),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: Colors.white38,
              elevation: 10,
              child: Center(
                  child: Text(
                '“Tudo é precioso para aquele que foi, por muito tempo, privado de tudo.” \n– Friedrich Nietzsche',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),
              )),
            ),
            Padding(padding: EdgeInsets.all(3)),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: Colors.white38,
              elevation: 10,
              child: Center(
                  child: Text(
                '“Não fazemos aquilo que queremos e, no entanto, somos responsáveis por aquilo que somos.” \n– Jean Paul Sartre',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),
              )),
            ),
            Padding(padding: EdgeInsets.all(3)),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: Colors.white38,
              elevation: 10,
              child: Center(
                  child: Text(
                ' “O discurso não é simplesmente aquilo que traduz as lutas ou os sistemas de dominação, mas aquilo por que, pelo que se luta, o poder do qual nos queremos apoderar.” \n– Michel Foucault',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),
              )),
            ),
            Padding(padding: EdgeInsets.all(3)),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: Colors.white38,
              elevation: 10,
              child: Center(
                  child: Text(
                '“A criatividade é a inteligência divertida.” \n– Albert Einstein',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),
              )),
            ),
            Padding(padding: EdgeInsets.all(3)),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: Colors.white38,
              elevation: 10,
              child: Center(
                  child: Text(
                ' “O conhecimento é uma aventura em aberto. O que significa que aquilo que saberemos amanhã é algo que desconhecemos hoje; e esse algo pode mudar as verdades de ontem.” \n– Karl Popper',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),
              )),
            ),
            Padding(padding: EdgeInsets.all(3)),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: Colors.white38,
              elevation: 10,
              child: Center(
                  child: Text(
                ' “A queixa do indivíduo depressivo, "nada é possível", só pode ocorrer em uma sociedade que pensa que "nada é impossível".” \n– Byung-Chul Han',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),
              )),
            ),
            Padding(
              padding: EdgeInsets.all(20),
            ),
          ],
        ),
      ),
    );
  }
}

//Página de Frase do Dia
class fraseDia extends StatelessWidget {
  const fraseDia({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              'Frase do Dia',
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        automaticallyImplyLeading: false,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.popAndPushNamed(context, 'homepage'),
        ),
        backgroundColor: Colors.black,
      ),
      drawer: Drawer(
        child: menu(),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('asset/images/mensages.png'),
              fit: BoxFit.cover),
        ),
        child: const fraseDiaContent(),
      ),
    );
  }
}

class fraseDiaContent extends StatelessWidget {
  const fraseDiaContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
          ),
          Container(
            height: 400,
            width: 375,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('asset/images/regina_rouca.gif'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
          ),
          Container(
            height: 80,
            width: 380,
            padding: EdgeInsets.all(10),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              color: Colors.white38,
              elevation: 10,
              child: Center(
                  child: Text(
                '"Se liga hein!" \n- Regina Rouca',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              )),
            ),
          ),
          Container(
            height: 70,
            width: 260,
            padding: EdgeInsets.all(10),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              color: Colors.black,
              elevation: 10,
              child: Center(
                child:
                      Text('Conheça Regina Rouca',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

/*
Não consegui implementar o link externo no text: 'Conheça Regina Rouca'

_launchURL() async {
  const url = 'https://twitter.com/acervorouca?lang=en';
  // ignore: unrelated_type_equality_checks
  if (canLaunchUrl != true) {
    launchUrl;
  } else {
    throw 'Could not launch $url';
  }
}*/

//Página de logout
class logoff extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('asset/images/logout.png'), fit: BoxFit.cover),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Obrigado!',
                    style: TextStyle(
                      fontSize: 45,
                      color: Colors.lightGreen[100],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                  ),
                  Icon(
                    Icons.favorite_outlined,
                    size: 30,
                    color: Colors.white,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: TextButton(
          onPressed: () {
            Navigator.popAndPushNamed(context, '/');
          },
          child: Text(
            'Voltar ao login',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          style: TextButton.styleFrom(
            onSurface: Colors.white,
          ),
        ),
        elevation: 0,
      ),
    );
  }
}