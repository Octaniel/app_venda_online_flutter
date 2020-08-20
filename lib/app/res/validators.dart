 bool emailValid(String email){
 if(email.contains("@")&&email.contains("."))
   return false;
 return true;
 }