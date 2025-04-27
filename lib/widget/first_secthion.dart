import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FirstSecthion extends StatelessWidget {
  const FirstSecthion({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        spacing: 10,
        children: [
          Text(
            'Sort by',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),

          SvgPicture.asset('assets/svg/Frame 39639.svg'),
          Spacer(),
          SvgPicture.asset('assets/svg/lucide_settings-2.svg'),
          Text(
            'Filter',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SvgPicture.asset('assets/svg/ion_grid-outline.svg'),
          SvgPicture.asset('assets/svg/solar_users-group-rounded-outline.svg'),
        ],
      ),
    );
  }
}
