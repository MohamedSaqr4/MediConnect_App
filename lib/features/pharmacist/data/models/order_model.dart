enum OrderStatus { pending, accepted, rejected, completed }

class OrderData {
  final String orderId;
  final String patientName;
  final String patientPhone;
  final String patientAddress;
  final String prescription;
  final String orderDate;
  final String orderTime;
  OrderStatus status;
  double totalAmount;

  OrderData({
    required this.orderId,
    required this.patientName,
    required this.patientPhone,
    required this.patientAddress,
    required this.prescription,
    required this.orderDate,
    required this.orderTime,
    required this.status,
    required this.totalAmount,
  });

  void updateStatus(OrderStatus newStatus) {
    status = newStatus;
  }

  void setPrice(double price) {
    totalAmount = price;
  }
}
