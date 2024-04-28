import 'package:flutter/material.dart';
class CustomTextFeild extends StatefulWidget {
  const CustomTextFeild({super.key, required this.hint, required this.secure, required this.icon, required this.type, this.validator, this.onChanged});
  final String hint;
  final bool secure;
  final Icon icon;
  final TextInputType type;
  final String? Function(String?)? validator;
  final String?Function(String?)?onChanged;

  @override
  State<CustomTextFeild> createState() => _CustomTextFeildState();
}

class _CustomTextFeildState extends State<CustomTextFeild> {
  late TextEditingController _controller;
  late FocusNode _focusNode;
  bool _isEmpty = true;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TextEditingController();
    _focusNode = FocusNode();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return  TextFormField(
      controller: _controller,
      focusNode: _focusNode,
      decoration: InputDecoration(
          errorStyle: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500
          ),
          hintText: widget.hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide(
              color: _isEmpty ? Colors.white : Colors.green,
            ),

          ),
          fillColor: Colors.black,
          filled: true,
          prefixIcon: widget.icon,

      ),
      keyboardType: widget.type,
      obscureText: widget.secure,
      validator: widget.validator,
      onChanged:(value){
        if(widget.type!=null){
          widget.onChanged!(value);
        }
      },
    );
  }
}