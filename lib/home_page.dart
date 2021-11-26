import 'package:contact_application/contact_view.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'contact_model.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final List<Map<String, String>> data = [
    {
      "name": "Efya Ibra",
      "phone": "+233553909518",
      "email": "marzukatuibrahim18@gmail.com",
      "country": "Ghana",
      "region": "Koforidua"
    },
    {
      "name": "Marazaka ibra",
      "phone": "+233547464624",
      "email": "zukatu0@gmail.com",
      "country": "Ghana",
      "region": "Tutu"
    },
    {
      "name": "Efya Ibra",
      "phone": "+233543909518",
      "email": "tarkwa24@gmail.com",
      "country": "Ghana",
      "region": "Tarkwa"
    },
    {
      "name": "Zukatu ",
      "phone": "+233230909518",
      "email": "marzukatu18@gmail.com",
      "country": "Ghana",
      "region": "Tamale"
    },
    {
      "name": "Efya Zuka",
      "phone": "+233553909518",
      "email": "myfirstday0@gmail.com",
      "country": "Ghana",
      "region": "Kasoa"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            centerTitle: false,
            title: const Text('My Contact',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25.0,
                    fontWeight: FontWeight.w600)),
            actions: const [
              Padding(
                padding: EdgeInsets.only(right: 15),
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/maa.jpg'),
                  radius: 30.0,
                ),
              )
            ],
            bottom: PreferredSize(
                preferredSize: Size.fromHeight(90),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: 'search by name or number',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                ))),
        body: SafeArea(
          child: ListView(
            shrinkWrap: true,
            children: [
              const Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Text(
                    'Recent',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
                  )),
              ListView.separated(
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return ContactView(
                              contact: Contact(
                            name: "Ibrahim Marzukatu",
                            phone: "+233553909518",
                            email: "marzukatuibrahim18@gmail.com",
                            country: "Ghana",
                            region: "Koforidua",
                          ));
                        },
                      ));
                    },
                    leading: const CircleAvatar(
                      backgroundImage: AssetImage('assets/maa.jpg'),
                    ),
                    title: const Text(
                      'Nana Kwasi',
                      style: TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.w600),
                    ),
                    subtitle: const Text('+233 54 151 9532'),
                    trailing: const Icon(
                      Icons.more_horiz,
                      size: 20,
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider();
                },
                itemCount: 3,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text(
                  'Contact',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
              GroupedListView<Map<String, String>, String>(
                elements: data,
                groupBy: (element) =>
                    element['name'].toString().substring(0, 1),
                groupSeparatorBuilder: (String groupByValue) => SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      groupByValue,
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                itemBuilder: (context, Map<String, String> element) {
                  Contact contact = Contact.fromJson(element);
                  return Column(
                    children: [
                      ListTile(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return ContactView(contact: contact);
                          }));
                        },
                        leading: const CircleAvatar(
                          backgroundImage: AssetImage('assets/image.png'),
                        ),
                        title: Text(
                          '${element["name"]}',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        subtitle: Text('${element["phone"]}'),
                      ),
                      const Divider(),
                    ],
                  );
                },
                itemComparator: (item1, item2) =>
                    item1['name']!.compareTo(item2['name']!),
                order: GroupedListOrder.ASC,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            size: 30,
          ),
          onPressed: () {},
          backgroundColor: Colors.black,
        ));
  }
}
