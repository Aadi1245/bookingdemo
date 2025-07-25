import 'package:demoappfortest/utils/app_sizes.dart';
import 'package:flutter/material.dart';

class BoardingDroppingSelector extends StatefulWidget {
  final List<Map<String, dynamic>> onboardingPoints;
  final List<Map<String, dynamic>> droppingPoints;

  const BoardingDroppingSelector({
    Key? key,
    required this.onboardingPoints,
    required this.droppingPoints,
  }) : super(key: key);

  @override
  _BoardingDroppingSelectorState createState() =>
      _BoardingDroppingSelectorState();
}

class _BoardingDroppingSelectorState extends State<BoardingDroppingSelector> {
  bool _showBoardingList = false;
  bool _showDroppingList = false;
  late List<Map<String, dynamic>> _localOnboardingPoints;
  late List<Map<String, dynamic>> _localDroppingPoints;

  @override
  void initState() {
    super.initState();
    // Create local copies to manage state without modifying input lists
    _localOnboardingPoints = widget.onboardingPoints
        .map((point) => Map<String, dynamic>.from(point))
        .toList();
    _localDroppingPoints = widget.droppingPoints
        .map((point) => Map<String, dynamic>.from(point))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile =
        AppSizes.isPhone(context) || AppSizes.isSmallPhone(context);
    final padding = AppSizes.responsivePadding(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Search Bar Placeholder
        Container(
          padding: padding,
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search for Boarding Point',
              hintStyle: TextStyle(color: Colors.grey[500]),
              prefixIcon: Icon(Icons.search, color: Colors.grey[500]),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSizes.radiusMd),
                borderSide: BorderSide.none,
              ),
              contentPadding: EdgeInsets.symmetric(
                vertical: AppSizes.sm,
                horizontal: AppSizes.md,
              ),
            ),
          ),
        ),
        SizedBox(height: AppSizes.md),

        // Boarding Button
        Row(children: [
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _showBoardingList = !_showBoardingList;
                  _showDroppingList = false; // Close dropping list if open
                });
              },
              child: Container(
                padding: padding,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(AppSizes.radiusMd),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Boarding',
                      style: TextStyle(
                        fontSize: AppSizes.getResponsiveFontSize(
                            context, AppSizes.textXs),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          _getSelectedPointsText(_localOnboardingPoints),
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: AppSizes.getResponsiveFontSize(
                                context, AppSizes.textSm),
                          ),
                        ),
                        Icon(
                          _showBoardingList
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down,
                          color: Colors.grey[500],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (_showBoardingList)
            _buildPointList(_localOnboardingPoints, context, isMobile),

          SizedBox(height: AppSizes.xs),

          // Dropping Button
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _showDroppingList = !_showDroppingList;
                  _showBoardingList = false; // Close boarding list if open
                });
              },
              child: Container(
                padding: padding,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(AppSizes.radiusMd),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Dropping',
                      style: TextStyle(
                        fontSize: AppSizes.getResponsiveFontSize(
                            context, AppSizes.textXs),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          _getSelectedPointsText(_localDroppingPoints),
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: AppSizes.getResponsiveFontSize(
                                context, AppSizes.textSm),
                          ),
                        ),
                        Icon(
                          _showDroppingList
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down,
                          color: Colors.grey[500],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (_showDroppingList)
            _buildPointList(_localDroppingPoints, context, isMobile),
        ])
      ],
    );
  }

  String _getSelectedPointsText(List<Map<String, dynamic>> points) {
    final selectedPoints = points
        .where((point) => point['selected'] ?? false)
        .map((point) => point['name'])
        .join(', ');
    return selectedPoints.isEmpty
        ? 'Select a point'
        : (selectedPoints.length > 20
            ? '${selectedPoints.substring(0, 20)}...'
            : selectedPoints);
  }

  Widget _buildPointList(
      List<Map<String, dynamic>> points, BuildContext context, bool isMobile) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(AppSizes.radiusMd),
        ),
      ),
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: points.length,
        itemBuilder: (context, index) {
          final point = points[index];
          final isSelected = point['selected'] ?? false;
          return ListTile(
            contentPadding: EdgeInsets.symmetric(
              horizontal: AppSizes.responsivePadding(context).horizontal,
              vertical: AppSizes.sm,
            ),
            leading: Checkbox(
              value: isSelected,
              onChanged: (value) {
                setState(() {
                  point['selected'] = value;
                });
              },
              activeColor: Colors.blue[600],
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  point['name'],
                  style: TextStyle(
                    fontSize: AppSizes.getResponsiveFontSize(
                        context, AppSizes.textMd),
                    color: isSelected ? Colors.blue[600] : null,
                  ),
                ),
                Text(
                  point['time'],
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: AppSizes.getResponsiveFontSize(
                        context, AppSizes.textSm),
                  ),
                ),
              ],
            ),
            trailing: GestureDetector(
              onTap: () {
                // Placeholder for edit action (e.g., navigate to edit screen)
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EditPointScreen(point: point)),
                );
              },
              child: Text(
                'Edit',
                style: TextStyle(
                  color: Colors.blue[600],
                  fontSize:
                      AppSizes.getResponsiveFontSize(context, AppSizes.textSm),
                ),
              ),
            ),
            tileColor: isSelected ? Colors.grey[100] : null,
          );
        },
      ),
    );
  }
}

// Placeholder Edit Screen (implement as needed)
class EditPointScreen extends StatelessWidget {
  final Map<String, dynamic> point;

  const EditPointScreen({Key? key, required this.point}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit ${point['name']}')),
      body: Center(
          child: Text('Edit screen for ${point['name']} at ${point['time']}')),
    );
  }
}
