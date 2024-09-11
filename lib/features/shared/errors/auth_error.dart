class WorngCredentials implements Exception{}
class InvalidToken implements Exception{}
class ConectionTimeout implements Exception{
   final String message;

  ConectionTimeout({
    required this.message
    });

}


class CustomError implements Exception{
  final String message;
  // final int errorCode;

  CustomError({
    required this.message, 
    // required this.errorCode
  });

}