(* ::Package:: *)

(*Handle pattern*)
patternraw=ImageData[Import["1.png","PNG"]];
pattern=patternraw[[800;;1599,100;;399]];
output=ConstantArray[0,{First@Dimensions[patternraw],Last@Dimensions[patternraw]}];
(*Handle beamspot*)
beamspotraw=Import["BeamSpot.txt","Data"];
(*left 45 degree*)
beamspotrota=ImageData[ImageRotate[Image[beamspotraw],315]];
(*take 26*26 *)
beamspot=beamspotrota[[58;;83,59;;84]];
(*Handle output*)
prow=First@Dimensions[pattern];
pcol=Last@Dimensions[pattern];
(*set overlap 50% ,equel half of beamspot*)
is=13;
js=13;
For[i = 0, i < prow/is-2 , i++,
 For[j = 0, j < pcol/js-2 , j++,
  ois=i*is+1 ;
  oie=i*is+26;
  ojs=j*js+1;
  oje=j*js+26;
  checkpattern=pattern[[ois;;oie,ojs;;oje]];
(*Mean over 50% to set beamspot*)
  If [Mean[Mean[checkpattern]] > 0.5,
  output[[prow+ois;;prow+oie,pcol+ojs;;pcol+oje]] += beamspot;]
  ]];
MatrixPlot[output]






