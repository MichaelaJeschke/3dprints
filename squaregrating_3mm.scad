include <write.scad>
module write(word, h=h, t=t, rotate=rotate, center=center);
//das um write parameter nutzbar zu machen

p = 3; //groove width
w = 21; //breite loch
xpos = -9; //default pos erstes loch, nach einer ridge
ypos = -10;//pos kante, es ist offen aussen
zpos = 3;//loch fängt in der itte der z achse an
r = 1; //ridge width

//handle: 
//translate([2.5, 0, -30])
//cylinder(h = 30, d =10,$fn =20);

difference()
{
translate([-10, -10, -2])//location of plate
cube([25, 20, 8]); //plate
    translate([xpos, ypos, zpos]) //location of hole
    cube([p,w,3]); // object that will be the hole: size
    
    //groove width, breite mal so angesetzt, amplitude/groove depth(aus masterarbiet entonommen)
    
   
     translate([xpos+p+r, ypos, zpos]) //defines the ridge by defining the postion of the next hole
    //plus 3 width des anderen und 1 weil das die ridge width ist
    cube([p,w,3]); //shpuld be 3,30,3 eg//groove width, breite mal so angesetzt, amplitude/groove depth(aus masterarbiet entonommen)
    
    for (i = [2: 5])
    {  translate([xpos+i*(p+r), ypos, zpos]) 
      cube([p,w,3]);
    }
    
    translate([0.3, -2.3, -2])
    cube([4.5, 4.5, 3.5]); //loch für stäbchen
    
}




rotate(90,[1,0,0])
	{
	translate([5,5,0])
	write("1mm ridge width",h=2,t=0.4,center=false); //sth doesnt work here
	
	write("3mm depth",h=2,t=0.4,center=false);// with the h and t. doesnt print
    
    write("3mm groove width",h=2,t=0.4,center=false);// wstillnot with that ergänzung oben
    }

