class Amount {
  // Since your example shows an empty object {}, this class is empty
  // Add properties here if the amounts object has any in other responses

  Amount();

  factory Amount.fromJson(Map<String, dynamic> json) {
    return Amount();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}
