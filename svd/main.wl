(* ::Package:: *)

(*martix *)
A={{1,0,0,0,2},{0,0,3,0,0},{0,0,0,0,0},{0,4,0,0,0}};
(*A={{73,38,20},{72,72,96},{98,49,37}}*)
(*A = Import["A.txt", "CSV"];*)
(*transpose *)
AT=Transpose[A];


ata=AT.A;
aat=A.AT;
sigma=ConstantArray[0,{First@Dimensions[A],Last@Dimensions[A]}];
Dimensions[sigma];


(*caculate sigma*)
wtmp=Eigenvalues[N[ata]];
list=Sort[wtmp, Greater];
For[i = 1, i <= First@Dimensions[A], i++,
sigma[[i,i]]=N[Sqrt[wtmp[[i]]]];];
(*caculate u*)
U=Transpose[Eigenvectors[N[aat],Last@Dimensions[aat]]];
(*caculate v*)
V=Transpose[Eigenvectors[N[ata],Last@Dimensions[ata]]];
U
sigma
V
U.sigma.Transpose[V]










