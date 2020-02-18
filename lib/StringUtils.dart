

class StringUtils{

  static String getUrlExtention(String url){
    int lastIndex = url.lastIndexOf(".");
    return url.substring(lastIndex-1);
  }
}