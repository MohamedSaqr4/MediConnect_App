import 'package:flutter/material.dart';
import 'package:booking_app/constants.dart';
import 'package:booking_app/features/pharmacist/data/models/order_model.dart';

class PharmacyHomeView extends StatefulWidget {
  const PharmacyHomeView({Key? key}) : super(key: key);

  @override
  State<PharmacyHomeView> createState() => _PharmacyHomeViewState();
}

class _PharmacyHomeViewState extends State<PharmacyHomeView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<OrderData> allOrders = [
    OrderData(
      orderId: 'ORD-001',
      patientName: 'Ahmed Mohamed Ali',
      patientPhone: '+20 123 456 7890',
      patientAddress: '123 شارع التحرير، وسط البلد، القاهرة',
      prescription:
          'Paracetamol 500mg - 2 tablets 3 times daily\nAmoxicillin 500mg - 1 tablet twice daily\nVitamin C 1000mg - 1 tablet daily',
      orderDate: '2024-01-15',
      orderTime: '14:30',
      status: OrderStatus.pending,
      totalAmount: 0.0,
    ),
    OrderData(
      orderId: 'ORD-004',
      patientName: 'Sara Mahmoud Ibrahim',
      patientPhone: '+20 777 888 9999',
      patientAddress: '321 شارع السادس من أكتوبر، المعادي، القاهرة',
      prescription:
          'Blood Pressure Medication:\nAmlodipine 5mg - 1 tablet daily\nLosartan 50mg - 1 tablet daily',
      orderDate: '2024-01-15',
      orderTime: '17:10',
      status: OrderStatus.completed,
      totalAmount: 180.0,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<OrderData> get ordersPending =>
      allOrders.where((o) => o.status == OrderStatus.pending).toList();
  List<OrderData> get ordersCompleted =>
      allOrders.where((o) => o.status == OrderStatus.completed).toList();

  void _acceptOrder(OrderData order, TextEditingController priceController) {
    final price = double.tryParse(priceController.text);
    if (price != null && price > 0) {
      setState(() {
        order.setPrice(price);
        order.updateStatus(OrderStatus.completed);
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Order ${order.orderId} has been accepted')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid price first')),
      );
    }
  }

  void _rejectOrder(OrderData order) {
    setState(() {
      order.updateStatus(OrderStatus.rejected);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Order ${order.orderId} has been rejected')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildOrdersList(ordersPending),
                  _buildOrdersList(ordersCompleted),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const Row(
            children: [
              const Icon(Icons.local_pharmacy, color: kPrimaryColor, size: 28),
              const SizedBox(width: 12),
              const Text(
                'Nile Pharmacy',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: kPrimaryColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          TabBar(
            controller: _tabController,
            indicatorColor: kPrimaryColor,
            labelColor: kPrimaryColor,
            unselectedLabelColor: Colors.grey,
            tabs: const [
              Tab(icon: Icon(Icons.pending), text: 'Processing'),
              Tab(icon: Icon(Icons.done_all), text: 'Completed'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOrdersList(List<OrderData> orders) {
    if (orders.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.receipt_long, size: 64, color: Colors.grey.shade400),
            const SizedBox(height: 16),
            Text(
              'No orders available',
              style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: orders.length,
      itemBuilder: (context, index) {
        final order = orders[index];
        final priceController = TextEditingController(
          text: order.totalAmount > 0 ? order.totalAmount.toString() : '',
        );

        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            order.patientName,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            order.patientPhone,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: order.status == OrderStatus.completed
                            ? Colors.green.shade100
                            : Colors.orange.shade100,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        order.status == OrderStatus.completed
                            ? 'Completed'
                            : 'Processing',
                        style: TextStyle(
                          color: order.status == OrderStatus.completed
                              ? Colors.green.shade800
                              : Colors.orange.shade800,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  'Address:',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.shade700,
                  ),
                ),
                Text(
                  order.patientAddress,
                  style: const TextStyle(fontSize: 14),
                ),
                const SizedBox(height: 12),
                Text(
                  'Prescription:',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.shade700,
                  ),
                ),
                Text(
                  order.prescription,
                  style: const TextStyle(fontSize: 14),
                ),
                const SizedBox(height: 12),
                Text(
                  'Order Date: ${order.orderDate} - ${order.orderTime}',
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                if (order.status == OrderStatus.completed) ...[
                  const SizedBox(height: 8),
                  Text(
                    'Total: ${order.totalAmount.toStringAsFixed(0)} EGP',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: kPrimaryColor,
                      fontSize: 16,
                    ),
                  ),
                ],
                if (order.status == OrderStatus.pending) ...[
                  const SizedBox(height: 12),
                  Text(
                    'Price (EGP):',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: priceController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: 'Enter price',
                      border: OutlineInputBorder(),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => _acceptOrder(order, priceController),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            foregroundColor: Colors.white,
                          ),
                          child: const Text('Accept'),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => _rejectOrder(order),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                          ),
                          child: const Text('Reject'),
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}
