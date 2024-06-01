clear
close all

n = 100; %Increasing the number of lattices n produces finer fractals, but the simulation time increases exponentially.


field = zeros(n,n);
field(n/2,end) = 1;

% v = VideoWriter('DLA_lighting.avi','Uncompressed AVI');
% open(v)

f = figure;
f.Color = 'k';
hold on
[X, Y] = find(field);
A = 0;
G = graph(A);

alpha = [0.01 0.1 0.7];
width = [5 1 0.5];
for i = 1:length(width)
    Gplot(i) = plot(G,'XData',X,'YData',Y,'LineWidth',width(i));
    Gplot(i).NodeColor = "none";
    Gplot(i).NodeLabel = {};
    Gplot(i).EdgeLabel = {};
    Gplot(i).EdgeColor = 'w';
    Gplot(i).EdgeAlpha = alpha(i);
end
hold off

axis([1 n 1 n])
daspect([1 1 1])
axis off
set(gca, 'LooseInset', get(gca, 'TightInset'));


[c1,c2] = ndgrid(-1:1,-1:1);
ptn = [c1(:),c2(:)];

idx = ptn(:,1) == 0 & ptn(:,2) == 0;
ptn = ptn(~idx,:);

attached = 0;

t = 0;
while 1
    diffuse_particle = [round(n*rand,0) n/10];
    d = 0;
    while 1
        t = t + 1;
        if diffuse_particle(1) > n-1
            break
        elseif diffuse_particle(1) < 2
            break
        elseif diffuse_particle(2) > n-1
            break
        elseif diffuse_particle(2) < 2
            break
        end
        for iii = 1:length(idx)-1
            if field(diffuse_particle(1) + ptn(iii,1), diffuse_particle(2) + ptn(iii,2)) == 1
                d = 1;
                field(diffuse_particle(1), diffuse_particle(2)) = 1;
                break
            end
        end
        if d == 1
            break
        end
        direction = randi([1,length(idx)-1],1);
        vd = ptn(direction,:);
        diffuse_particle = diffuse_particle + vd;
    end
    
    if d == 1
        t
        t = 0;
        attached = attached + 1
        X = [X diffuse_particle(1)];
        Y = [Y diffuse_particle(2)];
        idx_str = find(diffuse_particle(1) + ptn(iii,1) == X & diffuse_particle(2) + ptn(iii,2) == Y);
        A(end+1,idx_str) = 1;
        A(idx_str,end+1) = 1;
        G = graph(A);
        if mod(attached,100) == 0
            hold on
            for i = 1:length(width)
                Gplot(i) = plot(G,'XData',X,'YData',Y,'LineWidth',width(i)*0.99999^attached);
                Gplot(i).NodeColor = "none";
                Gplot(i).NodeLabel = {};
                Gplot(i).EdgeLabel = {};
                Gplot(i).EdgeColor = 'w';
                Gplot(i).EdgeAlpha = alpha(i);
            end
            hold off
            axis([1 n 1 n])
            daspect([1 1 1])
            axis off
            set(gca, 'LooseInset', get(gca, 'TightInset'));
            
%             frame = getframe(gcf);
%             writeVideo(v,frame);
            drawnow
        end
    end
    if diffuse_particle(2) < n/8 && d == 1
        break
    end
end
% close(v)
