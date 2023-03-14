import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  MyAppState createState() {
    return MyAppState();
  }
}

class Data {
  String kode;
  String nama;
  String vol;
  String turnOver;
  String harga;
  String naikTurun;
  String pctNaikTurun;

  Data({
    required this.kode,
    required this.nama,
    required this.vol,
    required this.turnOver,
    required this.harga,
    required this.naikTurun,
    required this.pctNaikTurun,
  });
}

class MyAppState extends State<MyApp> {
  final textEditController = TextEditingController();
  String pilihanActive = "turn";
  String pilihanActiveOut = "";
  String pilihanOne = "day";
  String pilihanOneOut = "";

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    textEditController.dispose();
    super.dispose();
  }

  List<Data> data = [
    Data(
      kode: "BBRI",
      nama: "Bank Rakyat Indonesia",
      vol: "125M",
      turnOver: "605B",
      harga: "4820",
      naikTurun: "+80",
      pctNaikTurun: "+2.00%",
    ),
    Data(
      kode: "BBCA",
      nama: "Bank Central Asia",
      vol: "100M",
      turnOver: "500B",
      harga: "3200",
      naikTurun: "-20",
      pctNaikTurun: "-0.63%",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<String>> active = [];
    var itm1 = const DropdownMenuItem<String>(
      value: "turn",
      child: Text("Active Turn Over"),
    );
    var itm2 = const DropdownMenuItem<String>(
      value: "volume",
      child: Text("Active Volume"),
    );
    active.add(itm1);
    active.add(itm2);

    List<DropdownMenuItem<String>> one = [];
    var item1 = const DropdownMenuItem<String>(
      value: "day",
      child: Text("1D"),
    );
    var item2 = const DropdownMenuItem<String>(
      value: "week",
      child: Text("1W"),
    );
    one.add(item1);
    one.add(item2);
    return MaterialApp(
      title: 'Hello App',
      home: Scaffold(
        appBar: AppBar(
            leading: FlutterLogo(),
            backgroundColor: Colors.blueGrey,
            title: Text('Quiz Flutter'),
            actions: <Widget>[ButtonNamaKelompok(), ButtonPerjanjian()]),
        body: Column(children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                  child: DropdownButton(
                      value: pilihanActive,
                      items: active,
                      onChanged: (String? newValue) {
                        setState(() {
                          if (newValue != null) {
                            pilihanActive = newValue;
                          }
                        });
                      })),
              DropdownButton(
                  value: pilihanOne,
                  items: one,
                  onChanged: (String? newValue) {
                    setState(() {
                      if (newValue != null) {
                        pilihanOne = newValue;
                      }
                    });
                  })
            ],
          ),
          Expanded(
            //gunakan listview builder
            child: ListView.builder(
              itemCount: 2,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(border: Border.all()),
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Kode: ${data[index].kode}"),
                      Text("Nama: ${data[index].nama}"),
                      Text("Volume: ${data[index].vol}"),
                      Text("Turnover: ${data[index].turnOver}"),
                      Text("Harga: ${data[index].harga}"),
                      Text("Naik/Turun: ${data[index].naikTurun}"),
                      Text("Pct Naik/Turun: ${data[index].pctNaikTurun}"),
                    ],
                  ),
                );
              },
            ),
          ),
        ]),
      ),
    );
  }
}

class ButtonNamaKelompok extends StatelessWidget {
  const ButtonNamaKelompok({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.account_circle_rounded),
      onPressed: () {
        // icon account di tap
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Kelompok 10'),
            content: const Text(
                'Zahra Fitria Maharani (zahraftrm03@upi.edu) ; Qurrotu Ainii (qurrotuainii@upi.edu)'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      },
    );
  }
}

class ButtonPerjanjian extends StatelessWidget {
  const ButtonPerjanjian({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.access_alarm_rounded),
      onPressed: () {
        // icon setting ditap
        const snackBar = SnackBar(
          duration: Duration(seconds: 20),
          content: Text(
              'Kami berjanji  tidak akan berbuat curang dan atau membantu kelompok lain berbuat curang'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
    );
  }
}
