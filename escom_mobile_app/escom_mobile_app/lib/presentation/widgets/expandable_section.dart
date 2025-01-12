// expandable_section.dart
import 'package:flutter/material.dart';

class ExpandableSection extends StatefulWidget {
  final String title;
  final List<LinkItem> items;
  final bool isDarkMode;

  const ExpandableSection({
    Key? key,
    required this.title,
    required this.items,
    this.isDarkMode = false,
  }) : super(key: key);

  @override
  State<ExpandableSection> createState() => _ExpandableSectionState();
}

class _ExpandableSectionState extends State<ExpandableSection> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              // Cambiamos el color según el modo oscuro/claro
              color: widget.isDarkMode ? Colors.grey[800] : Colors.grey[200],
              borderRadius: BorderRadius.circular(4),
            ),
            child: Row(
              children: [
                Icon(
                  _isExpanded ? Icons.remove_circle : Icons.add_circle,
                  // Ajustamos el color del ícono para mejor contraste
                  color: widget.isDarkMode ? Colors.grey[300] : Colors.grey[700],
                  size: 20,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    widget.title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: widget.isDarkMode ? Colors.white : Colors.black87,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        AnimatedCrossFade(
          firstChild: Container(),
          secondChild: Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widget.items.map((item) => 
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: InkWell(
                    onTap: () => item.onTap?.call(),
                    child: Text(
                      item.title,
                      style: TextStyle(
                        // Ajustamos el color del link para mejor contraste en modo oscuro
                        color: widget.isDarkMode ? Colors.blue[300] : Colors.blue[700],
                        fontSize: 16,
                      ),
                    ),
                  ),
                )
              ).toList(),
            ),
          ),
          crossFadeState: _isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
          duration: const Duration(milliseconds: 300),
        ),
      ],
    );
  }
}

class LinkItem {
  final String title;
  final VoidCallback? onTap;

  LinkItem({required this.title, this.onTap});
}