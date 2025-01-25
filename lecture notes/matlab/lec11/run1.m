clear;clc;

mdl="model1";
fname="../../img/"+mdl+".pdf";
open_system(mdl);
print(fname,'-dpdf','-bestfit',"-s"+mdl);
close_system(mdl);
dos("pdfcrop "+fname+" "+fname+" &");
