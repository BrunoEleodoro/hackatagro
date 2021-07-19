import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hackatagro/pages/add_historico/add_historico_provider.dart';
import 'package:hackatagro/services/app/app_loading.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:provider/provider.dart';

class AddHistoricoPage extends StatefulWidget {
  @override
  _AddHistoricoPageState createState() => _AddHistoricoPageState();
}

class _AddHistoricoPageState extends State<AddHistoricoPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(BuildContext context) async {
    AppLoading.show(context);
    context
        .read<AddHistoricoProvider>()
        .cadastrarBlockchain("Titulo acao", "mudanca na horta");
    await Future.delayed(Duration(seconds: 4));
    AppLoading.hide(context);
    Navigator.pop(context);
  }

  Widget _buildFullscrenImage() {
    return Image.asset(
      'assets/fullscreen.jpg',
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
    );
  }

  Widget _buildImage(String assetName, [double width = 350]) {
    return Container(width: width, height: 60);
    // return Image.asset('assets/$assetName', width: width);
  }

/**
  1- Nome da cultura
Nesta etapa voce vai nos dizer o que esta cultivando....

2-Data de inicio do plantio
Aqui voce nos informa quando foi realizado o plantio das sementes...

3-Qual a sua localidade?

4- qual o seu cnpj?

5- Qual o preço da sua colheita?

6- Qual o modelo de venda da sua colheita 
- antecipada 
Venda no spot. Colheu, vendeu.
- Arcar com custos de armazenagem para definir timing da venda
- Definir preço para venda quando da colheita
-Troca de produto por insumos, operação conhecida como barter

7- Qual o número do CAR da sua colheita
 */
  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);
    var data = [
      {
        'title': 'Nome da cultura',
        'description':
            'Nesta etapa voce vai nos dizer o que esta cultivando....',
        'img': Image.network(
            'https://image.freepik.com/free-vector/happy-freelancer-with-computer-home-young-man-sitting-armchair-using-laptop-chatting-online-smiling-vector-illustration-distance-work-online-learning-freelance_74855-8401.jpg')
      },
      {
        'title': 'Data de inicio do plantio',
        'description':
            'Aqui voce nos informa quando foi realizado o plantio das sementes...',
        'img': Image.network(
            'https://image.freepik.com/free-vector/webinar-concept-illustration_114360-4764.jpg')
      },
      {
        'title': 'Qual a sua localidade',
        'description': '',
        'img': Image.network(
            'https://image.freepik.com/free-vector/current-location-concept-illustration_114360-4406.jpg')
      },
      {
        'title': 'Qual o seu cnpj',
        'description': '',
        'img': Image.network(
            'https://image.freepik.com/free-vector/instant-information-concept-illustration_114360-5264.jpg')
      },
      {
        'title': 'Qual o preço da sua colheita?',
        'description': '',
        'img': Image.network(
            'https://image.freepik.com/free-vector/cut-price-bargain-offering-reduced-cost-discount-low-rate-special-promo-scissors-dividing-banknote-crisis-bankruptcy-cheapness-market-vector-isolated-concept-metaphor-illustration_335657-4314.jpg')
      },
      {
        'title': 'Qual o modelo de venda da sua colheita ',
        'description': '',
        'img': Image.network(
            'https://image.freepik.com/free-vector/smm-internet-promotion-online-advertisement-announcement-market-research-sales-growth-marketer-with-laptop-loudspeaker-cartoon-character-vector-isolated-concept-metaphor-illustration_335657-2849.jpg')
      },
    ];
    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      globalHeader: Align(
        alignment: Alignment.topRight,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 16, right: 16),
            child: _buildImage('flutter.png', 100),
          ),
        ),
      ),

      pages: data.map((item) {
        return PageViewModel(
            title: item["title"].toString(),
            image: item["img"] as Widget,
            decoration: pageDecoration,
            bodyWidget: TextFormField(
                decoration: InputDecoration(
              border: OutlineInputBorder(),
            )));
      }).toList(),
      onDone: () {
        _onIntroEnd(context);
      },
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      //rtl: true, // Display as right-to-left
      skip: const Text(''),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Finalizar',
          style: TextStyle(fontWeight: FontWeight.w600)),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        color: Colors.black87,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}
