String tollName = 'pes';
String account = "0x90F8bf6A479f320ead074411a4B0e7944Ea8c9C1";
String amount = "10";
String multipleAmount = "20";
String tollPayUrl =
    'http://192.168.137.128:3000/payToll?t=${tollName}&account=$account&amt=$amount';
String tollPayMultiple =
    'http://192.168.137.128:3000/payToll?t=${tollName}&account=$account&amt=$multipleAmount';
String getBalanceUrl =
    'http://192.168.137.128:3000/viewBalance?balance=$account';

String falsePay = 'http://192.168.137.128:3000/falsePay?account=$account';

String getPayStatus =
    'http://192.168.137.128:3000/getPayStatus?account=$account';

// String setReward = 'http://192.168.137.128:3000/setReward?account=$account';
