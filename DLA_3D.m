clear
close all

n = 100; %Increasing the number of lattices n produces finer fractals, but the simulation time increases exponentially.

field = zeros(n,n,n);
first_particle = [n/2 n/2 n/2];
field(first_particle(1), first_particle(2) ,first_particle(3)) = 1;


% v = VideoWriter('DLA_3D.mp4','MPEG-4');
% open(v)

f = figure;
f.Color = 'k';
[a, b, c] = find(field);
s = scatter3(a,b,c,2,'filled');
axis([1 n 1 n 1 n])
daspect([1 1 1])
axis off
set(gca, 'LooseInset', get(gca, 'TightInset'));

[c1,c2,c3] = ndgrid(-1:1,-1:1,-1:1);
ptn = [c1(:),c2(:),c3(:)];

idx = ptn(:,1) == 0 & ptn(:,2) == 0 & ptn(:,3) == 0;
ptn = ptn(~idx,:);

attached = 0;

colormap(cool(n/2))
cmap = colormap;
color_store = cmap(1,:);
t = 0;
while 1
    theta = 2*pi*rand;
    phi = 2*pi*rand;
    diffuse_particle = [round((n/2.5)*sin(theta)*cos(phi)+first_particle(1),0) round((n/2.5)*sin(theta)*sin(phi)+first_particle(2),0) round((n/2.5)*cos(theta)+first_particle(3),0)];
    d = 0;
    while 1
        t = t + 1;
        if norm(first_particle-diffuse_particle) > (n/2.1)
            break
        end
        for iii = 1:26
            if field(diffuse_particle(1) + ptn(iii,1), diffuse_particle(2) + ptn(iii,2), diffuse_particle(3) + ptn(iii,3)) == 1
                d = 1;
                field(diffuse_particle(1), diffuse_particle(2), diffuse_particle(3)) = 1;
                break
            end
        end
        if d == 1
            break
        end
        direction = randi([1,26],1);
        vd = ptn(direction,:);
        diffuse_particle = diffuse_particle + vd;
    end
    
    if d == 1
        t
        t = 0;
        attached = attached + 1
        s.XData = [s.XData diffuse_particle(1)];
        s.YData = [s.YData diffuse_particle(2)];
        s.ZData = [s.ZData diffuse_particle(3)];
        distance = round(norm(diffuse_particle-first_particle),0);
        color_store = [color_store; cmap(distance,:)];
        s.CData = color_store;
        if mod(attached,100) == 0
            view(0,10)
%             frame = getframe(gcf);
%             writeVideo(v,frame);
            drawnow
        end
    end
    if attached > 1.5*n^2
        break
    end
    if norm(first_particle-diffuse_particle) > n/2.2 && d == 1
        1
        break
    end
end
for ii = 1:300
    view(1*ii,10)
%     frame = getframe(gcf);
%     writeVideo(v,frame);
    drawnow
end
% close(v)
