clear
close all

n = 300; %Increasing the number of lattices n produces finer fractals, but the simulation time increases exponentially.


field = zeros(n,n);
first_particle = [n/2 n/2];
field(first_particle(1), first_particle(2)) = 1;


% v = VideoWriter('DLA_2D.mp4','MPEG-4');
% open(v)

f = figure;
f.Color = 'k';
[a, b] = find(field);
s = scatter(a,b,2,'filled');
axis([1 n 1 n])
daspect([1 1 1])
axis off
set(gca, 'LooseInset', get(gca, 'TightInset'));

[c1,c2] = ndgrid(-1:1,-1:1);
ptn = [c1(:),c2(:)];

idx = ptn(:,1) == 0 & ptn(:,2) == 0;
ptn = ptn(~idx,:);

attached = 0;

colormap(cool(n/2))
cmap = colormap;
color_store = cmap(1,:);
t = 0;
while 1
    theta = 2*pi*rand;
    diffuse_particle = [round((n/2.5)*cos(theta)+first_particle(1),0) round((n/2.5)*sin(theta)+first_particle(2),0)];
    d = 0;
    while 1
        t = t + 1;
        if norm(first_particle-diffuse_particle) > (n/2.1)
            break
        end
        for iii = 1:8
            if field(diffuse_particle(1) + ptn(iii,1), diffuse_particle(2) + ptn(iii,2)) == 1
                d = 1;
                field(diffuse_particle(1), diffuse_particle(2)) = 1;
                break
            end
        end
        if d == 1
            break
        end
        direction = randi([1,8],1);
        vd = ptn(direction,:);
        diffuse_particle = diffuse_particle + vd;
    end
    
    if d == 1
        t
        t = 0;
        attached = attached + 1
        s.XData = [s.XData diffuse_particle(1)];
        s.YData = [s.YData diffuse_particle(2)];
        distance = round(norm(diffuse_particle-first_particle),0);
        color_store = [color_store; cmap(distance,:)];
        s.CData = color_store;
        if mod(attached,10) == 0
%             frame = getframe(gcf);
%             writeVideo(v,frame);
            drawnow
        end
    end
    if norm(first_particle-diffuse_particle) > n/2.5 && d == 1
        1
        break
    end
end
% close(v)
