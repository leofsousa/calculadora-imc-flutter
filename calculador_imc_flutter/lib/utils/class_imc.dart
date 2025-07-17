String classificarIMC(double resultado) {
  if (resultado < 16) {
    return "Magreza Grave";
  } else if (resultado < 17) {
    return "Magreza moderada";
  } else if (resultado < 18.5) {
    return "Magreza Leve";
  } else if (resultado < 25) {
    return "Peso ideal";
  } else if (resultado < 30) {
    return "Sobrepeso";
  } else if (resultado < 35) {
    return "Obesidade grau 1";
  } else if (resultado < 40) {
    return "Obesidade grau 2"; }
    else {
    return "Obesidade grau 3";
  }
}
