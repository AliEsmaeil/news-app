class TextFormStatusHandler{

  const TextFormStatusHandler();
  String?Function(String?) getValidatorFunction({required String errorMessage}){

    String? validate(String? str){
      if(str!.isEmpty){
        return errorMessage;
      }
      return null;
    }
    return validate;
  }

}