library constants;

import 'package:flutter/material.dart';
import 'package:water_plant/objects/plant/plant.dart';

const int ALLOWED_NUMBER_OF_PLANTS_IN_TANK = 4;

const int MAX_CHARS_DEVICE_NAME = 22;

const Color BOTTOM_NAVIGATION_BAR_COLOR = const Color(0xff5b7329); // dark green

const Color LIGHT_GREEN_COLOR = const Color(0xFFAEBF2A);

//const Color BORDER_COLOR = Colors.white70;
const Color BORDER_COLOR = const Color(0xFF424242); // grey[800]

const Color SCAFFOLD_BACKGROUND_COLOR = const Color(0xFFF2F2F0); // greywhite

const Color CARD_BACKGROUND_COLOR = SCAFFOLD_BACKGROUND_COLOR;

const Color WATER_LEVEL_FILL_DARK_THEME =
    const Color(0xFF1E88E5); // Colors.blue[600]

const Color WATER_LEVEL_FILL_LIGHT_THEME = Color(0xFF4A678C); //dark blue

const Color WATER_LEVEL_EMPTY_LIGHT_THEME = Colors.white;
//Colors.white70;

const Color WATER_LEVEL_EMPTY_DARK_THEME = Color(0xFF757575); // grey[600]

const String PLANT_CHINESE_EVERGREEN =
    'assets/plants/plant_chinese_evergreen.jpg';

const String PLANT_EMERALD_PALM = 'assets/plants/plant_emerald_palm.jpg';

const String PLANT_ORCHID = 'assets/plants/plant_orchid.jpg';

const String PLANT_BONSAI_FICUS = 'assets/plants/plant_bonsai_ficus.jpg';

const String PLANT_COCOS_PALM = 'assets/plants/plant_cocos_palm.png';

const String PLANT_MONEY_TREE = 'assets/plants/plant_money_tree.jpg';

const String PLANT_QUEEN_PALM = 'assets/plants/plant_queen_palm.jpg';

const String PLANT_BENJAMIN_FIG = 'assets/plants/plant_benjamin_fig.jpg';

const String PLANT_YUCCA_PALM = 'assets/plants/plant_yucca_palm.jpg';

const String PLANT_JANET_LIND = 'assets/plants/plant_janet_lind.jpg';

/// A map of information about each plant
final List<Map<String, dynamic>> ALL_PLANTS_INFORMATION = [
  {
    'name': 'Chinese Evergreen',
    'latinName': 'Aglaonema',
    'imageName': PLANT_CHINESE_EVERGREEN
  },
  {
    'name': 'Emerald palm',
    'latinName': 'Zamioculcas zamiifolia',
    'imageName': PLANT_EMERALD_PALM
  },
  {'name': 'Orchid', 'latinName': 'Orchidaceae', 'imageName': PLANT_ORCHID},
  {
    'name': 'Yucca Palm',
    'latinName': 'Yucca elephantipes',
    'imageName': PLANT_YUCCA_PALM
  },
  {
    'name': 'Cocos Palm',
    'latinName': 'Cocos nucifera',
    'imageName': PLANT_COCOS_PALM
  },
  {
    'name': 'Money Tree',
    'latinName': 'Crassula undilatifolia',
    'imageName': PLANT_MONEY_TREE
  },
  {
    'name': 'Queen Palm',
    'latinName': 'Livistonia Rotundifolia',
    'imageName': PLANT_QUEEN_PALM
  },
  {
    'name': 'Benjamin Fig',
    'latinName': 'Ficus Nitida',
    'imageName': PLANT_BENJAMIN_FIG
  },
  {
    'name': 'Bonsai Ficus',
    'latinName': 'Ficus microcarpa',
    'imageName': PLANT_BONSAI_FICUS
  },
  {
    'name': 'Janet Lind',
    'latinName': 'Dracaena Janet Lind',
    'imageName': PLANT_JANET_LIND
  },
];
