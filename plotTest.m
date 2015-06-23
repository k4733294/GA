function plotTest()
px = linspace(1,1000,2000);
py = linspace(1,1,150);
%pz = randi(100,150,2000);
pz = randi(100,1,2000);
figure(3)
p = plot(1,1);
for i = 1 : 2000
    %hold on
    figure(3)
    title('TotalFitnessRevo')
    xlabel('GenTimes') % x-axis label
    ylabel('TotalFitnessScore') % y-axis label
    plot(px,pz(1,:));
    %hold off
    drawnow
    disp(i);
end
figure(1)

