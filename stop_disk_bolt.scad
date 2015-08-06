module tronc() {

// copia de variables modul barret
diam_extern=38.6;
alcada_cilindre_1=2.34;
diam_extern_2=33.38;
alcada_cilindre_2=0.5*(diam_extern-diam_extern_2)*tan(43);
diam_extern_3=19.8;
alcada_cilindre_3=0.5*(diam_extern_2-diam_extern_3)*tan(30);
smooth = 180;
// fi copia

diam_hexagon=21.38;
alcada_hexagon=13.5;
alcada_barret=alcada_cilindre_1+alcada_cilindre_2+alcada_cilindre_3;

translate ([0,0,-alcada_hexagon+alcada_barret]) cylinder(h=alcada_hexagon-alcada_cilindre_3,r=diam_hexagon/2,$fn=6);
}

module buit_tronc() {

// copia de variables modul barret
diam_extern=38.6;
alcada_cilindre_1=2.34;
diam_extern_2=33.38;
alcada_cilindre_2=0.5*(diam_extern-diam_extern_2)*tan(43);
diam_extern_3=19.8;
alcada_cilindre_3=0.5*(diam_extern_2-diam_extern_3)*tan(30);
smooth = 180;
// fi copia

diam_hexagon_2=17.5;
diam_cargol=16;
alcada_hexagon_2=11.28;
alcada_barret=alcada_cilindre_1+alcada_cilindre_2+alcada_cilindre_3;
pad = 0.1;
r=1;

difference () {
  translate ([0,0,-(alcada_hexagon_2-alcada_barret+1)]) cylinder(h=alcada_hexagon_2+3,r2=diam_hexagon_2/2,r1=diam_cargol/2,$fn=6);

translate ([0,0,-(alcada_hexagon_2-alcada_barret+1+pad)])  difference() {
   rotate_extrude(convexity=10,  $fn = 6) translate([diam_cargol/2-r+pad,-pad,0]) square(r+pad,r+pad);
   rotate_extrude(convexity=10,  $fn = 6) translate([diam_cargol/2-r+pad,r,0])	circle(r=r,$fn=4);
 }
} 
cylinder(h=40,r=10.1/2,center=true,$fn=smooth);

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

module aspes() {

// copia de variables modul barret
diam_extern=38.6;
alcada_cilindre_1=2.34;
diam_extern_2=33.38;
alcada_cilindre_2=0.5*(diam_extern-diam_extern_2)*tan(43);
diam_extern_3=19.8;
alcada_cilindre_3=0.5*(diam_extern_2-diam_extern_3)*tan(30);
smooth = 180;
// fi copia

intersection (){
  union() {
  cylinder(h=alcada_cilindre_1,r=diam_extern/2,$fn=smooth);
  translate([0,0,alcada_cilindre_1]) cylinder(h=alcada_cilindre_2,r1=diam_extern/2,r2=diam_extern_2/2,$fn=smooth);
  translate([0,0,alcada_cilindre_1+alcada_cilindre_2]) cylinder(h=5,2,r1=diam_extern_2/2,r2=diam_extern_3/2,$fn=smooth);
  }
  union() {
    translate ([0,0,(alcada_cilindre_1+alcada_cilindre_2)/2]) cube(size = [diam_extern,2.36,alcada_cilindre_1+alcada_cilindre_2], center = true);
    rotate ([0,0,120]) translate ([0,0,(alcada_cilindre_1+alcada_cilindre_2)/2]) cube(size = [diam_extern,2.36,alcada_cilindre_1+alcada_cilindre_2], center = true);
    rotate ([0,0,240]) translate ([0,0,(alcada_cilindre_1+alcada_cilindre_2)/2]) cube(size = [diam_extern,2.36,alcada_cilindre_1+alcada_cilindre_2], center = true);
  }
}
}

module buit_barret() {
diam_extern=35.5;
alcada_cilindre_1=0.9;
alcada_cilindre_2=3.98-alcada_cilindre_1;
diam_extern_2=diam_extern-2*(alcada_cilindre_2/tan(43));
smooth = 180;


translate([0,0,-0.1]) cylinder(h=alcada_cilindre_1,r=diam_extern/2,$fn=smooth);
translate([0,0,alcada_cilindre_1-0.2]) cylinder(h=alcada_cilindre_2,r1=diam_extern/2,r2=diam_extern_2/2,$fn=smooth);

}

smooth = 180;

difference (){
  union (){
    tronc();
    aspes();
    difference (){
      barret();
      buit_barret();
    }
  }
  buit_tronc();
}


