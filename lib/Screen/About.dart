import 'package:flutter/material.dart';
import 'package:flutter_pdf_converter/Screen/FeedbackBord.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

class About extends StatefulWidget {
  final String description;
  const About({super.key, required String title, required this.description});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  List<Product> productList = [
    Product('assets/images/sisira.jpg', 'Sisira Kumara', 100,
        'I am a highly motivated Computer Science undergraduate seekingan internship that aligns with my academic knowledge  andpassion for technology. I am eager to apply my knowledge in aprofessional setting with backend development ,frontenddevelopment , project management, Quality assurance, Databasemanagement, software engineering and programming languagessuch as Java, PHP, Dart, HTML,CSS, and JavaScript. '),
    Product('assets/images/sonal.png', 'SS Gamage', 100,
        'I am a highly motivated Computer Science undergraduate seekingan internship that aligns with my academic knowledge  andpassion for technology. I am eager to apply my knowledge in aprofessional setting with backend development ,frontenddevelopment , project management, Quality assurance, Databasemanagement, software engineering and programming languagessuch as Java, PHP, Dart, HTML,CSS, and JavaScript. '),
    Product('assets/images/sisira.jpg', 'Sisira', 100, 'sd'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 252, 250, 251),
        centerTitle: true,
        title: const Text(
          'About Us',
          style: TextStyle(
              fontSize: 22,
              color: Color.fromARGB(255, 17, 18, 17),
              fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          style: ButtonStyle(
            iconSize: WidgetStateProperty.all<double>(30),
            iconColor: WidgetStateProperty.all<Color>(
                const Color.fromARGB(255, 68, 142, 211)),
            backgroundColor: WidgetStateProperty.all<Color>(
              const Color.fromARGB(255, 174, 220, 239),
            ),
          ),
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SizedBox(
        height: 730,
        child: ScrollSnapList(
          itemBuilder: _buildListItem,
          itemCount: productList.length,
          itemSize: 350,
          onItemFocus: (index) {},
          dynamicItemSize: true,
        ),
      ),
    );
  }

  Widget _buildListItem(BuildContext context, int index) {
    Product product = productList[index];
    return SizedBox(
      width: 350,
      height: 250,
      child: Card(
        elevation: 12,
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
                child: Image.asset(
                  product.imagePath,
                  fit: BoxFit.cover,
                  width: 230,
                  height: 270,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                product.title,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'BSc (Hons) in Computer Science',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        product.description,
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const FeedbackBord(
                                    title: '',
                                  )),
                        );
                      },
                      style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.blue,
                          disabledForegroundColor:
                              Colors.grey.withOpacity(0.38),
                          shadowColor: Colors.red,
                          elevation: 5,
                          textStyle: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                      child: const Text('Get in Touch'),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Product {
  final String imagePath;
  final String title;
  final double cost;
  final String description;

  Product(this.imagePath, this.title, this.cost, this.description);
}
