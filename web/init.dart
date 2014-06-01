library init;
import 'dart:math' show Random;
import 'shape.dart';
import 'animator.dart';
import 'user.dart';
import 'move.dart';
import 'dart:html';

const ROW = 11;
const COL = 21;//column

const BDX = 425;//board left of css
const BDY = 100;//board top of css
const LEN = 20;//the length of a block in css

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
const ALT = 18;
const PKEY = 80;

const String strRED="#FF8B8B";
const String strORG="#FFB68B";
const String strYLW="#FFFF60";
const String strGRN="#AAFF94";
const String strCYN="#9FFFFF";
const String strBLU="#9FCCFF";
const String strPPL="#E69FFF";
const String strBGC="black";
const String OPACITYPVW = "0.3";
Random random = new Random();

User usr;

List<List<List<List<int>>>> shape;

DivElement scoreBox, levelBox;
DivElement theEnd;
int scoreSum;
bool end=false;
bool pause=false;

int LEVEL=0;
int levelCnt=0;
int DURATION=50;
int scoreMultiplier=100;
Animator animator = new Animator();

void init()
{
  usr = new User();
  scoreBox = new DivElement();
  LEVEL=0;
  levelCnt=0;
  DURATION=50;
  scoreMultiplier=100;
  scoreBox.classes.add("score_box");
  document.body.nodes.add(scoreBox);
  scoreBox.text = "Score : 0"+" "+"Level "+LEVEL.toString();
  scoreSum=0;
  createShape();
}
void startGame()
{
   usr.createTetra();
   animator.add(usr);
   animator.start();
   toMove(usr.usrTetra,usr.usrBoard);
}
void gameOver()
{
  print("gameOver");
  end = true;
  pause = true;
  theEnd = new DivElement();
  document.body.nodes.add(theEnd);
  theEnd.classes.add("end_box");
  theEnd.text="The End QQ";
  animator.stop();
}