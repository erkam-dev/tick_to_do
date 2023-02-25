import 'package:flutter/material.dart';

class TodayPlaceHolder extends StatefulWidget {
  const TodayPlaceHolder({Key key}) : super(key: key);

  @override
  State<TodayPlaceHolder> createState() => _TodayPlaceHolderState();
}

class _TodayPlaceHolderState extends State<TodayPlaceHolder> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: Container(
            padding: const EdgeInsets.only(left: 20),
            child: const Text(
              "Bugün",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const ListTile(
          title: Text("İpuçları"),
          trailing: Icon(Icons.cancel_outlined),
        ),
        tipList(),
        const ListTile(
          title: Text("Yapılacaklar"),
          trailing: Icon(Icons.expand_less),
        ),
        todoItem(),
        todoItem(),
        const ListTile(
          title: Text("Tamamlanmışlar"),
          trailing: Icon(Icons.expand_less),
        ),
        todoItem(),
        todoItem(),
        const ListTile(
          title: Text("Pomodorolar"),
          trailing: Icon(Icons.expand_less),
        ),
        todoItem(),
        todoItem()
      ],
    );
  }

  Padding todoItem() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(50),
          child: const Text("Yapılacaklar öğesi"),
        ),
      ),
    );
  }

  Widget tipList() {
    // ignore: sized_box_for_whitespace
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: [
          tipItem(),
          tipItem(),
          tipItem(),
          tipItem(),
          tipItem(),
        ],
      ),
    );
  }

  Container tipItem() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.purple.shade300.withAlpha(50),
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: Colors.purple)),
      width: 100,
      child: const Text("İpucu"),
    );
  }
}
