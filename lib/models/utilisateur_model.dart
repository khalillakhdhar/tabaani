class UtilisateurModel {
  late final String? id;
  final String nom;
  final String prenom;
  final String email;
  final String mdp;
  final String role;
  UtilisateurModel(
      {this.id,
      required this.nom,
      required this.prenom,
      required this.email,
      required this.mdp,
      required this.role});
  // factory
  factory UtilisateurModel.fromJson(Map<String, dynamic> json) {
    return UtilisateurModel(
        id: json['id'],
        nom: json['nom'],
        prenom: json['prenom'],
        email: json['email'],
        mdp: json['mdp'],
        role: json['role']);
  }
  // Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nom': nom,
      'prenom': prenom,
      'email': email,
      'mdp': mdp,
      'role': role
    };
  }
}
