float     diametre                = 100;  // Diamètre de ma sphère d'origine

int       IterationMax            = 7;

float     Redim                   = 0.5;//sqrt(0.5);

float     Angle                   = 0.1;

float     degre                   = 2*3.141592654/360;
float     evolution               = 0;

String    DossierCaptures         = "G:\\fractalvideo";
String    NomCaptures             = "FractaleCarree";
int       NombreDeCaptures        = 3600;
int       EnregistrementCaptures  = 1;



int       compteur                = 1;

void setup()
{
  size(1920,1080, P3D);
  noStroke();
  smooth(2)  ;
}

void draw()
{
  background(0);                
  pointLight(192, 32, 32, sin(evolution/24)*diametre*2.7, cos(evolution/24)*diametre*3, -sin(evolution/24)*diametre*3.2);
    translate(sin(evolution/24)*diametre*2.7, cos(evolution/24)*diametre*3, -sin(evolution/24)*diametre*3.2);
    fill(192, 32, 32);
    emissive(192,0,0);
    sphere(5);

  pointLight(32, 32, 192, -sin(evolution/24)*diametre*3.1, -cos(evolution/24)*diametre*2.9, -sin(evolution/24)*diametre*2.8);
    translate(-sin(evolution/24)*diametre*3.1, -cos(evolution/24)*diametre*2.9, -sin(evolution/24)*diametre*2.8);
    fill(32, 32, 192);
    emissive(0,0,192);
    sphere(5);

  pointLight(32, 192, 32, cos(evolution/24)*diametre*2.6, cos(evolution/24)*diametre*3.05, cos(evolution/24)*diametre*3.15);
    translate(cos(evolution/24)*diametre*2.6, cos(evolution/24)*diametre*3.05, cos(evolution/24)*diametre*3.15);
    fill(32, 192, 32);
    emissive(0,192,0);
    sphere(5);

lightSpecular(128,128,128);

  ambientLight(0,0,0);

  camera(sin(evolution/16)*500, cos(evolution/16)*500, 500+sin(evolution/16)*sin(evolution/32)*500, 16/9*sin(evolution/16)*diametre, cos(evolution/16)*diametre, 0.0, 0.0, 1.0, 0.0);
  emissive(0,0,0);
  fill(255,255,255);

    maFractale(1, IterationMax); 

  SauveCaptures();

  evolution+=Angle;
  compteur+=1;
  
}

void maFractale(int it, int IterationMax)
{
 sphere(diametre);
 if(it<IterationMax)
 {
   pushMatrix();  
      translate(diametre*(Redim*2+1),0,0);
      scale(Redim,Redim,Redim);
      rotateX(evolution*degre);
      rotateZ(evolution*degre);
      maFractale(it+1,IterationMax);
    popMatrix();

   pushMatrix();  
      translate(-diametre*(Redim*2+1),0,0);
      scale(Redim,Redim,Redim);
      rotateX(evolution*degre);
      rotateZ(-evolution*degre);
      maFractale(it+1,IterationMax);
    popMatrix(); 

   pushMatrix();  
      translate(0,diametre*(Redim*2+1),0);
      scale(Redim,Redim,Redim);
      rotateY(evolution*degre);
      rotateZ(evolution*degre);
      maFractale(it+1,IterationMax);
    popMatrix();

   pushMatrix();  
      translate(0,-diametre*(Redim*2+1),0);
      scale(Redim,Redim,Redim);
      rotateY(evolution*degre);
      rotateZ(-evolution*degre);
      maFractale(it+1,IterationMax);
    popMatrix();   
    
    
    
 }
}

void SauveCaptures()
{
  if(compteur<=NombreDeCaptures)
  {
    String zeros = "";
    if (EnregistrementCaptures == 1) 
    { 
      if (compteur < 1000000) {zeros = "0"; }
      if (compteur < 100000) {zeros = "00"; }
      if (compteur < 10000) {zeros = "000"; }
      if (compteur < 1000) {zeros = "0000"; }
      if (compteur < 100) {zeros = "00000"; }
      if (compteur < 10) {zeros = "000000"; } 
      save(""+DossierCaptures+"/"+NomCaptures+zeros+compteur+".png");
    }
  }
}
