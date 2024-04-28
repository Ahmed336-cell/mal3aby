import 'package:flutter/material.dart';
import 'package:mal3aby/core/common/custom_text_feild.dart';

class SearchContainer extends StatelessWidget {
  final Function(String) onSearch;
  final Function(String) onFilter;

  const SearchContainer({Key? key, required this.onSearch, required this.onFilter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.black,
      child: Row(
        children: [
          Expanded(
            child: CustomTextFeild(
              hint: 'Search by name', // Update hint text
              icon: const Icon(Icons.search),
              type: TextInputType.text,
              onChanged: (query) {
                onSearch(query!); // Invoke search callback with the entered query
              }, secure: false,
            ),
          ),
          const SizedBox(width: 8),
          PopupMenuButton<String>(
            icon: const Icon(Icons.filter_list, size: 28),
            onSelected: (government) {
              onFilter(government); // Invoke filter callback with the selected government
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'Giza',
                child: Text('Filter by Giza'),
              ),
              const PopupMenuItem<String>(
                value: 'Cairo',
                child: Text('Filter by Cairo'),
              ),
              const PopupMenuItem<String>(
                value: 'Alexandria',
                child: Text('Filter by Alexandria'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
