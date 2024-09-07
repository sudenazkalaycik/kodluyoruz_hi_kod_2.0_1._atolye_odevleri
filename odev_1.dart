void main()  {

  print ("Hi Kod");

  String name = "Sudenaz";
  int age = 18;
  double height = 164.5;
  bool isStudent = true;


  print("Name: $name");
  print("Age: $age") ;
  print("Height $height cm");
  if (isStudent) {
    print("I am a student");
  }
  
  int a = 10;
  int b = 5;
  int c = 3;
    
  int sum = a + b;
  int difference = a-b;
  int product = a*b;
  double quotient = a/b;
    
    
  
  print("Sum: $sum");
  print("Difference: $difference");
  print("Product: $product") ;
  print("Quotient: $quotient") ;
  
double result = ((a-b)*c)/(a+b)*(a*b*c);
  print("Sonuç; $result");
  
   
 {
  int charge = 142;

  if (charge == 100) {
    print("Telefon şarj edildi");
  } else if (charge < 20 && charge >= 10) {
    print("Telefonunuzu şarj edin");
  } else if (charge < 10) {
    print("Kritik batarya seviyesi");
  } else {
    print("Telefon uzaydan geldi herhalde!");
  }
}
  
  
  
   String name = "Sudenaz";
  int age = 18;
  double height = 164.5;
  String favoriteColor = "mor";

  print(generateMessage(name, age, height, favoriteColor));
}

String generateMessage(String name, int age, double height, String favoriteColor) {
  return "Merhaba, ben $name, $age yaşındayım. Boyum $height ve en sevdiğim renk $favoriteColor";
}