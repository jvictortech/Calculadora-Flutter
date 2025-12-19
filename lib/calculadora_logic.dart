class CalculadoraLogic {
  String visor = '0';

  double _primeiroNumero = 0;
  String _operador = '';

  void pressionar(String valor) {
    // Limpa tudo
    if (valor == 'C') {
      visor = '0';
      _primeiroNumero = 0;
      _operador = '';
      return;
    }

    // Apaga último caractere
    if (valor == 'DEL') {
      visor = visor.length > 1 ? visor.substring(0, visor.length - 1) : '0';
      return;
    }

    // Operadores
    if (['+', '-', '*', '/', '%'].contains(valor)) {
      _primeiroNumero = double.parse(visor);
      _operador = valor;
      visor = '0';
      return;
    }

    // Igual
    if (valor == '=') {
      double segundoNumero = double.parse(visor);
      double resultado = 0;

      switch (_operador) {
        case '+':
          resultado = _primeiroNumero + segundoNumero;
          break;
        case '-':
          resultado = _primeiroNumero - segundoNumero;
          break;
        case '*':
          resultado = _primeiroNumero * segundoNumero;
          break;
        case '/':
          resultado =
              segundoNumero == 0 ? 0 : _primeiroNumero / segundoNumero;
          break;
        case '%':
          resultado = _primeiroNumero * (segundoNumero / 100);
          break;
      }

      visor = resultado.toString();
      _operador = '';
      return;
    }

    // Números e ponto
    if (visor == '0') {
      visor = valor;
    } else {
      visor += valor;
    }
  }
}
