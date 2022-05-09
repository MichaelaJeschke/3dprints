

//handle: 
//translate([12.5, 10, -30])
//cylinder(h = 30, d =10,$fn =20); //handle

translate([12.5, 10, 5])
cylinder(h =3, d =3,$fn =40); //support


difference()
{
translate([-0, -0, -3]) //postion platte im koordinatensystem
cube([25, 20, 8]); //2.5cm mal lang, 2 breit, 0,5dick 
    
    translate([10.2, 7.7, -3])
       cube([4.5, 4.5, 3.5]);
    
}




translate([12.5, 10, 8]) //position penöppel, 10 einfach mal al abstand zum rand gesagt, 19,5 ist die mitte(außenkante, daher 0.5 weniger, 3 damit es drinsteckt zur isocher?
cylinder(h = 7, d =1,$fn =40);//DIAMETER 1mm, höhe mal auf 3 gesetzt 
// cylinder braucht iwie keine eckige klammer dazu anscheinend. 

//2x2x3 öffnugn für stäbchen, minimal größer evtl
