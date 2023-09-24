% function wanderPlanner()
close all;
clear all;
clc;

% grid size
size_grid_x=5;
size_grid_y=4;

%start node
start.y=4;
start.x=1;

%goal node
goal.y=2;
goal.x=5;

%building of the grid
ocuw(1:size_grid_y,1:size_grid_x,1:3)=ones(size_grid_y,size_grid_x,3);
% ocuw(4,3,:)=[0,0,0];%obstacle
% ocuw(3,2:3,:)=zeros(1,2,3);%obstacle
% ocuw(2,3,:)=[0,0,0];%obstacle
% ocuw(2,2,:)=[0,0,0];%obstacle

ocuw(start.y,start.x,:)=[0 0 1];%start
ocuw(goal.y,goal.x,:)=[0 0 1];%goal
figure,imshow(ocuw)

hold on

current=start;
while(true)
    randomNeighbor=getRandomNeighbor(current, size_grid_x,size_grid_y);
    current=randomNeighbor;
    ocuw(randomNeighbor.y,randomNeighbor.x,:)=[0 1 0];
    imshow(ocuw)
    if (current.x==goal.x && current.y==goal.y)
        sprintf('%s','sucess')
        return;
    end  
    
end
% end

function randomNeighbor=getRandomNeighbor(node, size_grid_x,size_grid_y);
px=randi(3,1,1)-2
randomNeighbor.x=node.x+px
while(randomNeighbor.x<1 || randomNeighbor.x>size_grid_x)
    px=randi(3,1,1)-2;
    randomNeighbor.x=node.x+px
end
py=randi(3,1,1)-2
randomNeighbor.y=node.y+py
while(randomNeighbor.y<1 || randomNeighbor.y>size_grid_y || (px==0 && py==0))
     py=randi(3,1,1)-2;
     randomNeighbor.y=node.y+py
end
end
