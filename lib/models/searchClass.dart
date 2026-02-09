class SearchClass {
  String nom;
  String prenom;
  int age;

  String get fullName => "$nom $prenom";
  String get initial => nom[0].toUpperCase();

  SearchClass({required this.nom, required this.prenom, required this.age});
}