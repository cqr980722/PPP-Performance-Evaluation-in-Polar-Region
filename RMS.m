clc;
clear;

N=[  0.3   0.5   0.3   0.3   0.7   1.0   1.3   0.5   0.8   1.0   0.9   2.0   0.2   0.7   0.7
  0.3   0.5   0.4   0.4   0.7   1.0   1.3   0.5   0.8   0.9   0.9   1.3   0.3   0.8   0.6
  0.4   0.5   0.4   0.3   0.6   1.0   1.3   0.5   0.7   0.9   0.9   1.2   0.3   0.8   1.2
  0.3   0.4   0.3   0.5   0.6   0.7   1.2   0.5   0.7   0.5   0.8   2.0   0.2   0.5   1.1
  0.2   0.5   0.3   0.4   0.3   0.2   0.2   0.1   0.4   0.3   0.4   0.3   0.3   0.2   0.3
];
N=N';

E=[1.2   1.3   1.3   1.1   0.8   0.9   0.7   1.0   0.6   0.8   0.6   2.1   0.5   1.0   0.5
  1.1   1.3   1.3   1.3   0.7   1.0   0.7   1.1   0.6   0.6   0.6   1.4   0.6   0.9   0.4
  1.0   1.3   1.3   1.3   0.7   1.0   0.7   1.1   0.6   0.6   0.7   0.9   0.6   0.9   0.9
  1.0   1.0   1.0   0.7   0.4   1.0   0.7   1.0   0.5   0.5   0.5   2.1   0.5   1.0   0.5
  0.2   0.4   0.4   0.2   0.2   0.3   0.3   0.5   0.3   0.3   0.5   0.3   0.4   0.4   0.5
];
E=E';

H=[1.3   1.4   1.4   1.1   1.0   1.4   1.5   1.1   0.9   1.3   1.1   2.9   0.6   1.2   0.9
  1.1   1.3   1.3   1.3   1.0   1.4   1.5   1.2   1.0   1.1   1.1   1.9   0.7   1.2   0.7
  1.1   1.3   1.4   1.4   1.0   1.4   1.4   1.2   0.9   1.1   1.1   1.6   0.6   1.2   1.5
  1.0   1.1   1.1   0.9   0.7   1.2   1.4   1.1   0.8   0.7   0.9   2.9   0.5   1.1   1.1
  0.3   0.6   0.5   0.4   0.4   0.4   0.4   0.6   0.6   0.4   0.6   0.4   0.5   0.5   0.6 
];
H=H';

U=[0.8   1.3   0.8   1.7   2.6   1.5   3.1   2.9   1.4   1.5   1.6   3.4   1.2   1.6   1.5
  1.0   2.7   0.9   2.0   0.9   1.0   2.7   1.7   1.7   1.6   2.1   1.9   1.6   1.8   1.7
  1.6   2.6   1.4   2.3   0.9   0.9   2.3   1.7   1.8   2.2   2.8   3.5   1.6   1.6   2.3
  0.9   2.0   1.3   2.5   2.5   1.9   2.6   2.5   1.6   2.2   2.0   3.3   0.6   1.3   1.1
  0.5   0.4   0.6   0.7   0.8   0.4   1.8   0.6   0.6   0.5   0.9   0.8   0.5   0.4   0.8 
];
U=U';



R=[1.5   1.9   1.6   2.0   2.8   2.0   3.4   3.1   1.7   1.9   2.0   4.4   1.3   2.0   1.8
  1.5   3.0   1.6   2.4   1.3   1.7   3.0   2.1   2.0   2.0   2.4   2.7   1.8   2.1   1.8
  1.9   3.0   2.0   2.6   1.3   1.7   2.7   2.1   2.0   2.5   3.0   3.8   1.8   2.0   2.8
  1.4   2.3   1.7   2.6   2.5   2.2   3.0   2.8   1.8   2.3   2.2   4.4   0.8   1.7   1.6
  0.6   0.7   0.7   0.8   0.9   0.6   1.8   0.9   0.8   0.6   1.1   0.8   0.7   0.6   1.0
];
R=R';

figure(1)
set(gcf,'position',[500,200,1200,550]);  %ͼƬ��С

color=[0.2422    0.1504    0.6603;
     0.9242    0.0   0;
    0.1460    0.6091    0.9079;
     0.9892    0.9136    0.0;
    0.0433    0.7411    0.7394];

%H����
axes2=axes('position',[0.05,0.81,0.9,0.17]); %�����figure����ͼ��λ�úʹ�С���ֱ�Ϊ���±ߣ���ߵľ��룬����ͼ�ĸߺͿ�
h=bar(H,'grouped');
% set(h(1),'FaceColor',color(1,:));
% set(h(2),'FaceColor',color(2,:));
% set(h(3),'FaceColor',color(3,:)); 
% set(h(4),'FaceColor',color(4,:));
% set(h(5),'FaceColor',color(5,:));
ylabel('Horzontal (cm)'); 
set( gca, 'xtick', [] ); %ȥ��x��Ŀ̶�
set(gca,'YLim',[0 5]);%X���������ʾ��Χ
tuli=legend('BDS-3(B1IB3I)','BDS(B1cB2a)','BDS(B1IB3I)','BDS(B1cB2a+B1cB3I)','GPS(L1L2)','location','northwest','Orientation','horizontal'); %ͼ��
set(tuli,'FontSize',11.5);
set(gca,'YGrid','on'); %�����
%����
Xlim =get(gca,'xlim');%���϶���
Ylim=get(gca,'ylim');
line([7.5 7.5],[0 Ylim(2)/3*5],'color','r','HandleVisibility','off','linestyle','--');



%R����
axes1=axes('position',[0.05,0.62,0.9,0.17]); %�����figure����ͼ��λ�úʹ�С���ֱ�Ϊ���±ߣ���ߵľ��룬����ͼ�ĸߺͿ�
h=bar(R,'grouped');
% set(h(1),'FaceColor',color(1,:));
% set(h(2),'FaceColor',color(2,:));
% set(h(3),'FaceColor',color(3,:)); 
% set(h(4),'FaceColor',color(4,:));
% set(h(5),'FaceColor',color(5,:));
ylabel('3D (cm)'); 

set( gca, 'xtick', [] ); %ȥ��x��Ŀ̶�
set(gca,'YLim',[0 5]);%X���������ʾ��Χ
set(gca,'YGrid','on'); %�����
%����
Xlim =get(gca,'xlim');%���϶���
Ylim=get(gca,'ylim');
line([7.5 7.5],[0 Ylim(2)/3*5],'color','r','HandleVisibility','off','linestyle','--');




% U����
axes3=axes('position',[0.05,0.43,0.9,0.17]); %�����figure����ͼ��λ�úʹ�С���ֱ�Ϊ���±ߣ���ߵľ��룬����ͼ�ĸߺͿ�
h=bar(U,'grouped');
% set(h(1),'FaceColor',color(1,:));
% set(h(2),'FaceColor',color(2,:));
% set(h(3),'FaceColor',color(3,:)); 
% set(h(4),'FaceColor',color(4,:));
% set(h(5),'FaceColor',color(5,:));
ylabel('U (cm)'); 
set( gca, 'xtick', [] ); %ȥ��x��Ŀ̶�
set(gca,'YLim',[0 5]);%X���������ʾ��Χ
set(gca,'YGrid','on'); %�����
%����
line([7.5 7.5],[0 Ylim(2)/3*5],'color','r','HandleVisibility','off','linestyle','--');


% E����
axes4=axes('position',[0.05,0.24,0.9,0.17]); %�����figure����ͼ��λ�úʹ�С���ֱ�Ϊ���±ߣ���ߵľ��룬����ͼ�ĸߺͿ�
h=bar(E,'grouped');
% set(h(1),'FaceColor',color(1,:));
% set(h(2),'FaceColor',color(2,:));
% set(h(3),'FaceColor',color(3,:)); 
% set(h(4),'FaceColor',color(4,:));
% set(h(5),'FaceColor',color(5,:));
ylabel('E (cm)'); 
set( gca, 'xtick', [] ); %ȥ��x��Ŀ̶�
set(gca,'YLim',[0 5]);%X���������ʾ��Χ
set(gca,'YGrid','on'); %�����
%����
line([7.5 7.5],[0 Ylim(2)/3*5],'color','r','HandleVisibility','off','linestyle','--');

% N����
axes5=axes('position',[0.05,0.05,0.9,0.17]); 
h=bar(N,'grouped');
colormap jet(45)
% set(h(1),'FaceColor',color(1,:));
% set(h(2),'FaceColor',color(2,:));
% set(h(3),'FaceColor',color(3,:)); 
% set(h(4),'FaceColor',color(4,:));
% set(h(5),'FaceColor',color(5,:));
ylabel('N (cm)'); 
set(gca,'xtick',1:15,'XTickLabel',{'HOFN' 'QAQ1' 'REYK' 'SCOR' 'SOD3' 'THU2' 'OHI3' 'BILL' 'DJIG' 'GAMG' 'KRGG' 'LPGS' 'MCHL' 'MKEA' 'URUM'}); %������
set(gca,'YLim',[0 5]);%X���������ʾ��Χ
set(gca,'TickLength',[0 0.05]); %ȥ������
set(gca,'YGrid','on'); %�����
set(get(gca,'XLabel'),'FontSize',34);
Ylim=get(gca,'ylim');
% line([Xlim(1) Xlim(2)*0.01],[Ylim(2)/7*2 Ylim(2)/7*2],'color','k');
% line([Xlim(1) Xlim(2)*0.01],[Ylim(2)/7*4 Ylim(2)/7*4],'color','k');
% line([Xlim(1) Xlim(2)*0.01],[Ylim(2)/7*6 Ylim(2)/7*6],'color','k');
% line([Xlim(2)*0.99 Xlim(2)],[Ylim(2)/7*2 Ylim(2)/7*2],'color','k');
% line([Xlim(2)*0.99 Xlim(2)],[Ylim(2)/7*4 Ylim(2)/7*4],'color','k');
% line([Xlim(2)*0.99 Xlim(2)],[Ylim(2)/7*6 Ylim(2)/7*6],'color','k');
line([Xlim(1) Xlim(2)*0.01],[Ylim(2)*2/5 Ylim(2)*2/5],'color','k');
line([Xlim(2)*0.99 Xlim(2)],[Ylim(2)*2/5 Ylim(2)*2/5],'color','k');
%����
line([7.5 7.5],[0 Ylim(2)/3*5],'color','r','HandleVisibility','off','linestyle','--');







