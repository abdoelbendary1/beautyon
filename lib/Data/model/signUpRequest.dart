// ignore_for_file: public_member_api_docs, sort_constructors_first
class SignUpRequest {
  String? username;
  String? phone;
  String? email;
  String? pass;
  SignUpRequest({
    required this.email,
    required this.pass,
    required this.username,
    required this.phone,
  });
}
