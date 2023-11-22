import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:your_body_lab_flutter/components/skeleton.dart';
import 'package:your_body_lab_flutter/models/area.model.dart';
import 'package:your_body_lab_flutter/models/paginated_response.model.dart';
import 'package:your_body_lab_flutter/pages/home/parts/areas_section/area_card.dart';
import 'package:your_body_lab_flutter/pages/home/parts/areas_section/areas_header.dart';
import 'package:your_body_lab_flutter/services/color.service.dart';
import 'package:your_body_lab_flutter/services/home_page.service.dart';

class AreasHorizontalScroll extends StatefulWidget {
  const AreasHorizontalScroll({super.key});

  @override
  State<AreasHorizontalScroll> createState() => _AreasHorizontalScrollState();
}

class _AreasHorizontalScrollState extends State<AreasHorizontalScroll> {
  late Future<PaginatedResponse<Area>>? areas;

  @override
  void initState() {
    super.initState();
    areas = getAreas();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AreasHeader(),
        SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: FutureBuilder(
              future: areas,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: List.generate(
                        snapshot.data!.docs.length,
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
                              onTap: () => context.go(
                                  "/areas/${snapshot.data!.docs[index].title}"),
                              child: AreaCard(
                                title: snapshot.data!.docs[index].title,
                                color: getColorFromHex(
                                    snapshot.data!.docs[index].color),
                                icon: snapshot.data!.docs[index].icon,
                              ),
                            ))),
                  );
                } else {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: List.generate(
                        5,
                        (index) => Padding(
                            padding: index != 0
                                ? const EdgeInsets.all(8)
                                : const EdgeInsets.only(
                                    left: 0,
                                    right: 8,
                                    top: 8,
                                    bottom: 8,
                                  ),
                            child: const Skeleton(
                              height: 150,
                              width: 150,
                            ))),
                  );
                }
              },
            )),
      ],
    );
  }
}
