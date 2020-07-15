mainApi({String url, String params = ''}) {
  final authKey = 'So1DSBKffnbTKwdgIIcetg2z3GyNKeQi';
  final urlString = 'https://apps.uerm.edu.ph:3443/$url?auth=$authKey$params';
  //final urlString = 'http://10.107.0.10:3000/$url?auth=$authKey$params';
  print(urlString);
  return urlString;
}
