clc;clear;

%正射投影
% m_proj('stereographic','lat',90','long',120','radius',33); 
% m_coast('patch','g'); 
% m_grid('box','fancy','tickdir','in'); 

    
    
%北极地区赤平投影
% m_proj('stereographic','lat',90,'long',30,'radius',55); 
% m_elev('contour',[-3500:1000:-500],'edgecolor','b'); 
% m_grid('xtick',12,'tickdir','out','ytick',[70 80],'linest','-'); 
% m_coast('patch',[.7 .7 .7],'edgecolor','r'); 

  
 
% m_proj('stereographic','lat',90,'long',30,'radius',25); 
% m_grid('box','fancy','tickdir','in'); 
% m_coast('patch','g','edgecolor','r');




% m_proj('robinson','long',[-180 180],'lat',[-90 90]);
% m_plot(lon,lat,'.','color','m');
% m_coast('patch',[.7 1 .7],'edgecolor','none'); % 海岸填充
% m_grid('box','fancy','linestyle','-','gridcolor','w','backcolor',[.2 .65 1]); % 边框属性

% 这个不错
% m_proj('Miller','long',[-180 180],'lat',[-90 90]);
% m_coast('patch','g','edgecolor','b'); % 海岸填充
% m_grid('box','fancy','linestyle','-','gridcolor','w','backcolor',[.2 .65 1]); % 边框属性

m_proj('Miller Cylindrical','long',[-180 185],'lat',[-89 90]);
m_coast('patch',[0 1 0],'edgecolor',[0.5 0.3 0.7]); % 海岸填充
m_grid('box','fancy','linestyle','-','gridcolor','w','backcolor',[.2 .65 1]); % 边框属性
hold on
lon=[ -15.198
-46.0477777780000
-21.9555000000000
-21.9503333330000 
  26.389277778 
 -69.8          
 -58.9         
 -118.07 
  42.847       
 127.920       
  70.256       
 -57.932       
 148.145       
-155.456       
  87.601       
];
lat=[  64.267305556 
  60.715277778 
  64.138777778 
  70.485333333 
  67.420777778 
  76.537051040 
 -63.321083333 
  33.578250000 
  11.526       
  35.590       
 -49.352       
 -34.907       
 -26.359       
  19.801       
  43.808       
];


m_plot(lon(1),lat(1),'.','color','r','MarkerSize',35);
h1=m_plot(lon(2),lat(2),'pentagram','color','r','MarkerSize',16);%++++++
set(h1,'MarkerFaceColor',get(h1,'color'));
h4=m_plot(lon(3),lat(3),'.','color','r','MarkerSize',35);
h2=m_plot(lon(4),lat(4),'pentagram','color','r','MarkerSize',16);%++++++
set(h2,'MarkerFaceColor',get(h2,'color'));
m_plot(lon(5),lat(5),'.','color','r','MarkerSize',35);
h3=m_plot(lon(6),lat(6),'pentagram','color','r','MarkerSize',16);%++++++
set(h3,'MarkerFaceColor',get(h3,'color'));
h6=m_plot(lon(7:15),lat(7:15),'.','color','r','MarkerSize',35);
ww=legend([h3,h6],'最多支持接收到PRN37','支持接收几乎所有BDS卫星'); %图例
set(ww,'FontSize',15);




place={'HOFN', 'QAQ1' 'REYK' 'SCOR' 'SOD3' 'THU2' 'OHI3' 'BILL' 'DJIG' 'GAMG' 'KRGG' 'LPGS' 'MCHL' 'MKEA' 'URUM'};

m_text(lon(1)+4,lat(1),sprintf(cell2mat(place(1))),'FontSize',15,'FontWeight','bold'); %HOFN
m_text(lon(2)-25,lat(2)-5,sprintf(cell2mat(place(2))),'FontSize',15,'FontWeight','bold');%QAQ1++
m_text(lon(3)-24,lat(3)+2,sprintf(cell2mat(place(3))),'FontSize',14,'FontWeight','bold');%REYK
m_text(lon(4),lat(4)+3,sprintf(cell2mat(place(4))),'FontSize',15,'FontWeight','bold');%SCOR++
m_text(lon(5),lat(5)+3,sprintf(cell2mat(place(5))),'FontSize',15,'FontWeight','bold'); %SOD3
m_text(lon(6)+4,lat(6),sprintf(cell2mat(place(6))),'FontSize',15,'FontWeight','bold'); %THU2++
m_text(lon(7)+4,lat(7),sprintf(cell2mat(place(7))),'FontSize',15,'FontWeight','bold'); %OHI3
m_text(lon(8)+4,lat(8),sprintf(cell2mat(place(8))),'FontSize',15,'FontWeight','bold'); %BILL
m_text(lon(9)+4,lat(9),sprintf(cell2mat(place(9))),'FontSize',15,'FontWeight','bold'); %DJIG
m_text(lon(10)+4,lat(10),sprintf(cell2mat(place(10))),'FontSize',15,'FontWeight','bold'); %GAMG
m_text(lon(11)+4,lat(11),sprintf(cell2mat(place(11))),'FontSize',15,'FontWeight','bold'); %KRGG
m_text(lon(12)+4,lat(12),sprintf(cell2mat(place(12))),'FontSize',15,'FontWeight','bold'); %LPGS
m_text(lon(13)+4,lat(13),sprintf(cell2mat(place(13))),'FontSize',15,'FontWeight','bold'); %MCHL
m_text(lon(14)+4,lat(14),sprintf(cell2mat(place(14))),'FontSize',15,'FontWeight','bold'); %MKEA
m_text(lon(15)+4,lat(15),sprintf(cell2mat(place(15))),'FontSize',15,'FontWeight','bold'); %URUM


