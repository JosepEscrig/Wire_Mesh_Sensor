% Code to save data processed in Matlab into .v files
% A is a 3D matrix with size n x n x number_of_frames
% output is the name of the output file ex:'C:\Users\Josep\Documents\test.v'

function Data2Vfile(A,output)

S=uint8(reshape(A,size(A,1)*size(A,2)*size(A,3),1,1));

fid=fopen(output,'w');

fwrite(fid,S,'*uint8');

fclose(fid)

end