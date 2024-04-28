import 'package:flutter/material.dart';

class PitchTypeLabelListView extends StatefulWidget {
  const PitchTypeLabelListView({Key? key, this.onLabelSelected}) : super(key: key);

  final Function(String)? onLabelSelected;

  @override
  _PitchTypeLabelListViewState createState() => _PitchTypeLabelListViewState();
}

class _PitchTypeLabelListViewState extends State<PitchTypeLabelListView> {
  String? selectedLabel;

  List<String> labels = ["Football", "Tennis", "Paddle", "Squash", "Ping Pong"];

  @override
  void initState() {
    super.initState();
    selectedLabel = "Football"; // Set "Football" as the default selected label
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.09,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: labels.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final label = labels[index];
          final isSelected = label == selectedLabel;
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedLabel = label; // Update selected label
              });
              if (widget.onLabelSelected != null) {
                widget.onLabelSelected!(label); // Notify parent widget of label selection
              }
            },
            child: Container(

              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              margin: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(

                color: isSelected ? Colors.green : Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  label,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
