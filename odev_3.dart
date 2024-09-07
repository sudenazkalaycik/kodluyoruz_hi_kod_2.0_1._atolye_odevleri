import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkModeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: isDarkModeEnabled ? ThemeData.dark() : ThemeData.light(),
      home: DayList(
        isDarkModeEnabled: isDarkModeEnabled,
        toggleDarkMode: () {
          setState(() {
            isDarkModeEnabled = !isDarkModeEnabled;
          });
        },
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class DayList extends StatelessWidget {
  final List<String> daysOfWeek = [
    'Pazartesi',
    'Salı',
    'Çarşamba',
    'Perşembe',
    'Cuma',
    'Cumartesi',
    'Pazar',
  ];

  final bool isDarkModeEnabled;
  final VoidCallback toggleDarkMode;

  DayList({required this.isDarkModeEnabled, required this.toggleDarkMode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffd2ac9e),
      appBar: AppBar(
        backgroundColor: Color(0xff97533b),
        title: Text('Home'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SettingsPage(
                    isDarkModeEnabled: isDarkModeEnabled,
                    toggleDarkMode: toggleDarkMode,
                  ),
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserProfilePage(),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView(
        children: daysOfWeek.map((day) {
          return Column(
            children: [
              ListTile(
                title: Text(day),
                onTap: () {
                  //
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DayDetail(day: day),
                    ),
                  );
                },
              ),
              Divider(), // Çizgi ekleyin
            ],
          );
        }).toList(),
      ),
    );
  }
}

@override
Widget build(BuildContext context) {
  return Scaffold(
    body: Center(
        child: Image.network(
      'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAoHCBUUFBgSEhUVGBgaGhwYGBkaGRoYGBwZGRwaGRgYGBgcIS4lHB4rHxocJjgmKy8xNTU1GiQ7QDs0Py40NTEBDAwMEA8QGhISGjQhISs0NDQxMTExNDE0MTQxNDQ0MTE0NDQ0NDQ0NDQxNDQ0NDE0NDQ0MT80NDQ0ND8xNDExMf/AABEIAKQBNAMBIgACEQEDEQH/xAAcAAACAgMBAQAAAAAAAAAAAAAAAgQFAQMGBwj/xAA6EAABAwIEBAQFAwMCBwEAAAABAAIRAyEEEjFBBVFhcQYigZETobHB8DJC0VLh8RSSI2JygqKywjP/xAAZAQEAAwEBAAAAAAAAAAAAAAAAAQIDBAX/xAAkEQADAQACAgICAgMAAAAAAAAAAQIRAzESIQRBEzJCURQigf/aAAwDAQACEQMRAD8A6lwue6IWx7bnulhdhyCQiE8IhAJCzCaEQgFhEJoQWqAJCdtEkToOZsPcqtxT8jiQ95cP2GMo72n0ULEY6q/WTO39lycnylLxHRHA69svatPKJLmdswkqIx5y/EqQ0bCQfcjdUVR7hBdJO2ySjjMhtIi/ssl8tvtF3wJdHUMuJiOiaFCwXFWP8r7HXMNPUe/srX4BIzM8zeY/hdcc00uznrjqTRCxC3sw7iYAK3N4e/V0NbuSRYc43Vq5IntlVFP6IcLBCm1BQa0+dxLdTECRaI3uodTHUwfK2ed/ZYv5fH9ezRcNGA1EKFV4w4DyhovteNdDuozuMkO1BvcOHyCqvly/ot+Cv7LfKsQq6lxlpMFsjnp7KVRx9J37sp6rWeeWUrhpG+FmE7GZhLYI6LELVUn0ZtNdiwiE0IhWAsLEJ4RCASEQnhZDJ0QGuEZU8IhAJlRlTwiEAmVGVPCIQCwiE0IhADG2QtlNtkKoGeLlYyrY9tyjKrA1ZVnKmhNlQGrKjKnhEIBcqam3zDumyrACh9BdlJwzB4nFvqGmGMYx5YXvkuc4AEw0ai4vKhYmlVbiDhqb6Ty3yucW/DGeJLBLjMDdeg8Byim4C0PcT3MGV5d424O99WpTYBn+I6ozMcoex/mkO5gmPReX+OfL2d3lWehv9Zma52Vrwx2V+QyWnS4O3UKPixlJDmuY7+lwgx66hbPC3CquHoVG1cuevDGMaczv+okaLrvE9Om6kGVACWtADtwQNQVRxO+i8032cBTrRLb6K84Vxao0DK4iPyY5WVRgcA5zhFy76deS6rB8BDRLpjoPrzWbpL0ThgeIaxuCW7+gv9FluOqvu5wg2vMmRsBopj+H0QAIN9Lo+GxmxEnbmNAs29JxFfUJGpLrb6TM6KHXeZAkRyi8wIv3VjUewtHl01PP85qLiSD+naT1uiJK6uLA3tJ9FCczcRoDI7KwqMiHTa/U9StYw5IsCTfoL8loipCBMAzY8re5W1jgTJzbb7rL6Jb/AEiNi4C2hGusJIa39zZvuN1otILSjinMs0kDp3urbA8XdZtVoP8AzAR2nquZZXbYSPedipuEqHUmZ07q6pz0Vcp9nXsYHgmmQ4SRG4jokyqqwOLewtc1wsBPUz2V3gsW2uT8QBtyWuBvE2zN09VvHys9UYVw/cmnKs5VJr4ZzDGo2I0K0wuxUqWo52muzXlRC2j3SPcBcgx7qRgj3RcrMIe0OaYMghJgX52Bx10PcJowfKjKtuVGVSDVlRlW3KjKgNWVGVbcqMqAxTFlhbKYshVJGc25WMq2OF1iEQEyoyp4RCkgTKjKnhEIBMqC1PCCEJK1/GDh67mO/S8D3Cn4rGYau0CqGOjQmQ4diLhQuM8ObWZcXAt1XCVeHvZYF1pBHLovM5JpUztik0dnUx+Ew8upNbmiMxJc6OQLpPsuW4jxR+IeGtm5gf4VbUZlEn0B+RPupvhmnmrZz+3TublZNs0w7fw9wgU2A7kX/wAq+dhgqytxJtBrZurHCcQY8WInks3JHs118K07KnxWELTI11He8fVdK4ToodbDzqqZhJztQxDYkbW3M/JV9amCQCNTtHKbq84hh8ug1B+YhaaeEBaSdbx0MKyQObqwzzBumk7KjxnEnvMSQ3kFb+IK4aMg9VyxdddfFCzWWGcVjKhS8DRD3AHQ2W/QIZaQmpYl7DLSfsrXHYJrBYhw0n0mfzmqmoE7DR0XCuPtLg2qA06B21+a6/DtEscyN7jSJn6wvJ3hdN4T46WO+FUPlNhOyx5OFNaiGeg4bHPZAlmXQgy1w2kOgg7e63sr0Kl2yHRcTaeXf+6gtq5gJLSCIdpoDcd4sq/EYVpk0y0RcQcvu3Q7mY3XNN3D9MpUTXaLv4YP6XNNpNwCO4K1vECSRHcLisTSqMfcncGTY8+62NxcQ1xdpAjl2XT/AJdJdaZ/gllpiKpp1Q+j5mOnOwbHZwUrw/PwgH2dJkbiVUZXOFifb5Eb91GNSrTP3m/RVn5VaS+BYdmWoyqp4Jxj4h+G8XOk7GFd5V38fIrWo5rjxZqyoyp4RC0MxMqMqeEQgMAITgIVScQzhdYhbSFiFJJrhELZCIUg1wiFshEIDXCIT5VmEBqcLFRMNw9oZDgCTJcepuVYtCxCo5T7JVNdHF+KeDAAPp2mxULwxTyk2Bjn3F122Ow2eGnS5PtA+q58YX4T72EySOS4PkT4166OrjrZJvGqQeyDe3a8LzzA+JamCxBp1AXU50glzR/yX06L0XEgvpHLq2/M84PXouC8XcINYGtTbfWOu495KrDX2bpbPo9O4LxllVjajXhzXCxH0I2V1mDhb1Xzv4X8TPwTyDmcwnzsnTmQ02le0cF47TrNa9jpBEgjTsf7qnJGFV7LTEslVdbyz1VtVeCFUY5p2WUr2XmThuNmXm655/6ldcVPmdPNVNJkuXbHpE4DWFbqT8t1uFPmtZp6q2k4ZdWJ15QotQrYQQtD1ZFGa3FR3vggjmt7gtFcWUkM7zw/xckAlwEgSTttPsr572OPxMrjmvmAkk2AgcpleccLxOTKOYM+q6zg1cmA4zF/4+y4+WPsrpaY1heDmDXb6WB0kchAVKzCtNZrHl7GuIuP1QLZZOndXrXEA5TcjzH7DmY3VXxehNP4jXXF+ZkX0WKRKoPFmXDOmlRL2sptdkLn+fM4hziQZMQNFD8Fs/1IY6s13mqFgHnbmZkcXHX9pAurDg/GaWIYxuIJzts17TB5H35FdFhKlCj/AMRri50Rmc4Egchs0LeczMKPd3TFTw82hVbUpuJYSZDrkWtB3upsLNHE/EYHzYzHbmE8L0OKVMnLyVtGuFmE8IhalDXCIWyEQgFAQnDUKCRiEQnIWIQgWEQmhEIBcqMqaFmEAmVGVNCzCASEQnhEIBIUPiGDL2gjnc7wp0JmDY6brDn4/OGl2acdZRzWFfDy2PKAQdp7TrH1ULGYUMcWH9JUzi7CypEwJ9+Q7albfhiq2CQTzM6HT1Xmw/R2RWM8v8W+H8hNamDzcB/7BRfCvid+HeGVDmpn/cw82n7Gy9Jr4eQab9diRYrzzinAW0sQyof/AMi8ZxFmzvHJbzSaxl7n+UnrOD4g17GuaTBFjH4EYqpIsR7/AEUPC8OZQpzTzFpEg5iQewNvZYo1xUEkjXYCJ63ss3OMmaOc4/hP3DXUx9VQ4Y3grs8dSjrYjRczWwkOJatZr0Wz7I+OxhY3NlmLJOH41tQw5pa7YHQ9lJqUw9uVyKNDUchI9FfSfemKlMT9VEfTuplNxNnaKFjK4aIlSmRWGmq0DRQ6qRralZ+Rs+lgO5UrEU2sAbMkfNWM37M4Y+YDlAXXcDdBmfzouXwLN9SV1HBhlvv1+yyv2Zsvy4AQ7MSdgJ7k9e6Wu3O1zWzMQJFx0sVGrYhrDmJYOmju0X+at+CUi8B7hA1Fonkqxx+TM6rEc1gfBtVrJJAJggakd+SucB4adY1nkj+n+V1EIhda4JT0y/K8wRrA0Q0QBYBEJoWYWy9GYqFmEQpIFhEJoRCAwAhMGoUFhyhOQsQhGCoTZUZUGCwiE0IhBgsIhNlRCDBYRCbKs5UGCQhNCIQYVnF8JnbMXCpcA8iaZ2NtPqutLVzfEcLkqZhpr7rzufjUV5LpnTx1qwxi8KHNzTBAnVVFfDsqsIMBwsWkTmnZdDTfabctASdlV8QoOa8VGWG+3yAWSZ08dfTOWocVrYUf6V0vpPMMJP6HG2Uk/tWMFhq2HqOFXMGudmBDvKSdraLqMVwlmJpkMALoJLeY5jqucq4mp8M4Oo2X/povNuzXk6Ec1p2iXPi9Rb08ew+V7mE/9Un6IrUGPu2PQ/yq2hhCKjG1BDg4A/5V/i+HPbdhc8cpuP5VOiW8KStw3sVDfSyg7E2U+tVdnyNDnO5AQlxUAxUEGL3mOQWiZdWjncS8AQDdQHUCdl0TsOyC7oT6NME+i1ig0W9tp7K+lKxlKGvAhrCB03T0+HPccxEd/wCFd0atNrod5e5gLHE+LMokfuJ/a0fd38qPJ/0ZtkfDYKIv9fsptXHsoi4zO2aJ9yqOrxitVMU2BjdJi/uF0Phvw66qQ58xu4/aVZS32Z00uyV4d4a/EP8AiPENHSw6Beg06Qa0NAgBYwuGbTYGMAAAW+F0xPic115CQhPCMq0KYIhPlRlQYIhNCzlQYIhPlRlQYIhNlQhIxCE5QqgSEQnQrASEQnQgEhEJ0IBEJ0IBIRCdCASFHx9DPTJ/puPXVS0zRIIO4XP8id42X43/ALHO4Zv5p81uezMC0gchMQlezK4tjt0TLzpZ0HP189F9iYnbbsplbC0sUyHnLU1z7G836q1fRa4EQD+bKgxWFfSJLRLeS0TN5rfTKPi2GxLK1Ko5uYUzDjpnZNpPOxgrvsG8PaHi4IkeqocBxYgkOhw3a7nEDVb8HxHI4j9lzHLoFPZNTq9FtXwrHaj87rkuLYAGoGsm5zQTIhunpK6R/GKWUkuiy5R/FKrsQ6oxjTTDcoLyWuN5Jb0srzJhj6wWvQc1oBboNf8AdPvmXK+I+MgN+BTHnH6nDYbNnn1XR8RqYisC0FlMcxLnehgQqGpwBjBOYk7k/VWWFvCjnSKlZobUJdGhOtp/lWGF4cbAyeQ1VtQwegaF0XC+HARAk9tyraUeIx4f8P5iMw9F6JhMI2mwNaNFq4Xgvhtv+o6n7Kct4nPbMKpsSEJ0LYzEQnQgEQnQgEQnQgEQnQgFQmQqgYhYhPCE0kRCdCARCdCARCdCARCdCASFmE0LBMAk6C5UOklrGAGey1Gu0GAZ1kqmx3GMzsgDmNvcXJHO2g73WvDVMw1JOvptqvJ+R8iqeL0jrjiSWsm4xn7xv+XUUHr+dFYUxnpwdf4VcwqvGyH2bmOW+AdQFGat7XLTQVmP4Mx9wMp5hVFbhFVl2kO76rrGvQQFZMuraOArtqg3YVodingfoXcV2jWAq3EMbyCumPys5V9d50EStZpSfOT1V3XY07DooNRvz+yssKO6Y2Bw8my7jgnDQxoe4XOn8rmOCVGNqND45r0BhBEhbcSVezGmzEIhOhdBmJCIToQCwsQnQgEhEJ0IBYWITwiEAkIhOhAKhZhCgDIRCIQkEIhEKQCEQiEAIRCIQAhEIhAACq+McQyAtaYgS48gNlPxNbIwvt0kwuQ4lcOcDJN9edhPqVwfK5v4r/pvwx9sjMqA/wDE/qEkusTyEbD+VZcJreYQLaHa33hQHZbSAdp6zqp3DKQic1zp9dVwM3fR0OHp5TA0VfimZXlWlN0wZtER1lROJU9+StPoyZAa5bM6jusYWc66F7IN/wAW6HVlFc9Rn4iyukDdiKo2VXia0rNetKrq9ceqthBipVVdicXkvqdgovEeJtpyNXxYDbuudZiHF+d5k85JRoIu24ksqB97nUfQhereGeIitTAm4Xi1WscwDT1An5XXVeFOMOpuDid4IkadVeK8WKWo9aQtOGxLHtDmOBnqFuhdaaZhgIQtNbFMZZ7gO5RsYbkLQzFMcJa4H1W8GU1DAQhEKQCEQiEAIRCIQAhZQoApKJSEolQTg8olJKJQYPKJWmpUa0FzjACgO41TE3PyVK5Jn02Spb6LWUSqmlxuk50TGlz1Vk1wNwpm1XQc4bJQ26SVD4pivhsLhroP5VeSvGWyZnXhXcdxnlLM4m9gJ7XXNiq45WEESL8zAkAgdZ9k+Kqy/NmBgZgOZ68tSor873hxtFgNJLhPyH1Xkv29Z1JYS6eskHt+equ8BECWgfX2VGzFCG5haSD6Ex6WVnwysL5ZN95+u2qjCKZfUnkD7KRW8zTCradUAT8pCbD4uDfT82UlCFXt+bdVoe7c/nRWWNpNMEGQekqqxD9YNhpJ9/mtZZDEqP5/khQ6r/v9FiviRz/yYKrcRi9fqtZIY9fEcvRc/wAV4mGS1pBef/Hqeq08R4rYinr/AFfwuWrVSfudytEgb61W97k7zdFNxUZgUpgPJTgRIYN1NovhRKbCpVOmVVklvhOJOZoSPkrzB+KKrNHuI5G4+a5NrCtlwnk0MPRcH43abVGiebbfJcL428RPe8ZHmBuFAe8qqx99eyurb9MjxRacA8RVWVA1zyWusDyK9K4J4maGkVSZBAb2J1novH+HYYmw1Y631C61j4DXRHMWPz3Cjz8X6DnT1/DVw9geNDotsrhuC8fLctOZA/b03+q67CYxlQS0+m63nkmvRnUtEuUSklErQrg8olJKJQYPKEkoVdJwUoWEIDKFhCkHP+Lq7m08oNjquMrV3ea+6ELg5v2ZvH6lezFODjB5fdd14cx7yA0mQSNexQhacXaIro6pc/4leY9CfW6EK3yv1RHF2cziPLEch/8AaStUIc2D/adYWELzzcksYMvr9ypGCcRngn9Uemn0AQhSitFqKpgLL9ShCkzI7q7gQAbHUbaqJxF5a0uFzIF72lCFeSGczicQ7oqjF13WusoXSipW1lGc0IQpLIw1SaaEKGSS2KQ1CFDJNrFkrKFBBpqMCrsWwQUIT7JJHB2DOf8At+6u6tMctC6PQCFlCzr9i6NtF5GR41mO46rp+E4hwcIP7j9kIRfsiK6OxaVlYQvQRzGULCFIMoQhAf/Z',
    )
        //asset kullanamadım çünku ne yaparsam yapayım FlutLab ahata verdi ya da ekrana çıktı vermedi bu yuzden link ekledim
        ),
  );
}

class DayDetail extends StatefulWidget {
  final String day;

  DayDetail({required this.day});

  @override
  _DayDetailState createState() => _DayDetailState();
}

class _DayDetailState extends State<DayDetail> {
  TextEditingController _infoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffd2ac9e),
      appBar: AppBar(
        backgroundColor: Color(0xff97533b),
        title: Text('Gün Detayı'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Gün: ${widget.day}'),
            TextField(
              controller: _infoController,
              decoration: InputDecoration(labelText: 'Bilgi Ekle'),
            ),
            ElevatedButton(
              onPressed: () {
                
                String info = _infoController.text;
                print('Gün: ${widget.day}, Bilgi: $info');

                
                Navigator.pop(context);
              },
              child: Text('Bilgiyi Kaydet'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _infoController.dispose();
    super.dispose();
  }
}

class SettingsPage extends StatelessWidget {
  final bool isDarkModeEnabled;
  final VoidCallback toggleDarkMode;

  SettingsPage({required this.isDarkModeEnabled, required this.toggleDarkMode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffd2ac9e),
      appBar: AppBar(
        backgroundColor: Color(0xff97533b),
        title: Text('Ayarlar'),
      ),
      body: ListView(
        children: <Widget>[
          InkWell(
            onTap: toggleDarkMode,
            child: ListTile(
              title: Text('Karanlık Mod'),
              trailing: Switch(
                value: isDarkModeEnabled,
                onChanged: (value) {
                  toggleDarkMode();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class UserProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffd2ac9e),
      appBar: AppBar(
        backgroundColor: Color(0xff97533b),
        title: Text('Kullanıcı Bilgileri'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('E-posta: sudenazkalaycik@gmail.com'),
            Text(
              'Kullanıcı Adı: Sudenaz KALAYCIK',
              style: TextStyle(
                fontWeight: FontWeight.bold, // Yazı kalınlığı (bold)
                fontSize: 16.0,
              ),
            ),
            Text(
              'Konum: Malatya - TÜRKİYE',
              style: TextStyle(
                color: Color(0xffff5d00), // Yazı rengi
                fontWeight: FontWeight.bold, // Yazı kalınlığı (bold)
                fontSize: 16.0, // Yazı boyutu
                fontStyle: FontStyle.italic, // Yazı stili (italic)
              ),
            ),
          ],
        ),
      ),
    );
  }
}