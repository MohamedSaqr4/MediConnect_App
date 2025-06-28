import 'package:booking_app/constants.dart';
import 'package:booking_app/features/patient/presentation/views/make_order_view.dart';
import 'package:flutter/material.dart';

class PharmacySearchView extends StatefulWidget {
  static String routeName = "PharmacySearchView";

  const PharmacySearchView({super.key});

  @override
  State<PharmacySearchView> createState() => _PharmacySearchViewState();
}

class _PharmacySearchViewState extends State<PharmacySearchView> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  bool _isOpenNow = false;

  final List<Map<String, dynamic>> allPharmacies = [
    {
      'name': 'El-Nile Pharmacy',
      'rating': 4.7,
      'location': 'Downtown Cairo',
      'address': '123 Tahrir Square, Downtown',
      'phone': '+20 123 456 7890',
      'image': 'assets/images/doctorr.png',
      'isOpen': true,
      'deliveryAvailable': true,
      'deliveryTime': '30-45 min',
      'workingHours': '24/7',
    },
    {
      'name': 'Health First Pharmacy',
      'rating': 4.5,
      'location': 'Heliopolis',
      'address': '456 Abbas El-Akkad St, Heliopolis',
      'phone': '+20 123 456 7891',
      'image': 'assets/images/images.jpg',
      'isOpen': true,
      'deliveryAvailable': true,
      'deliveryTime': '20-35 min',
      'workingHours': '8:00 AM - 12:00 AM',
    },
    {
      'name': 'Care Pharmacy',
      'rating': 4.8,
      'location': 'Maadi',
      'address': '789 Road 9, Maadi',
      'phone': '+20 123 456 7892',
      'image': 'assets/images/doctor3.png',
      'isOpen': false,
      'deliveryAvailable': false,
      'deliveryTime': 'N/A',
      'workingHours': '9:00 AM - 11:00 PM',
    },
    {
      'name': 'Medical Express',
      'rating': 4.6,
      'location': 'Zamalek',
      'address': '321 26th July St, Zamalek',
      'phone': '+20 123 456 7893',
      'image': 'assets/images/Hossam-Sakker-alhayani.jpg',
      'isOpen': true,
      'deliveryAvailable': true,
      'deliveryTime': '15-30 min',
      'workingHours': '24/7',
    },
    {
      'name': 'Pharma Plus',
      'rating': 4.4,
      'location': 'Nasr City',
      'address': '654 Abbas El-Akkad St, Nasr City',
      'phone': '+20 123 456 7894',
      'image': 'assets/images/doctorr.png',
      'isOpen': true,
      'deliveryAvailable': true,
      'deliveryTime': '25-40 min',
      'workingHours': '8:00 AM - 1:00 AM',
    },
    {
      'name': 'Quick Med Pharmacy',
      'rating': 4.9,
      'location': '6th October',
      'address': '987 El-Tahrir St, 6th October',
      'phone': '+20 123 456 7895',
      'image': 'assets/images/images.jpg',
      'isOpen': true,
      'deliveryAvailable': true,
      'deliveryTime': '10-20 min',
      'workingHours': '24/7',
    },
    {
      'name': 'City Pharmacy',
      'rating': 4.3,
      'location': 'New Cairo',
      'address': '147 90th St, New Cairo',
      'phone': '+20 123 456 7896',
      'image': 'assets/images/doctor3.png',
      'isOpen': false,
      'deliveryAvailable': true,
      'deliveryTime': '45-60 min',
      'workingHours': '9:00 AM - 10:00 PM',
    },
    {
      'name': 'Neighborhood Pharmacy',
      'rating': 4.7,
      'location': 'Shoubra',
      'address': '258 Shoubra St, Shoubra',
      'phone': '+20 123 456 7897',
      'image': 'assets/images/Hossam-Sakker-alhayani.jpg',
      'isOpen': true,
      'deliveryAvailable': false,
      'deliveryTime': 'N/A',
      'workingHours': '8:00 AM - 12:00 AM',
    },
  ];

  List<Map<String, dynamic>> get filteredPharmacies {
    return allPharmacies.where((pharmacy) {
      final nameQuery = _nameController.text.toLowerCase();
      final addressQuery = _addressController.text.toLowerCase();
      bool matchesName = nameQuery.isEmpty ||
          pharmacy['name'].toLowerCase().contains(nameQuery);
      bool matchesAddress = addressQuery.isEmpty ||
          pharmacy['address'].toLowerCase().contains(addressQuery);
      bool matchesOpenNow = !_isOpenNow || pharmacy['isOpen'];
      return matchesName && matchesAddress && matchesOpenNow;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Search Pharmacies'),
        backgroundColor: kPrimaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              // Search Bar Section
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    TextField(
                      controller: _nameController,
                      onChanged: (value) => setState(() {}),
                      decoration: InputDecoration(
                        hintText: 'Search by pharmacy name...',
                        prefixIcon: const Icon(Icons.local_pharmacy),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.grey.shade200,
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: _addressController,
                      onChanged: (value) => setState(() {}),
                      decoration: InputDecoration(
                        hintText: 'Search by address...',
                        prefixIcon: const Icon(Icons.location_on),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.grey.shade200,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                endIndent: 16,
                indent: 16,
                height: 2,
                color: Colors.grey,
              ),
              // Only Open Now Switch
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Switch(
                      value: _isOpenNow,
                      onChanged: (value) {
                        setState(() {
                          _isOpenNow = value;
                        });
                      },
                      activeColor: kPrimaryColor,
                    ),
                    const Text(
                      'Open Now',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
              // Results Count & Clear Filters
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${filteredPharmacies.length} pharmacies found',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54,
                      ),
                    ),
                    if (_nameController.text.isNotEmpty ||
                        _addressController.text.isNotEmpty ||
                        _isOpenNow)
                      TextButton(
                        onPressed: () {
                          setState(() {
                            _nameController.clear();
                            _addressController.clear();
                            _isOpenNow = false;
                          });
                        },
                        child: const Text('Clear Filters',
                            style: TextStyle(color: kPrimaryColor)),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              // Pharmacies List
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: filteredPharmacies.length,
                itemBuilder: (context, index) {
                  final pharmacy = filteredPharmacies[index];
                  return Card(
                    color: Colors.grey.shade100,
                    margin: const EdgeInsets.only(bottom: 12),
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: InkWell(
                      onTap: () {
                        // TODO: Navigate to pharmacy details page
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Opening ${pharmacy['name']}...'),
                            duration: const Duration(seconds: 1),
                          ),
                        );
                      },
                      borderRadius: BorderRadius.circular(16),
                      child: Padding(
                        padding: const EdgeInsets.all(18),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                // Pharmacy Image
                                CircleAvatar(
                                  radius: 32,
                                  backgroundImage:
                                      AssetImage(pharmacy['image']),
                                ),
                                const SizedBox(width: 18),
                                // Pharmacy Info
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              pharmacy['name'],
                                              style: const TextStyle(
                                                fontSize: 19,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 10,
                                              vertical: 5,
                                            ),
                                            decoration: BoxDecoration(
                                              color: pharmacy['isOpen']
                                                  ? Colors.green
                                                  : Colors.red,
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            child: Text(
                                              pharmacy['isOpen']
                                                  ? 'Open'
                                                  : 'Closed',
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 4),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.location_on,
                                            size: 16,
                                            color: Colors.grey,
                                          ),
                                          const SizedBox(width: 4),
                                          Expanded(
                                            child: Text(
                                              pharmacy['address'],
                                              style: const TextStyle(
                                                fontSize: 13,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 4),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.access_time,
                                            size: 16,
                                            color: Colors.grey.shade600,
                                          ),
                                          const SizedBox(width: 4),
                                          Text(
                                            pharmacy['workingHours'],
                                            style: const TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            // Address and Delivery Info
                            Row(
                              children: [
                                if (pharmacy['deliveryAvailable'])
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.orange.shade100,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          Icons.delivery_dining,
                                          size: 14,
                                          color: Colors.orange.shade700,
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          pharmacy['deliveryTime'],
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.orange.shade700,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                else
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade100,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: const Text(
                                      'No Delivery',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                const Spacer(),
                                ElevatedButton(
                                  onPressed: () {
                                    // Navigate to make order view
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => MakeOrderView(
                                          pharmacyName: pharmacy['name'],
                                          pharmacyImage: pharmacy['image'],
                                        ),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: kPrimaryColor,
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 8,
                                    ),
                                  ),
                                  child: const Text(
                                    'Make Order',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
              if (filteredPharmacies.isEmpty)
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.search_off,
                        size: 64,
                        color: Colors.grey,
                      ),
                      SizedBox(height: 16),
                      Text(
                        'No pharmacies found',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        'Try adjusting your search criteria',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _addressController.dispose();
    super.dispose();
  }
}

// Simple Pharmacy Chat View
class PharmacyChatView extends StatefulWidget {
  final String pharmacyName;
  final String pharmacyImage;

  const PharmacyChatView({
    Key? key,
    required this.pharmacyName,
    required this.pharmacyImage,
  }) : super(key: key);

  @override
  State<PharmacyChatView> createState() => _PharmacyChatViewState();
}

class _PharmacyChatViewState extends State<PharmacyChatView> {
  final TextEditingController _messageController = TextEditingController();
  final List<ChatMessage> _messages = [];
  bool _isTyping = false;

  @override
  void initState() {
    super.initState();
    // Add initial greeting message
    _messages.add(
      ChatMessage(
        message:
            "مرحباً! أنا ${widget.pharmacyName}. كيف يمكنني مساعدتك اليوم؟",
        isUser: false,
      ),
    );
  }

  void _handleSubmitted(String text) {
    if (text.trim().isEmpty) return;

    _messageController.clear();
    setState(() {
      _messages.add(ChatMessage(message: text, isUser: true));
      _isTyping = true;
    });

    // Simulate response after a short delay
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        setState(() {
          _isTyping = false;
          _messages.add(
            const ChatMessage(
              message:
                  "شكراً لك على رسالتك. سأقوم بمساعدتك قريباً. هل تحتاج معلومات عن الأدوية أو التوصيل؟",
              isUser: false,
            ),
          );
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage(widget.pharmacyImage),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.pharmacyName,
                  style: const TextStyle(fontSize: 16),
                ),
                const Text(
                  'Pharmacy',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ],
        ),
        backgroundColor: kPrimaryColor,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                child: ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: _messages.length + (_isTyping ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index == _messages.length) {
                      return const _TypingIndicator();
                    }
                    return _messages[index];
                  },
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, -1),
                ),
              ],
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: 'Type your message...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey[100],
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                    ),
                    onSubmitted: _handleSubmitted,
                  ),
                ),
                const SizedBox(width: 8),
                CircleAvatar(
                  backgroundColor: kPrimaryColor,
                  child: IconButton(
                    icon: const Icon(Icons.send, color: Colors.white),
                    onPressed: () => _handleSubmitted(_messageController.text),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String message;
  final bool isUser;

  const ChatMessage({
    Key? key,
    required this.message,
    required this.isUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment:
            isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isUser) ...[
            const CircleAvatar(
              radius: 16,
              backgroundImage: AssetImage('assets/images/doctorr.png'),
            ),
            const SizedBox(width: 8),
          ],
          Flexible(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: isUser ? kPrimaryColor : Colors.grey[200],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                message,
                style: TextStyle(
                  color: isUser ? Colors.white : Colors.black87,
                ),
              ),
            ),
          ),
          if (isUser) ...[
            const SizedBox(width: 8),
            const CircleAvatar(
              radius: 16,
              backgroundColor: Colors.grey,
              child: Icon(Icons.person, color: Colors.white),
            ),
          ],
        ],
      ),
    );
  }
}

class _TypingIndicator extends StatelessWidget {
  const _TypingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 16,
            backgroundImage: AssetImage('assets/images/doctorr.png'),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildDot(0),
                _buildDot(1),
                _buildDot(2),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDot(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: TweenAnimationBuilder<double>(
        tween: Tween(begin: 0.0, end: 1.0),
        duration: const Duration(milliseconds: 600),
        curve:
            Interval(index * 0.2, (index + 1) * 0.2, curve: Curves.easeInOut),
        builder: (context, value, child) {
          return Transform.translate(
            offset: Offset(0, -2 * value),
            child: Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: Colors.grey[600],
                shape: BoxShape.circle,
              ),
            ),
          );
        },
      ),
    );
  }
}
