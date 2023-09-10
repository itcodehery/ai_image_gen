import 'package:flutter/material.dart';
import 'package:brain_fusion/brain_fusion.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';
import 'package:path/path.dart' as xp;
import 'dart:io' show Platform, File, Directory;

import '../bloc/app_directory_cubit.dart';
import '../utils/strings.dart';
import '../widgets/custom_drawer.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  late ImageCubit _imageCubit;
  late AppDirectoryCubit _appDirectoryCubit;
  late Directory directory;
  final TextEditingController _textEditingController = TextEditingController();
  var scaffoldKey = GlobalKey<ScaffoldState>();

  final Map<AIStyle, String> styleDisplayText = {
    //for all AIStyle values, add a display text
    AIStyle.aivazovskyPainter: 'Aivazovsky Painter',
    AIStyle.anime: 'Anime',
    AIStyle.cartoon: 'Cartoon',
    AIStyle.christmas: 'Christmas',
    AIStyle.classicism: 'Classicism',
    AIStyle.cyberPunk: 'CyberPunk',
    AIStyle.digitalPainting: 'Digital Painting',
    AIStyle.goncharovaPainter: 'Goncharova Painter',
    AIStyle.kandinskyPainter: 'Kandinsky Painter',
    AIStyle.khokhlomaPainter: 'Khokhloma Painter',
    AIStyle.malevichPainter: 'Malevich Painter',
    AIStyle.medievalStyle: 'Medieval Style',
    AIStyle.moreDetails: 'More Details',
    AIStyle.noStyle: 'No Style',
    AIStyle.oilPainting: 'Oil Painting',
    AIStyle.pencilDrawing: 'Pencil Drawing',
    AIStyle.picassoPainter: 'Picasso Painter',
    AIStyle.portraitPhoto: 'Portrait Photo',
    AIStyle.renaissance: 'Renaissance',
    AIStyle.render3D: 'Render 3D',
    AIStyle.studioPhoto: 'Studio Photo',
  };

  Future<void> _saveImage(Uint8List canvas) async {
    final String path = _appDirectoryCubit.state.path;
    try {
      if (path != pathHint) {
        directory = Directory(path);
        final appDir = Directory('${directory.path}/$app');
        if (!(await appDir.exists())) {
          await appDir.create();
        }
        final image =
            '''IMG-${DateTime.now().day.toString()}-${DateTime.now().month.toString()}-${DateTime.now().year.toString()}--${DateTime.now().hour.toString()}-${DateTime.now().minute.toString()}-${DateTime.now().millisecond.toString()}-logo.jpeg''';
        final filePath = xp.join(appDir.path, image);
        final file = File(filePath);
        await file.writeAsBytes(canvas).whenComplete(() {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content:
                  Text('${translation(context).imageWasSaved} : $filePath'),
              elevation: 10,
            ),
          );
        });
      } else {
        _choosePath();
      }
    } catch (e) {
      if (kDebugMode) {
        print('when save image : $e');
      }
      _choosePath();
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [],
      ),
    );
  }
}
