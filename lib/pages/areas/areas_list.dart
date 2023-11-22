import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:your_body_lab_flutter/models/area.model.dart';
import 'package:your_body_lab_flutter/models/paginated_response.model.dart';
import 'package:your_body_lab_flutter/pages/home/parts/areas_section/area_card.dart';
import 'package:your_body_lab_flutter/services/color.service.dart';
import 'package:your_body_lab_flutter/services/home_page.service.dart';

class AreasPage extends StatefulWidget {
  const AreasPage({super.key});

  @override
  State<AreasPage> createState() => _AreasPageState();
}

class _AreasPageState extends State<AreasPage> {
  late Future<PaginatedResponse<Area>> areas;

  @override
  void initState() {
    super.initState();
    areas = getAreas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Aree"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
          future: areas,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: 6,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: GestureDetector(
                    onTap: () => {
                      context.go('/areas/${snapshot.data!.docs[index].title}')
                    },
                    child: AreaCard(
                      title: snapshot.data!.docs[index].title,
                      color: getColorFromHex(snapshot.data!.docs[index].color),
                      icon: snapshot.data!.docs[index].icon,
                    ),
                  ),
                ),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
