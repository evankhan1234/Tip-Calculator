import 'package:tip_calculator/Slide.dart';

Future<List<Slide>> _getList() async{
  return Future.value([Slide(
    imageUrl: 'https://etimg.etb2bimg.com/photo/75161189.cms',
    title: 'A Cool Way to Get Start',
    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec dapibus tincidunt bibendum. Maecenas eu viverra orci. Duis diam leo, porta at justo vitae, euismod aliquam nulla.',
  )
    ,
    Slide(
      imageUrl: 'https://etimg.etb2bimg.com/photo/75161189.cms',
      title: 'Design Interactive App UI',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec dapibus tincidunt bibendum. Maecenas eu viverra orci. Duis diam leo, porta at justo vitae, euismod aliquam nulla.',
    ),
    Slide(
      imageUrl: 'https://etimg.etb2bimg.com/photo/75161189.cms',
      title: 'It\'s Just the Beginning',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec dapibus tincidunt bibendum. Maecenas eu viverra orci. Duis diam leo, porta at justo vitae, euismod aliquam nulla.',
    )]);
}
