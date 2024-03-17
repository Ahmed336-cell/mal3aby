import 'package:flutter/material.dart';
class DropDownButtonAuth extends StatefulWidget {
  const DropDownButtonAuth({super.key, required this.list, required this.onChanged, required this.icon});
  final List<String> list ;
  final ValueChanged<String>?onChanged;
  final Icon icon;

  @override
  State<DropDownButtonAuth> createState() => _DropDownButtonAuthState();
}

class _DropDownButtonAuthState extends State<DropDownButtonAuth> {
  late String dropdownValue ;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none
            ),
            fillColor: Colors.black,
            filled: true,
            prefixIcon:  widget.icon

        ),

        value: widget.list.first,
        icon: const Icon(Icons.swipe_down_alt_rounded , color: Colors.white,),
        elevation: 16,
        style: const TextStyle(color: Colors.white),

        items: widget.list.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (String ? value){
          setState(() {
            dropdownValue=value!;

          });

          widget.onChanged!(dropdownValue);

        }

    );
  }
}