import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:your_body_lab/models/area.model.dart';
import 'package:your_body_lab/models/paginated_response.model.dart';
import 'package:your_body_lab/pages/home/parts/areas_section/area_card.dart';
import 'package:your_body_lab/pages/home/parts/areas_section/areas_header.dart';
import 'package:your_body_lab/services/color.service.dart';

class AreasHorizontalScroll extends StatelessWidget {
  final PaginatedResponse<Area> areas;
  const AreasHorizontalScroll({super.key, required this.areas});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const AreasHeader(),
      SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: List.generate(
                areas.docs.length,
                (index) => Padding(
                    padding: index != 0
                        ? const EdgeInsets.all(8)
                        : const EdgeInsets.only(
                            left: 0,
                            right: 8,
                            top: 8,
                            bottom: 8,
                          ),
                    child: GestureDetector(
                      onTap: () =>
                          context.go("/areas/${areas.docs[index].title}"),
                      child: AreaCard(
                        title: areas.docs[index].title,
                        color: getColorFromHex(areas.docs[index].color),
                        icon: areas.docs[index].icon,
                      ),
                    ))),
          ))
    ]);
  }
}
