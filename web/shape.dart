library shape;
import 'init.dart';

void createShape()
{
  shape = new List(SUM);
  for(int i=0 ; i<SUM ; i++)
  {
    shape[i]=new List(4);
    for(int j=0 ; j<4; j++)
    {
      shape[i][j]=new List(5);
      for(int k=0 ; k<5 ; k++)
      {
        shape[i][j][k]=new List<int>(5);
        for(int l=0 ; l<5 ; l++)
          shape[i][j][k][l]=BGC;
      }
    }
  }
  List<int> rX0=[2,2,2,3],rY0=[1,2,3,3];
  List<int> rX1=[1,1,2,3],rY1=[3,2,2,2];
  List<int> rX2=[1,2,2,2],rY2=[1,1,2,3];
  List<int> rX3=[1,2,3,3],rY3=[2,2,2,1];
  paintShape(rX0,rY0,RED,0);
  paintShape(rX1,rY1,RED,1);
  paintShape(rX2,rY2,RED,2);
  paintShape(rX3,rY3,RED,3);
  List<int> oX0=[1,2,2,2],oY0=[3,3,2,1];
  List<int> oX1=[1,1,2,3],oY1=[1,2,2,2];
  List<int> oX2=[2,2,2,3],oY2=[3,2,1,1];
  List<int> oX3=[1,2,3,3],oY3=[2,2,2,3];
  paintShape(oX0,oY0,ORG,0);
  paintShape(oX1,oY1,ORG,1);
  paintShape(oX2,oY2,ORG,2);
  paintShape(oX3,oY3,ORG,3);
  List<int> yX0=[2,1,2,3],yY0=[1,2,2,2];
  List<int> yX1=[2,2,2,3],yY1=[1,2,3,2];
  List<int> yX2=[1,2,3,2],yY2=[2,2,2,3];
  List<int> yX3=[1,2,2,2],yY3=[2,1,2,3];
  paintShape(yX0,yY0,YLW,0);
  paintShape(yX1,yY1,YLW,1);
  paintShape(yX2,yY2,YLW,2);
  paintShape(yX3,yY3,YLW,3);
  List<int> gX=[1,1,2,2],gY=[1,2,1,2];
  paintShape(gX,gY,GRN,0);
  paintShape(gX,gY,GRN,1);
  paintShape(gX,gY,GRN,2);
  paintShape(gX,gY,GRN,3);
  List<int> cX0=[2,2,3,3],cY0=[2,3,1,2];
  List<int> cX1=[1,2,2,3],cY1=[2,2,3,3];
  paintShape(cX0,cY0,CYN,0);
  paintShape(cX1,cY1,CYN,1);
  paintShape(cX0,cY0,CYN,2);
  paintShape(cX1,cY1,CYN,3);
  List<int> bX0=[2,2,3,3],bY0=[1,2,2,3];
  List<int> bX1=[1,2,2,3],bY1=[3,3,2,2];
  paintShape(bX0,bY0,BLU,0);
  paintShape(bX1,bY1,BLU,1);
  paintShape(bX0,bY0,BLU,2);
  paintShape(bX1,bY1,BLU,3);
  List<int> pX0=[2,2,2,2],pY0=[0,1,2,3];
  List<int> pX1=[1,2,3,4],pY1=[2,2,2,2];
  List<int> pX2=[2,2,2,2],pY2=[1,2,3,4];
  List<int> pX3=[0,1,2,3],pY3=[2,2,2,2];
  paintShape(pX0,pY0,PPL,0);
  paintShape(pX1,pY1,PPL,1);
  paintShape(pX2,pY2,PPL,2);
  paintShape(pX3,pY3,PPL,3);
  
}
void paintShape(x,y,color,rotate)
{
    for(int i=0 ; i<x.length ; i++)
    shape[color][rotate][x[i]][y[i]]=color;
}