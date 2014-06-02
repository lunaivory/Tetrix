library board;

import 'dart:html';
import 'init.dart';
import 'tetra.dart';
class Board 
{
  List<List<DivElement>> _screenBoard;
  List<List<int>> colorBoard;
  DivElement boardLine;
  Board()
  {
    _screenBoard = new List(ROW);
    for(int i=0 ; i<ROW ; i++)  _screenBoard[i]=new List(COL);
    for(int i=0 ; i<ROW ; i++)
      for(int j=0 ; j<COL ; j++)
      {  
        _screenBoard[i][j]= new DivElement();
        _screenBoard[i][j].classes.add("block");
        _screenBoard[i][j].style.left= (LEN*i+BDX).toString()+"px";
        _screenBoard[i][j].style.top = (LEN*j+BDY).toString()+"px";
        _screenBoard[i][j].style.backgroundColor = colorToString(BGC);
        querySelector('.box').nodes.add(_screenBoard[i][j]);
      }
  
    colorBoard = new List(ROW);
    for(int i=0 ; i<ROW ; i++)  colorBoard[i] = new List<int>(COL);
    for(int i=0 ; i<ROW ; i++)
      for(int j=0 ; j<COL ; j++)
        colorBoard[i][j]=BGC;
  }
  void doPreview(Tetra toPaint)
  {
    toPaint.getPreview(this);
    var pdx=toPaint.dx;
    var pdy=toPaint.dy;
    print("$debugg doPreview => ${(pdx)}  ${pdy}");
    for(int i=0 ; i<5 ; i++)
      for(int j=0 ; j<5 ; j++)
        if(toPaint.brick[i][j]!=BGC)
        {
          if(pdx+i-2>=0 && pdx+i-2<ROW && pdy+j-2>=0 && pdy+j-2<COL && colorBoard[pdx+i-2][pdy+j-2]==BGC)          
            _screenBoard[pdx+i-2][pdy+j-2].style.boxShadow = "inset 0 0 2px 2px white";        
        }
  }
  void unPreview(Tetra toPaint)
  {
    var pdx=toPaint.dx;
    var pdy=toPaint.dy;
    print("$debugg unPreview => ${(pdx)}  ${pdy}");
    for(int i=0 ; i<5 ; i++)
      for(int j=0 ; j<5 ; j++)
        if(toPaint.brick[i][j]!=BGC)
        {
          if(pdx+i-2>=0 && pdx+i-2<ROW && pdy+j-2>=0 && pdy+j-2<COL){          
            _screenBoard[pdx+i-2][pdy+j-2].style.boxShadow = "inset 0 0 0px 0px";  
          }
        }
  }
  void rePaint()
  {
    for(int i=0 ; i<ROW ; i++)
      for(int j=0 ; j<COL ; j++)
        _screenBoard[i][j].style.backgroundColor=colorToString(colorBoard[i][j]);
  }
  
  void unPaint(Tetra toPaint)
  {
    var px=toPaint.x;
    var py=toPaint.y;
    for(int i=0 ; i<5 ; i++)
      for(int j=0 ; j<5 ; j++)
          if(toPaint.brick[i][j]!=BGC && toPaint.brick[i][j]!=BGC && px+i-2>=0 && px+i-2<ROW && py+j-2>=0 && py+j-2<COL)
          {
            colorBoard[px+i-2][py+j-2] = BGC;
            _screenBoard[ px+i-2][ py+j-2].style.backgroundColor=colorToString(BGC);
          }
  }
  void doPaint(Tetra toPaint)
  {
    var px=toPaint.x;
    var py=toPaint.y;
    var flag=false;
    for(int i=0 ; i<5 ; i++)
      for(int j=0 ; j<5 ; j++)
        if(toPaint.brick[i][j]!=BGC)
        {
          if(px+i-2<0 || px+i-2>=ROW || py+j-2<0 || py+j-2>=COL){flag = true;}
          else
          {
            colorBoard[px+i-2][py+j-2] = toPaint.brick[i][j];
            _screenBoard[px+i-2][py+j-2].style.backgroundColor=colorToString(toPaint.brick[i][j]);
          }          
        }  
  }
  
}
