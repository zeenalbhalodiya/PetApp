import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Color primaryColor = Color(0xff376565);

List<BoxShadow> shadowList = [
  BoxShadow(color: Colors.grey[400]!,blurRadius: 30,offset: Offset(0,10))
];

String details = 'My job requires moving to another country.'
    'I do not have the opportunity to take the cat with me.'
    'I am looking for good people who will shelter my pet';

List<Map> categories = [
  {"name": 'All',"imagePath":'assets/images/png/cat.jpeg'},
  {"name": 'Cat',"imagePath":'assets/images/png/cat.jpeg'},
  {"name": 'Dog',"imagePath":'assets/images/png/dog.jpeg'},
  // {"name": 'Horses',"imagePath":'images/horse.png'},
  // {"name": 'Parrots',"imagePath":'images/parrot.png'},
  // {"name": 'Rabbits',"imagePath":'images/rabbit.png'},
  // {"name": 'Cats',"imagePath":'images/cat.png'},
  // {"name": 'Dogs',"imagePath":'images/dog.png'},
  // {"name": 'Horses',"imagePath":'images/horse.png'},
  // {"name": 'Parrots',"imagePath":'images/parrot.png'},
  // {"name": 'Rabbits',"imagePath":'images/rabbit.png'},
];

List<Map> catMapList = [
  // {"id":0,"name":'Sola',"imagePath":'images/pet_cat2.png',
  //   "Species":'Abyssinion cat',"sex":'Female',
  //   "year":'2',"distance":'3.6 km',"location":'5 Bulvorno-Kudriovska Street, Kyiv',},
];

List<Map> navList = [
  {'icon': Icons.pets_rounded,'title': 'Adoption'},
  {'icon': Icons.markunread_mailbox_rounded,'title': 'Donation'},
  {'icon': Icons.add_rounded,'title': 'Add Pet'},
  {'icon': Icons.favorite_rounded,'title': 'Favorites'},
  {'icon': Icons.mail_rounded,'title': 'Messages'},
  {'icon': Icons.person,'title': 'Profile'},
];

List<Map> drawerItems = [
  {
    'icon': FontAwesomeIcons.paw,
    'title': 'Adoption'
  },
  {
    'icon': FontAwesomeIcons.plus,
    'title':'Add Pet'
  },
  {
    'icon': Icons.favorite,
    'title':'Favourite'
  },
  {
    'icon': FontAwesomeIcons.userAlt,
    'title':'Contact Us'
  },
  // {
  //   'icon': FontAwesomeIcons.plus,
  //   'title':'Offers'
  // },
  {
    'icon': FontAwesomeIcons.signOutAlt,
    'title':'Logout'
    },
];
