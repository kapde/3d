
module example005()
{
  smooth=180;
  pad=0.1;
  r=15-13;
  cr=24/2;
  alcada=101;


  difference(){
    difference () 
      cylinder(h = alcada, r = 24/2, $fn = 12);
    union(){
    translate ([0,0,-10]) cylinder(h = 120, r = 16/2, $fn = 12);
    translate ([0,0,10]) rotate_extrude(convexity=10,  $fn = smooth) translate([cr-r+pad,-pad,0]) square(3*r+pad,r+pad);
    translate ([0,0,alcada-15]) rotate_extrude(convexity=10,  $fn = smooth) translate([cr-r+pad,-pad,0]) square(3*r+pad,r+pad);    
    }
  }
translate ([0,0,alcada-r/1.1]) rotate_extrude(convexity=10,  $fn = smooth) translate([16/2+pad,-pad,0]) circle(r=r,$fn=4);
}


difference () {
  example005();
  translate ([-15,0,-10]) cube([30,12,120]);
}
