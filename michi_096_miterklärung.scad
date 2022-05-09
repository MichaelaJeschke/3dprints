include <write.scad>

y=23; // anzahl bildpunkte
n=25.4/600; // auflösung des computers, soundsoviele bildpunkte auf soundsoviel inches
n_z=0.016;  //ka aber scheint net wichtig zu sein

echo (n);

g=y*n; // g gibt die HALF PERIOD an. man variiere y um frequenz zu ändern (nur ganzzahlen)


ds=-0.01;

function f_xy(in)=ceil(in/n-0.5)*n;
function f_z (in)=ceil(in/n_z-0.5)*n_z;

amp=0.3; // Amplitude
thick = 4;  // Thickness of Stimulus
echo ("Amplitude:", amp);

l=120;
echo ("Length:", l);
z=2*ceil(l/(2*g));
echo ("Grating: ", g);
 
w=120;// Breite

D=90.72; // Durchmesser Scheibe

difference(){ // schneidet Löcher aus Texturscheibe
    union() { // Verbindet Rand und Texturscheibe 
 difference(){ // Schneidet Scheibe aus Textur 

union(){ // macht Textur 
	

translate ([-5,-5,0])
cube ([g*z, f_xy(w), thick-amp], center = false); // Macht den Boden unter der Textur

	for (x = [0:g*2:g*z]) render() // Aaron
	{
		

	for (i= [n:n:g*2 ]) render() // Aaron
	 {
	
		
  	translate([x+i-n, 0, thick-amp-1]) // Hier Null Aaron 

  polyhedron(
  points=[ [0,0,0],[0,f_xy(w),0],[n-ds,0,0],[n-ds,f_xy(w),0],   // the four points at base
            [0,0,(sin((i-n)/(2*g)*360+90)+1)/2*amp+1],
            [0,f_xy(w),(sin((i-n)/(2*g)*360+90)+1)/2*amp+1],
            [n-ds,0,(sin(i/(2*g)*360+90)+1)/2*amp+1],
            [n-ds,f_xy(w),(sin(i/(2*g)*360+90)+1)/2*amp+1] ], 
    // the four points at top 
         
	  faces=[ [2,3,1,0],[4,5,7,6],	// top & bottom
			  [1,5,4,0],[2,6,7,3],	//front & back
              [0,4,6,2],[3,7,5,1]
		
	]              
 	); 
	
	

	}		
	}
	
}



difference(){ // (Quadar - Scheibe) 

translate([D/2,D/2,thick/2])
cube([l+40,l+40,thick+10],center = true);
translate([D/2,D/2,thick/2])
cylinder(h=thick+5,r=D/2,center = true,$fs=0.01);;
}
}


union(){
difference(){ //Rand
translate([D/2,D/2,thick/2])
cylinder(h=thick,r=D/2+8,center = true,$fs=0.01); // vorher r=47 rand=3mm

translate([D/2,D/2,thick/2])
cylinder(h=thick+10,r=D/2,center = true,$fs=0.01);
}
difference(){
translate([D/2,D/2-5/2,0])
cube([D/2+8+10,5,thick-amp], center=false) // Stab der rausschaut
translate([D/2,D/2,thick/2])
cylinder(h=thick,r=D/2+3,center = true,$fs=0.01);
}
}

}
union(){ // Löcher
translate([D/2,D/2,0])
for(ax=[0:15:90])
rotate(a=ax,v=[0,0,1]){
union(){
for(l=[-42.64:42.64:42.64])
{translate([l,0,-0.1])// Aaron hier nicht direkt überschneiden
cylinder(h=2.7, r=2, center=false,$fs=0.01);
translate([0,l,-0.1]) // Aaron hier nicht direkt überschneiden
cylinder(h=2.7, r=2, center=false,$fs=0.01);
}
}
}

for(l=[2.72:42.64:88]) // Setzt mittelpunkt und 90° Löcher
{translate([l,45.36,0])
cylinder(h=2.5, r=2, center=false,$fs=0.01);
translate([45.36,l,0])
cylinder(h=2.5, r=2, center=false,$fs=0.01);
}
 


translate([20,D/2-10,0.1])
{
	rotate([90,0,90])
{
	rotate(90,[1,0,0])
	{
	translate([0.0,5,0]) // Stimuli Parameter
	write("90.72 diameter",h=2,t=0.4,center=false);
	write("0.96 sine - 0.300 depth",h=2,t=0.4,center=false);
}
}
}


}   



}


