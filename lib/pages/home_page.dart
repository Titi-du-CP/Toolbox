
import 'package:flutter/material.dart';
import 'package:toolbox/gen/strings.g.dart';
import 'package:toolbox/models/tool.dart';
import 'package:toolbox/pages/clock_page.dart';
import 'package:toolbox/pages/credits_page.dart';
import 'package:toolbox/pages/metronome_page.dart';
import 'package:toolbox/pages/micspeak_page.dart';
import 'package:toolbox/pages/nslookup_page.dart';
import 'package:toolbox/pages/ping_page.dart';
import 'package:toolbox/pages/qrreader_page.dart';
import 'package:toolbox/pages/soundmeter_page.dart';
import 'package:toolbox/widgets/tool_card.dart';
import 'package:yaru/yaru.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);
  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  late List<Tool> tools;

  @override
  void initState() {
    initTools();
    super.initState();
  }

  void initTools() {
    tools = [
      Tool(t.tools.clock.title, "assets/images/tools/clock.png",
          const ClockPage()),
      Tool(t.tools.metronome.title, "assets/images/tools/metronome.png",
          const MetronomePage()),
      Tool(t.tools.micspeak.title, "assets/images/tools/micspeak.png",
          const MicSpeakPage()),
      Tool(t.tools.nslookup.title, "assets/images/tools/nslookup.png",
          const NslookupPage()),
      Tool(
          t.tools.ping.title, "assets/images/tools/ping.png", const PingPage()),
      Tool(t.tools.qrreader.title, "assets/images/tools/qrreader.png",
          const QrReaderPage()),
      Tool(t.tools.soundmeter.title, "assets/images/tools/soundmeter.png",
          const SoundMeterPage())
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(t.generic.app_name),
          actions: [
            IconButton(
              icon: const Icon(Icons.info_outline),
              color: YaruColors.textGrey,
              tooltip: t.credits.title,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CreditsPage()
                  ),
                );
              },
            ),
          ],
        ),
        body: SafeArea(
          child: Center(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2,
                ),
                itemCount: tools.length,
                itemBuilder: (context, index) {
                  return ToolCard(
                      title: tools[index].name,
                      imageAssetPath: tools[index].image,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => tools[index].page
                          ),
                        );
                      }
                  );
                },
              )
          ),
        )
    );
  }
}