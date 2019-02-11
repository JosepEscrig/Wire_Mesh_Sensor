function R=rotationMatrixGenerator(angle,mask)

a=(angle/360*2*pi);

n=size(mask,1);

R=zeros(n,n,n,n);

for i=1:n
    for j=1:n
        
        square1= polyshape([(i-n/2-1),(i-n/2-1),(i-n/2),(i-n/2)],...
            [(j-n/2-1),(j-n/2),(j-n/2),(j-n/2-1)]);
        squareR = rotate(square1,angle);
        
        Ro = [cos(a) -sin(a); sin(a) cos(a)];
        centre=[i-n/2-0.5,j-n/2-0.5]';
        centreR = Ro*centre;
        
        sx=ceil(centreR(1))+n/2;
        sy=ceil(centreR(2))+n/2;
        
        for x=sx-1:sx+1
            for y=sy-1:sy+1
                
                if x>0 && x<=n && y>0 && y<=n
                    if mask(x,y)~=255  
                        square2= polyshape([(x-n/2-1),(x-n/2-1),(x-n/2),(x-n/2)],...
                            [(y-n/2-1),(y-n/2),(y-n/2),(y-n/2-1)]);
                        cell=intersect(squareR,square2);
                        R(i,j,x,y)=area(cell); 
                    end
                end
                
            end
        end
        Sum=sum(sum(R(i,j,:,:)));
        if Sum<1 && Sum~=0
            R(i,j,:,:)=R(i,j,:,:)/Sum;
        end
        
    end
end
end
