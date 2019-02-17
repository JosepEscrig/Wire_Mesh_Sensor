% Code to save data processed in Matlab into .cdat files
% A is a 3D matrix with size n x n x number_of_frames
% output is the name of the output file ex:'C:\Users\Josep\Documents\test.v'

function Data2Cfile(A,output)

S=uint16(reshape(A,size(A,1)*size(A,2)*size(A,3),1,1));

fid=fopen(output,'w');

fwrite(fid,S,'*uint16');

fclose(fid)

end