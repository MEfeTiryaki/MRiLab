%Dipole
close all
clear
clc
mup=1e-7;
m=0.1;
tic
x1=-0.04:0.001:0.04;
y1=-0.04:0.001:0.04;
z1=-0.04:0.001:0.04;
[x,y,z]=meshgrid(x1,y1,z1);
B=B_dipole([0,0,0,0,0,m], [x(:),y(:),z(:)]);
toc
figure(1)
quiver3(x(:),y(:),z(:),B(:,1),B(:,2),B(:,3),5);
axis([-0.005 0.005 -0.005 0.005 -0.005 0.005])
xlabel("x")
ylabel("y")
zlabel("z")

B1=reshape(B,[length(x1),length(y1),length(z1),3]);
figure(2)
quiver3(x,y,z,squeeze(B1(:,:,:,1)),squeeze(B1(:,:,:,2)),squeeze(B1(:,:,:,3)),1);
axis([-0.005 0.005 -0.005 0.005 -0.005 0.005])
xlabel("x")
ylabel("y")
zlabel("z")
