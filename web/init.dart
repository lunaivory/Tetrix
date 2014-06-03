library init;
import 'dart:math' show Random;
import 'shape.dart';
import 'animator.dart';
import 'user.dart';
import 'move.dart';
import 'dart:html';
import 'dart:js';

const ROW = 9;
const COL = 22;//column

const BDX = 8;//board left of css
const BDY = 6;//board top of css
const LEN = 26;//the length of a block in css

const PBX = 253;
const PBY = 80;
const PLEN= 16;

const SUM = 7;//kinds of brick style
const BGC = -1;
const RED = 0;
const ORG = 1;
const YLW = 2;
const GRN = 3;
const CYN = 4;
const BLU = 5;
const PPL = 6;

const LEFT = 37;
const RIGHT = 39;
const DOWN = 40;
const UP = 38;
const CTRL = 17;
const PKEY = 80;

const String strRED="#FF3948";
const String strORG="#FFA76C";
const String strYLW="#FFE66C";
const String strGRN="#DCFF48";
const String strCYN="#7BEFFF";
const String strBLU="#508AFF";
const String strPPL="#E26CFF";
const String strBGC="white";
const String OPACITYPVW = "0.3";
Random random = new Random();

User usr;

List<List<List<List<int>>>> shape;
List<List<DivElement>> previewBox;

DivElement scoreBox, levelBox;
DivElement theEnd;
InputElement name_input;
String name_string;
int scoreSum;
bool end=false;
bool pause=false;

int LEVEL=0;
int levelCnt=0;
int DURATION=50;
int scoreMultiplier=100;
int debugg=0;
int nextcolor;
Animator animator = new Animator();

void startPressListener(){
  Element startButton;
  startButton = querySelector('.button');
  startButton.onClick.listen((MouseEvent evt){
   print('here');
   name_input = querySelector('.textbox');
   name_string = name_input.value;
   querySelector('.start_page').classes.add('disappear');
   querySelector('.game_page').classes.remove('disappear');
   init();
   startGame();  
  });
}

void init()
{
  usr = new User();
  scoreBox = new DivElement();
  levelBox = new DivElement();
  LEVEL=0;
  levelCnt=0;
  DURATION=50;
  scoreMultiplier=100;
  scoreBox.classes.add("text_box");
  querySelector('.box').nodes.add(scoreBox);
  levelBox.classes.add("text_box");
  querySelector('.box').nodes.add(levelBox);
  scoreBox.style.left = "170px";
  scoreBox.style.top  = "435px";
  levelBox.style.left = "170px";
  levelBox.style.top  = "500px";
  levelBox.text = "0";
  scoreBox.text = "0";
  scoreSum=0;
  createShape();
  createPreviewBox();
}
void startGame()
{
  var play_sound = new JsObject(context['play_sound'],[0]);
   usr.createTetra();
   animator.add(usr);
   animator.start();
   toMove(usr.usrTetra,usr.usrBoard);
}
void gameOver()
{
  var stop_sound = new JsObject(context['stop_sound'],[0]);
  print("gameOver");
  end = true;
  pause = true;
  DivElement name, score;

 // theEnd = new DivElement();
  querySelector('.preview_block').classes.add('disapeear');
  querySelector('.block').classes.add('disappear');
  querySelector('.game_page').classes.add('disappear');
  if( scoreSum >= 10000 ){
    querySelector('.high_result').classes.remove('disappear');
    name = querySelector('.textbox1_1');
    name.text = name_string;
    score = querySelector('.textbox2_1');
    print(score);
    score.text = scoreSum.toString();
    print(score);
  }else if( 5000 <= scoreSum && scoreSum < 10000 ){
    querySelector('.medium_result').classes.remove('disappear');
    name = querySelector('.textbox1_2');
    name.text = name_string;
    print(score);
    score = querySelector('.textbox2_2');
    score.text = scoreSum.toString();
  }else if( scoreSum < 5000 ){
    querySelector('.low_result').classes.remove('disappear');
    name = querySelector('.textbox1_3');
    name.text = name_string;
    score = querySelector('.textbox2_3');
    print(score);
    score.text = scoreSum.toString();
    print(score);
  }
 // document.body.nodes.add(theEnd);
 // theEnd.classes.add("end_box");
 // theEnd.text="The End QQ";
  animator.stop();
}

String colorToString(int hue)
{
  switch(hue)
  {
    case(RED): return(strRED);  break;
    case(ORG): return(strORG);  break;
    case(YLW): return(strYLW);  break;
    case(GRN): return(strGRN);  break;
    case(CYN): return(strCYN);  break;
    case(BLU): return(strBLU);  break;
    case(PPL): return(strPPL);  break;
    case(BGC): return(strBGC);  break;
    default:   return(strBGC);  break;
  }
}

void createPreviewBox()
{
  previewBox = new List(5);
  for(int i=0 ; i<5 ; i++) previewBox[i] = new List(5);
  for(int i=0 ; i<5 ; i++)
    for(int j=0 ; j<5 ; j++)
    {
      previewBox[i][j] = new DivElement();
      previewBox[i][j].classes.add("preview_block");
      previewBox[i][j].style.left = (PLEN*i+PBX).toString()+"px";
      previewBox[i][j].style.top  = (PLEN*j+PBY).toString()+"px";
      previewBox[i][j].style.backgroundColor = colorToString(BGC);
      querySelector('.box').nodes.add(previewBox[i][j]);
    }
  
} 

void paintPreviewBox()
{
  for(int i=0 ; i<5 ; i++)
    for(int j=0 ; j<5 ; j++)
      previewBox[i][j].style.backgroundColor = colorToString(shape[nextcolor][0][i][j]);
}