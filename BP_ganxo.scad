module base() {

ample=21;
fons=10.7;
smooth=60;
radi_1=1.9;
radi_2=2.46;


cube(size = [ample,fons,ample]);


}

module buit_base() {

ample_1=21;
ample=14.92;
fons=6.4;
gap=0.1;
smooth=60;
radi_intern=3.96/2;
fons_1=2.34;
profunditat_rosca=18.5;


translate([(ample_1-ample)/2,-gap,(ample_1-ample)/2]) cube(size = [ample,fons+gap,ample]);
}

module barret() {
diam_extern=38.6;
alcada_cilindre_1=2.34;
diam_extern_2=33.38;
alcada_cilindre_2=0.5*(diam_extern-diam_extern_2)*tan(43);
diam_extern_3=19.8;
alcada_cilindre_3=0.5*(diam_extern_2-diam_extern_3)*tan(30);
smooth = 180;

cylinder(h=alcada_cilindre_1,r=diam_extern/2,$fn=smooth);
translate([0,0,alcada_cilindre_1]) cylinder(h=alcada_cilindre_2,r1=diam_extern/2,r2=diam_extern_2/2,$fn=smooth);
translate([0,0,alcada_cilindre_1+alcada_cilindre_2]) cylinder(h=5,2,r1=diam_extern_2/2,r2=diam_extern_3/2,$fn=smooth);

}

module rosca() {

ample=21;
fons=6.4;
profunditat=23.44;
fons_1=2.34;
radi_extern=8.34/2;
radi_intern=3.96/2;
diferencia_radi_extern_2=5.18;
radi_extern_2=ample/2-diferencia_radi_extern_2;
profunditat_rosca=18.5;
gap=0.1;
smooth=120;

translate ([ample/2,fons_1,ample/2]) rotate ([270,0,0]) cylinder(h=(profunditat-fons_1)-radi_extern_2,r=radi_extern,$fn=smooth);
translate ([ample/2,fons+gap,ample/2]) rotate ([270,0,0]) cylinder(h=(((profunditat-fons)-gap)-radi_extern_2),r=radi_extern_2,$fn=smooth);
translate ([ample/2,profunditat-radi_extern_2,ample/2]) sphere(r=radi_extern_2, $fn=smooth);
 
}

module buit_rosca() {

ample=21;
fons=6.4;
profunditat=23.44;
fons_1=2.34;
radi_extern=8.34/2;
radi_intern=3.96/2;
diferencia_radi_extern_2=5.18;
radi_extern_2=ample/2-diferencia_radi_extern_2;
profunditat_rosca=18.5;
gap=0.1;
smooth=120;

  translate ([ample/2,fons_1-1,ample/2]) rotate ([270,0,0]) cylinder(h=profunditat_rosca-fons_1+1,r=radi_intern,$fn=smooth);

}

smooth = 180;

difference (){
  union () {
    difference (){
      base();  
      buit_base();
    }  
    rosca();
  }
  buit_rosca();
}



