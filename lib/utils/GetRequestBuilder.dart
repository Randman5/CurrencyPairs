
class GetRequestBuilder {
  Map<String,String> parametrs = <String,String>{};
  final String url;

  GetRequestBuilder(this.url);

  GetRequestBuilder addParam(String key, String value){
    parametrs.addAll({key:value});
    return this;
  }

  Uri Build(){
    StringBuffer stringBuffer = StringBuffer();
    stringBuffer.write(url);
    if (parametrs.isNotEmpty){
      stringBuffer.write('?');
      for(var param in parametrs.entries) {
        stringBuffer.write("${param.key}=${param.value}&");
      }
    }
    var resUrl = stringBuffer.toString();
    return Uri.parse(resUrl);
  }

}