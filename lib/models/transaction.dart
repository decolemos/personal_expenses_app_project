// ignore_for_file: public_member_api_docs, sort_constructors_first
class Transaction {
  String id;
  String title;
  double value;
  DateTime date; 
  
  Transaction({
    required this.id,
    required this.title,
    required this.value,
    required this.date,
  });

}
