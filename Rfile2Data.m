% Only works for 32x32 wires sensors

function Data=Rfile2Data(imput)


fid = fopen(input);

% % % Open and read the file
if fid == -1
    disp('File open not successful')
else
    S=fread(fid,inf,'*uint32');
end
closeresult = fclose(fid);
if closeresult == 0
    disp('File close successful')
else
    disp('File close not successful')
end


% % % Create Data matrix
numFrames=size(S,1)/12/32;

Data=zeros(32,32,numFrames);

for f=1:numFrames
    
    Si=(f-1)*12*32;
    
    D=zeros(32,32);
    
    for y=1:32
        
        xi=(y-1)*12;
        
        W=dec2bin(S(1+Si+xi:12+Si+xi,:),32);
        
        D(1,y)=bin2dec([W(3,29:32) W(2,29:32) W(3,29:32)]);
        D(2,y)=bin2dec(W(1,17:28));
        D(3,y)=bin2dec(W(2,17:28));
        D(4,y)=bin2dec(W(3,17:28));
        D(5,y)=bin2dec([W(6,29:32) W(5,29:32) W(4,29:32)]);
        D(6,y)=bin2dec(W(4,17:28));
        D(7,y)=bin2dec(W(5,17:28));
        D(8,y)=bin2dec(W(6,17:28));
        
        D(9,y)=bin2dec([W(3,13:16) W(2,13:16) W(1,13:16)]);
        D(10,y)=bin2dec(W(1,1:12));
        D(11,y)=bin2dec(W(2,1:12));
        D(12,y)=bin2dec(W(3,1:12));
        D(13,y)=bin2dec([W(6,13:16) W(5,13:16) W(4,13:16)]);
        D(14,y)=bin2dec(W(4,1:12));
        D(15,y)=bin2dec(W(5,1:12));
        D(16,y)=bin2dec(W(6,1:12));
        
        D(17,y)=bin2dec([W(9,29:32) W(8,29:32) W(7,29:32)]);
        D(18,y)=bin2dec(W(7,17:28));
        D(19,y)=bin2dec(W(8,17:28));
        D(20,y)=bin2dec(W(9,17:28));
        D(21,y)=bin2dec([W(12,29:32) W(11,29:32) W(10,29:32)]);
        D(22,y)=bin2dec(W(10,17:28));
        D(23,y)=bin2dec(W(11,17:28));
        D(24,y)=bin2dec(W(12,17:28));
        
        D(25,y)=bin2dec([W(9,13:16) W(8,13:16) W(7,13:16)]);
        D(26,y)=bin2dec(W(7,1:12));
        D(27,y)=bin2dec(W(8,1:12));
        D(28,y)=bin2dec(W(9,1:12));
        D(29,y)=bin2dec([W(12,13:16) W(11,13:16) W(10,13:16)]);
        D(30,y)=bin2dec(W(10,1:12));
        D(31,y)=bin2dec(W(11,1:12));
        D(32,y)=bin2dec(W(12,1:12));
        
    end
    
    Data(:,:,f)=D;
    
end

end


