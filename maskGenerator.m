% code to generate the Mask matrix from the weights matrix

function mask=maskGenerator(M)

 mask=M
 mask(M==0)=255;
 mask(mask~=255)=0;
 
end