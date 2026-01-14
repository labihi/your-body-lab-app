import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:your_body_lab/components/error_message.dart';
import 'package:your_body_lab/models/area.model.dart';
import 'package:your_body_lab/models/paginated_response.model.dart';
import 'package:your_body_lab/pages/home/parts/areas_section/area_card.dart';
import 'package:your_body_lab/services/color.service.dart';
import 'package:your_body_lab/services/home_page.service.dart';

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
        padding: const EdgeInsets.all(10.0),
        child: RefreshIndicator(
          onRefresh: () async {
            setState(() {
              areas = getAreas();
            });
          },
          child: FutureBuilder(
            future: areas,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: GestureDetector(
                      onTap: () => {
                        context.go('/areas/${snapshot.data!.docs[index].title}')
                      },
                      child: AreaCard(
                        title: snapshot.data!.docs[index].title,
                        color:
                            getColorFromHex(snapshot.data!.docs[index].color),
                        icon: snapshot.data!.docs[index].icon,
                      ),
                    ),
                  ),
                );
              } else if (snapshot.hasError) {
                return SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  clipBehavior: Clip.none,
                  child: Center(
                    child: ErrorMessage(
                      snapshot.error.toString(),
                    ),
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
