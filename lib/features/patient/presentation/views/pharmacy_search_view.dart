import 'package:booking_app/constants.dart';
import 'package:flutter/material.dart';

class PharmacySearchView extends StatefulWidget {
  static String routeName = "PharmacySearchView";

  const PharmacySearchView({super.key});

  @override
  State<PharmacySearchView> createState() => _PharmacySearchViewState();
}

class _PharmacySearchViewState extends State<PharmacySearchView> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedArea = 'All';
  String _selectedRating = 'All';
  bool _isOpenNow = false;

  final List<String> areas = [
    'All',
    'Downtown',
    'Heliopolis',
    'Maadi',
    'Zamalek',
    'Nasr City',
    '6th October',
    'New Cairo',
    'Shoubra',
    'Ain Shams',
  ];

  final List<String> ratings = ['All', '4.5+', '4.0+', '3.5+'];

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
      bool matchesSearch = pharmacy['name']
              .toLowerCase()
              .contains(_searchController.text.toLowerCase()) ||
          pharmacy['location']
              .toLowerCase()
              .contains(_searchController.text.toLowerCase()) ||
          pharmacy['address']
              .toLowerCase()
              .contains(_searchController.text.toLowerCase());

      bool matchesArea =
          _selectedArea == 'All' || pharmacy['location'] == _selectedArea;

      bool matchesRating = _selectedRating == 'All' ||
          pharmacy['rating'] >=
              double.parse(_selectedRating.replaceAll('+', ''));

      bool matchesOpenNow = !_isOpenNow || pharmacy['isOpen'];

      return matchesSearch && matchesArea && matchesRating && matchesOpenNow;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Pharmacies'),
        backgroundColor: Colors.orange.shade600,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Search Bar
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.orange.shade600,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: TextField(
              controller: _searchController,
              onChanged: (value) => setState(() {}),
              decoration: InputDecoration(
                hintText: 'Search pharmacies, locations, or addresses...',
                hintStyle: const TextStyle(color: Colors.white70),
                prefixIcon: const Icon(Icons.search, color: Colors.white70),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide.none,
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              ),
            ),
          ),

          // Filters
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // Area and Rating Filters
                Row(
                  children: [
                    // Area Filter
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: _selectedArea,
                            isExpanded: true,
                            items: areas.map((String area) {
                              return DropdownMenuItem<String>(
                                value: area,
                                child: Text(
                                  area,
                                  style: const TextStyle(fontSize: 14),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                _selectedArea = newValue!;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    // Rating Filter
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: _selectedRating,
                            isExpanded: true,
                            items: ratings.map((String rating) {
                              return DropdownMenuItem<String>(
                                value: rating,
                                child: Text(
                                  rating,
                                  style: const TextStyle(fontSize: 14),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                _selectedRating = newValue!;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                // Open Now Filter
                Row(
                  children: [
                    Checkbox(
                      value: _isOpenNow,
                      onChanged: (bool? value) {
                        setState(() {
                          _isOpenNow = value ?? false;
                        });
                      },
                      activeColor: Colors.orange.shade600,
                    ),
                    const Text(
                      'Open Now',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Results Count
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
                if (_searchController.text.isNotEmpty ||
                    _selectedArea != 'All' ||
                    _selectedRating != 'All' ||
                    _isOpenNow)
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _searchController.clear();
                        _selectedArea = 'All';
                        _selectedRating = 'All';
                        _isOpenNow = false;
                      });
                    },
                    child: const Text('Clear Filters'),
                  ),
              ],
            ),
          ),

          const SizedBox(height: 8),

          // Pharmacies List
          Expanded(
            child: filteredPharmacies.isEmpty
                ? const Center(
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
                  )
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: filteredPharmacies.length,
                    itemBuilder: (context, index) {
                      final pharmacy = filteredPharmacies[index];
                      return Card(
                        margin: const EdgeInsets.only(bottom: 12),
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
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
                          borderRadius: BorderRadius.circular(12),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    // Pharmacy Image
                                    CircleAvatar(
                                      radius: 30,
                                      backgroundImage:
                                          AssetImage(pharmacy['image']),
                                    ),
                                    const SizedBox(width: 16),
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
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 8,
                                                  vertical: 4,
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
                                                    fontWeight: FontWeight.w500,
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
                                                  pharmacy['location'],
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 4),
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.star,
                                                size: 16,
                                                color: Colors.amber,
                                              ),
                                              const SizedBox(width: 4),
                                              Text(
                                                pharmacy['rating'].toString(),
                                                style: const TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              const SizedBox(width: 16),
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
                                Text(
                                  pharmacy['address'],
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                                const SizedBox(height: 8),
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
                                          borderRadius:
                                              BorderRadius.circular(8),
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
                                          borderRadius:
                                              BorderRadius.circular(8),
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
                                    IconButton(
                                      onPressed: () {
                                        // TODO: Call pharmacy
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                                'Calling ${pharmacy['phone']}...'),
                                            duration:
                                                const Duration(seconds: 1),
                                          ),
                                        );
                                      },
                                      icon: const Icon(
                                        Icons.phone,
                                        color: kPrimaryColor,
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
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
