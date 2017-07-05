(* ::Package:: *)

(*martix*)
(*A={{1,0,0,0,2},{0,0,3,0,0},{0,0,0,0,0},{0,4,0,0,0}};*)
A=Import["A.txt","CSV"];
MatrixPlot[A]
(*transpose*)
AT=Transpose[A];
ata=AT.A;
aat=A.AT;
sigma=ConstantArray[0,{First@Dimensions[A],Last@Dimensions[A]}];

Dimensions[sigma];
(*caculate sigma*)
wtmp=Eigenvalues[N[ata]];
list=Sort[wtmp,Greater];
For[i=1,i<=First@Dimensions[A],i++,sigma[[i,i]]=N[Sqrt[wtmp[[i]]]];];
MatrixPlot[sigma]
(*caculate u*)
U=Transpose[Eigenvectors[N[aat],Last@Dimensions[aat]]];
MatrixPlot[U]
(*caculate v*)
V=Transpose[Eigenvectors[N[ata],Last@Dimensions[ata]]];
MatrixPlot[V]



