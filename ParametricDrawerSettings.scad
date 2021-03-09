/* [ Parametric 3 drawer box v.1 ]
written by: Hermes Alvarado <hermesalvarado@gmail.com
*/

//Define main dimensions:
thickness = 2 ;
bottomthickness = 2;
boxwidth = 180;
boxheight = 50;
boxdepth = 120;
tolerance = .4;
//Handle dimension:
handlewidth = 12;
handledepth = 6;
//Automatic definitions:
//holeheight = (boxheight/3)-(thickness*1.3333);
//holeheight = (boxheight)-(thickness*1.3333);
holeheight = (boxheight)-(thickness);
drawerwidth = boxwidth-(thickness*2)-(tolerance*2);
drawerheight = holeheight-tolerance*2;
drawerdepth = boxdepth-bottomthickness;
drawerpositionY = boxheight*.75+drawerdepth/2;
drawerpositionX = boxwidth*.75+drawerwidth/2;
