
N=[ 5.1  12.6   4.6  23.0   3.9  11.5   5.7   7.8   2.7   3.1   4.2  14.3   3.1   6.4   3.7
  4.3  11.9   5.7  14.5   4.3   9.5   5.4   5.4   2.8   3.2   3.6   7.8   3.4   5.5   3.9
  5.1  13.3   5.8  13.3   4.4   9.6   5.6   5.3   3.1   3.3   4.4   6.3   4.3   6.2   4.5
  4.3   7.7   4.5   8.0   9.4   5.9   5.3   7.8   2.4   2.2   2.0  13.9   1.6   3.4   2.5
  5.1   5.5   5.8   5.6   4.6   3.5   5.1   4.8   2.6   4.6   4.6   6.3   4.8  13.4   9.5
];
N=N';

E=[ 3.7  15.7   4.5  14.6   3.0  11.0   4.7  13.2   3.2   4.0   3.8  23.1   6.0  12.0   5.8
  4.5  14.6   7.0  12.4   3.2  11.4   4.3   8.7   3.3   3.6   3.9  11.9   6.0  11.9   5.5
  8.2  14.4   6.2  10.9   3.1  13.0   4.4   8.1   3.3   3.8   3.7  11.2   6.0  12.6   5.5
  3.9   8.4   4.5   6.8   4.2   5.2   4.2  13.2   3.1   2.9   2.8  21.3   2.0   5.5   4.6
  2.8   2.7   3.1   4.0   2.2   2.0   2.3   2.9   2.6   2.8   2.9   4.7   2.5  11.8   6.3
];
E=E';

H=[6.4  20.6   6.4  27.8   5.2  16.1   7.5  16.1   4.2   6.9   5.7  24.3   6.8  13.7   6.8
  6.3  19.9   9.4  19.5   5.5  14.9   6.9  10.4   4.3   5.1   5.4  13.1   6.9  13.1   6.7
  8.0  20.2   8.8  17.3   5.5  16.2   7.1  10.5   4.5   5.2   5.9  13.6   7.4  14.1   7.0
  5.9  11.9   6.7  10.6  10.4   8.0   6.9  16.5   4.0   3.9   3.6  22.6   2.5   6.5   5.2
  6.0   6.2   6.6   7.1   5.3   4.1   5.6   6.0   3.7   5.7   5.5   7.7   5.5  17.9   9.2
];
H=H';

U=[ 7.8  18.8   8.6  46.6   9.7  43.6   9.6  22.3   6.8   6.7   6.8  28.7   7.8  16.3   7.9
  7.9  19.7   9.8  33.5   9.7  37.0   9.0  14.1   7.4   5.9   6.4  16.5   8.8  19.5   9.4
  8.1  20.8  10.1  34.0  10.0  39.2   9.0  13.2   7.1   5.8   6.3  14.2   9.0  20.6   9.2
  7.4  13.8   9.7  16.1  10.1  14.4   9.1  21.8   5.5   6.4   5.1  29.8   4.6  10.5   7.1
  8.2   6.6   9.9  11.2   8.2  10.9   7.9   4.8   7.2   4.6   7.9  10.4   4.5  19.5  22.1
];
U=U';



R=[   9.8  26.2  10.4  54.0  10.8  47.9  11.7  25.6   7.9   6.9   8.5  38.3  10.2  21.2   9.4
  9.8  25.2  12.9  34.5  11.0  40.2  10.8  16.5   8.5   7.2   8.2  20.4  11.1  23.5  10.9
 11.1  27.6  12.9  35.6  11.2  42.2  11.1  15.5   8.3   7.3   8.4  14.8  11.6  24.9  10.7
  9.2  17.4  11.4  17.9  14.4  16.3  10.9  25.4   6.7   7.3   6.0  38.1   5.1  12.2   8.3
 10.0   9.0  11.7  13.0   9.4  11.6   9.6   7.0   7.9   6.9   9.5  12.6   7.0  26.5  12.1
];
R=R';

figure(1)
set(gcf,'position',[500,200,1200,550]);  %图片大小

color=[0.2422    0.1504    0.6603;
     0.9242    0.0   0;
    0.1460    0.6091    0.9079;
     0.9892    0.9136    0.0;
    0.0433    0.7411    0.7394];

%H方向
axes2=axes('position',[0.05,0.81,0.9,0.17]); %这个是figure里面图的位置和大小，分别为离下边，左边的距离，还有图的高和宽
h=bar(H,'grouped');
% set(h(1),'FaceColor',color(1,:));
% set(h(2),'FaceColor',color(2,:));
% set(h(3),'FaceColor',color(3,:)); 
% set(h(4),'FaceColor',color(4,:));
% set(h(5),'FaceColor',color(5,:));
ylabel('Horzontal (cm)'); 
set( gca, 'xtick', [] ); %去掉x轴的刻度
set(gca,'YLim',[0 50]);%X轴的数据显示范围
tuli=legend('BDS-3(B1IB3I)','BDS(B1cB2a)','BDS(B1IB3I)','BDS(B1cB2a+B1cB3I)','GPS(L1L2)','location','northwest','Orientation','horizontal'); %图例
set(tuli,'FontSize',11.5);
set(gca,'YGrid','on'); %横格网
%虚线
Xlim =get(gca,'xlim');%画上短线
Ylim=get(gca,'ylim');
line([7.5 7.5],[0 Ylim(2)/3*5],'color','r','HandleVisibility','off','linestyle','--');



%R方向
axes1=axes('position',[0.05,0.62,0.9,0.17]); %这个是figure里面图的位置和大小，分别为离下边，左边的距离，还有图的高和宽
h=bar(R,'grouped');
% set(h(1),'FaceColor',color(1,:));
% set(h(2),'FaceColor',color(2,:));
% set(h(3),'FaceColor',color(3,:)); 
% set(h(4),'FaceColor',color(4,:));
% set(h(5),'FaceColor',color(5,:));
ylabel('3D (cm)'); 

set( gca, 'xtick', [] ); %去掉x轴的刻度
set(gca,'YLim',[0 50]);%X轴的数据显示范围
set(gca,'YGrid','on'); %横格网
%虚线
Xlim =get(gca,'xlim');%画上短线
Ylim=get(gca,'ylim');
line([7.5 7.5],[0 Ylim(2)/3*5],'color','r','HandleVisibility','off','linestyle','--');




% U方向
axes3=axes('position',[0.05,0.43,0.9,0.17]); %这个是figure里面图的位置和大小，分别为离下边，左边的距离，还有图的高和宽
h=bar(U,'grouped');
% set(h(1),'FaceColor',color(1,:));
% set(h(2),'FaceColor',color(2,:));
% set(h(3),'FaceColor',color(3,:)); 
% set(h(4),'FaceColor',color(4,:));
% set(h(5),'FaceColor',color(5,:));
ylabel('U (cm)'); 
set( gca, 'xtick', [] ); %去掉x轴的刻度
set(gca,'YLim',[0 50]);%X轴的数据显示范围
set(gca,'YGrid','on'); %横格网
%虚线
line([7.5 7.5],[0 Ylim(2)/3*5],'color','r','HandleVisibility','off','linestyle','--');


% E方向
axes4=axes('position',[0.05,0.24,0.9,0.17]); %这个是figure里面图的位置和大小，分别为离下边，左边的距离，还有图的高和宽
h=bar(E,'grouped');
% set(h(1),'FaceColor',color(1,:));
% set(h(2),'FaceColor',color(2,:));
% set(h(3),'FaceColor',color(3,:)); 
% set(h(4),'FaceColor',color(4,:));
% set(h(5),'FaceColor',color(5,:));
ylabel('E (cm)'); 
set( gca, 'xtick', [] ); %去掉x轴的刻度
set(gca,'YLim',[0 50]);%X轴的数据显示范围
set(gca,'YGrid','on'); %横格网
%虚线
line([7.5 7.5],[0 Ylim(2)/3*5],'color','r','HandleVisibility','off','linestyle','--');

% N方向
axes5=axes('position',[0.05,0.05,0.9,0.17]); 
h=bar(N,'grouped');
colormap jet(45)
% set(h(1),'FaceColor',color(1,:));
% set(h(2),'FaceColor',color(2,:));
% set(h(3),'FaceColor',color(3,:)); 
% set(h(4),'FaceColor',color(4,:));
% set(h(5),'FaceColor',color(5,:));
ylabel('N (cm)'); 
set(gca,'xtick',1:15,'XTickLabel',{'HOFN' 'QAQ1' 'REYK' 'SCOR' 'SOD3' 'THU2' 'OHI3' 'BILL' 'DJIG' 'GAMG' 'KRGG' 'LPGS' 'MCHL' 'MKEA' 'URUM'}); %横坐标
set(gca,'YLim',[0 50]);%X轴的数据显示范围
set(gca,'TickLength',[0 0.05]); %去掉短线
set(gca,'YGrid','on'); %横格网
set(get(gca,'XLabel'),'FontSize',34);
Ylim=get(gca,'ylim');
% line([Xlim(1) Xlim(2)*0.01],[Ylim(2)/7*2 Ylim(2)/7*2],'color','k');
% line([Xlim(1) Xlim(2)*0.01],[Ylim(2)/7*4 Ylim(2)/7*4],'color','k');
% line([Xlim(1) Xlim(2)*0.01],[Ylim(2)/7*6 Ylim(2)/7*6],'color','k');
% line([Xlim(2)*0.99 Xlim(2)],[Ylim(2)/7*2 Ylim(2)/7*2],'color','k');
% line([Xlim(2)*0.99 Xlim(2)],[Ylim(2)/7*4 Ylim(2)/7*4],'color','k');
% line([Xlim(2)*0.99 Xlim(2)],[Ylim(2)/7*6 Ylim(2)/7*6],'color','k');

line([Xlim(1) Xlim(2)*0.01],[Ylim(2)/5*2 Ylim(2)/5*2],'color','k');
line([Xlim(1) Xlim(2)*0.01],[Ylim(2)/5*4 Ylim(2)/5*4],'color','k');

%虚线
line([7.5 7.5],[0 Ylim(2)/3*5],'color','r','HandleVisibility','off','linestyle','--');







