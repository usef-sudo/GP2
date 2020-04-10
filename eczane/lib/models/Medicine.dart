
class Medicine{
  final String name;
  final String price;
  final String quantity;
  final String Exp;
  final String ID;
  final String profits;


  Medicine({this.name,this.price,this.Exp,this.ID,this.profits,this.quantity});

  Map<String, dynamic> toJson() =>
      {
        'name': name,
        'price': price,
        'quantity': quantity,
        'profits': profits,
        'Exp': Exp,
        'ID': ID,

      };



}