m1=12.76;
m2=17.26;
m3=8.84;
m4=21.70;
m5=9.80;
res=120;
round=3;
pad=0.1;
rosca=5.30;

difference(){
union() {
  hull() {
    translate([(m4-m1)/2,0,0]) sphere(d=m1,$fn=res);
    translate([-(m4-m1)/2,0,0])sphere(d=m1,$fn=res);
  }
//  rotate([0,90,0])cylinder(d=m1,h=m4-m1,$fn=res,center=true); 

  intersection() {
    translate([0,0,(m2-(m1/2))/2]) cube(size=[m5,m3,m2-(m1/2)],center=true);
    difference() {
      translate([0,0,(m2-(m1/2))/2]) cylinder(d=m5,h=m2-(m1/2),$fn=res,center=true);
      difference() { 
        rotate_extrude(convexity=10, $fn=res) translate([(m5/2-round/2)+round/6,m2-m1/2-round/3,0]) square(1+pad);
        rotate_extrude(convexity=10, $fn=res) translate([(m5/2-round/2)+round/6,m2-m1/2-round/3,0]) circle(r=1,$fn=res);
      }
    }
  }
}
cylinder(d=rosca,h=m2*1.5,$fn=res,center=true);
}


