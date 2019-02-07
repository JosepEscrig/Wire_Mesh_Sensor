% Code to calculate the weight of each cell
% D is the diameter of the pipe
% p is the distance between wires
% n is the number of wires
% M is a n x n matrix containing the weight of each cell (area of the cell
% divided by the area of the pipe)


function M=weightsMatrixGenerator(D,p,n)

% define the area of the cross section of the pipe
x = 0; y = 0; r = D/2;  
th = 0:pi/50:2*pi;
xunit = r * cos(th) + x;
yunit = r * sin(th) + y;
circle = polyshape(xunit(1:end-1),yunit(1:end-1));

% calulate area of each cell
for i=1:n 
    for j=1:n  
       square= polyshape([(i-n/2-1)*p,(i-n/2-1)*p,(i-n/2)*p,(i-n/2)*p],...
           [(j-n/2-1)*p,(j-n/2)*p,(j-n/2)*p,(j-n/2-1)*p]);      
       cell=intersect(circle,square);
       areaCell(i,j)=area(cell);
    end
end

% cells which area is lower than p^2 are split in two and merged to the two
% closest cells in x and y directions
M=zeros(n,n);
for i=1:n/2  
    for j=1:n/2
       if areaCell(i,j)==0
           M(i,j)=M(i,j)+0;
       elseif areaCell(i,j)<p^2*2/3
           M(i,j)=M(i,j)+areaCell(i,j);
           M(i+1,j)=M(i+1,j)+M(i,j)/2;
           M(i,j+1)=M(i,j+1)+M(i,j)/2;
           M(i,j)=0;
       else
           M(i,j)=M(i,j)+areaCell(i,j);
       end   
    end
end

for i=1:n/2  
    for j=n:-1:n/2+1
       if areaCell(i,j)==0
           M(i,j)=M(i,j)+0;
       elseif areaCell(i,j)<p^2*2/3
           M(i,j)=M(i,j)+areaCell(i,j);
           M(i+1,j)=M(i+1,j)+M(i,j)/2;
           M(i,j-1)=M(i,j-1)+M(i,j)/2;
           M(i,j)=0;
       else
           M(i,j)=M(i,j)+areaCell(i,j);
       end   
    end
end

for i=n:-1:n/2+1
    for j=1:n/2
       if areaCell(i,j)==0
           M(i,j)=M(i,j)+0;
       elseif areaCell(i,j)<p^2*2/3
           M(i,j)=M(i,j)+areaCell(i,j);
           M(i-1,j)=M(i-1,j)+M(i,j)/2;
           M(i,j+1)=M(i,j+1)+M(i,j)/2;
           M(i,j)=0;
       else
           M(i,j)=M(i,j)+areaCell(i,j);
       end   
    end
end

for i=n:-1:n/2+1  
    for j=n:-1:n/2+1
       if areaCell(i,j)==0
           M(i,j)=M(i,j)+0;
       elseif areaCell(i,j)<p^2*2/3
           M(i,j)=M(i,j)+areaCell(i,j);
           M(i-1,j)=M(i-1,j)+M(i,j)/2;
           M(i,j-1)=M(i,j-1)+M(i,j)/2;
           M(i,j)=0;
       else
           M(i,j)=M(i,j)+areaCell(i,j);
       end   
    end
end

% areas of the cells are normalized by the area of the pipe
M=M/area(circle);

end

