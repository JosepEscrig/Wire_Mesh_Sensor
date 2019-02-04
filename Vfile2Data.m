% Josep Escrig
% University of Nottingham
% 20/06/2014

%Code to open .v files from  Wire Mesh sensor
%file is the .v file to be open
%n is the grid size (16,24,32,64 ...)
%Returns a Matrix A of dimensions n*n*number_of_frames

function A=Vfile2Data(file,n)

fid = fopen(file);

% Open and read the file
if fid == -1
    disp('File open not successful')
else
    S=fread(fid,inf,'*uint8');
end
closeresult = fclose(fid);
if closeresult == 0
    disp('File close successful')
else
    disp('File close not successful')
end

%number of frames in the file
n_frm = size(S,1)/n/n;

if n_frm~=round(n_frm)
    disp('Grid resolution do not match the size of the file')
    disp(['File ',file,' will not be open'])
    A=[];
else

%create the frames matrix
A=reshape(S,n,n,n_frm);
    
end

end
