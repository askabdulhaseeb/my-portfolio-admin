import 'package:flutter/material.dart';

class CustomizeTextFormField extends StatefulWidget {
  final String? hint;
  final TextEditingController controller;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final bool? autoFocus;
  final bool? isPassword;
  const CustomizeTextFormField({
    Key? key,
    required this.hint,
    required this.controller,
    this.textInputAction = TextInputAction.next,
    this.keyboardType = TextInputType.text,
    this.autoFocus = false,
    this.isPassword = false,
  }) : super(key: key);

  @override
  _CustomizeTextFormFieldState createState() => _CustomizeTextFormFieldState();
}

class _CustomizeTextFormFieldState extends State<CustomizeTextFormField> {
  void _onListener() => setState(() {});
  @override
  void initState() {
    widget.controller.addListener(_onListener);
    super.initState();
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width:
            (MediaQuery.of(context).size.width > 500) ? 300 : double.infinity,
        margin: const EdgeInsets.all(6),
        child: TextFormField(
          controller: widget.controller,
          autofocus: widget.autoFocus!,
          obscureText: widget.isPassword!,
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          decoration: InputDecoration(
            hintText: widget.hint,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
            prefix: SizedBox(width: 10),
            suffixIcon: (widget.controller.text.isEmpty)
                ? SizedBox()
                : IconButton(
                    onPressed: () => widget.controller.clear(),
                    icon: const Icon(Icons.clear_sharp)),
          ),
        ),
      ),
    );
  }
}
