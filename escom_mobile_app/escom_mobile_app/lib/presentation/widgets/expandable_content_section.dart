// expandable_content_section.dart
import 'package:flutter/material.dart';

class ExpandableContentSection extends StatefulWidget {
  final String title;
  final List<ContentItem> items;
  final bool isDarkMode;

  const ExpandableContentSection({
    Key? key,
    required this.title,
    required this.items,
    this.isDarkMode = false,
  }) : super(key: key);

  @override
  State<ExpandableContentSection> createState() => _ExpandableContentSectionState();
}

class _ExpandableContentSectionState extends State<ExpandableContentSection> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
              color: widget.isDarkMode ? Colors.grey[800] : Colors.grey[200],
              borderRadius: BorderRadius.circular(4),
            ),
            child: Row(
              children: [
                Icon(
                  _isExpanded ? Icons.remove_circle : Icons.add_circle,
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
          secondChild: Padding(
            padding: const EdgeInsets.only(left: 16, top: 8, bottom: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widget.items.map((item) => 
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: _buildContentItem(item),
                ),
              ).toList(),
            ),
          ),
          crossFadeState: _isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
          duration: const Duration(milliseconds: 300),
        ),
      ],
    );
  }

  Widget _buildContentItem(ContentItem item) {
    if (item.isLink && item.onTap != null) {
      return InkWell(
        onTap: item.onTap,
        child: Text(
          item.content,
          style: TextStyle(
            color: widget.isDarkMode ? Colors.blue[300] : Colors.blue[700],
            fontSize: 16,
          ),
        ),
      );
    } else {
      return Text(
        item.content,
        style: TextStyle(
          color: widget.isDarkMode ? Colors.white : Colors.black87,
          fontSize: 16,
        ),
      );
    }
  }
}

class ContentItem {
  final String content;
  final bool isLink;
  final VoidCallback? onTap;

  ContentItem({
    required this.content,
    this.isLink = false,
    this.onTap,
  });
}