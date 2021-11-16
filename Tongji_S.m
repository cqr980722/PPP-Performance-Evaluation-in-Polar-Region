clc;
clear all;

Data_onestation=zeros(5,12);
for i=1:15
   Data_tongji(:,:,i)=Data_onestation;%前面的5是频点，中间的是(N E H U R   N E H U R  PDOP AVERN)，后面的是15个站
end
for pp=1:15 %15个站
    for bb=1:5 %5个频点

   place={'HOFN', 'QAQ1' 'REYK' 'SCOR' 'SOD3' 'THU2' 'OHI3' 'BILL' 'DJIG' 'GAMG' 'KRGG' 'LPGS' 'MCHL' 'MKEA' 'URUM'};
   
   combination={'BD3_B1IB3I_PPP' 'BDS_IF1IF2_PPP' 'BDS_B1CB2A_PPP'  'BDS_B1IB3I_PPP' 'GPS_PPP_______'};
   
    %创建需要读取的文件
    sw='F:\极区导航\analysis\HOFN\HOFN_BDS_B1IB3I_PPP.txt';
    sw(18:21)=cell2mat(place(pp));
    sw(23:26)=cell2mat(place(pp));
    sw(28:41)=cell2mat(combination(bb));
    fprintf('%s\n',sw);
    
    %创建即将写入的文件
    so='F:\极区导航\analysis.txt';
    
    %打开需要读取的文件
    fid = fopen(sw,'r');
    
    %读取需要的数据到数组中
    while ~feof(fid)
        %逐行读取
        s = fgetl(fid);
        %遇见"30天平均："跳出循环
        if strcmp(s(1:6),'30天平均：')
            %读收敛时间
            Converge=regexp(s(15:60),'    ','split');
            Data_tongji(bb,1,pp)=str2num(cell2mat(Converge(1)));
            Data_tongji(bb,2,pp)=str2num(cell2mat(Converge(2)));
            Data_tongji(bb,3,pp)=str2num(cell2mat(Converge(3)));
            Data_tongji(bb,4,pp)=str2num(cell2mat(Converge(4)));
            Data_tongji(bb,5,pp)=str2num(cell2mat(Converge(5)));
            
            %读rms
            RMS=regexp(s(74:113),'   ','split');
            Data_tongji(bb,6,pp)=str2num(cell2mat(RMS(1)));
            Data_tongji(bb,7,pp)=str2num(cell2mat(RMS(2)));
            Data_tongji(bb,8,pp)=str2num(cell2mat(RMS(3)));
            Data_tongji(bb,9,pp)=str2num(cell2mat(RMS(4)));
            Data_tongji(bb,10,pp)=str2num(cell2mat(RMS(5)));
            
            %读PDOP AVERN
            PN=regexp(s(124:143),'      ','split');
            Data_tongji(bb,11,pp)=str2num(cell2mat(PN(1)));
            Data_tongji(bb,12,pp)=str2num(cell2mat(PN(2)));
            break;
        end
    end
    fclose(fid);
    end
end

    
%打开需要写入的文件
fid2 = fopen(so,'w');
for pp=1:15 %15个站
    for bb=1:5 %5个频点
    %输出统计数据
    fprintf(fid2,'%s%s         %5.1f %5.1f %5.1f %5.1f %5.1f     ',cell2mat(place(pp)),cell2mat(combination(bb)),Data_tongji(bb,1,pp),Data_tongji(bb,2,pp),Data_tongji(bb,3,pp),Data_tongji(bb,4,pp),Data_tongji(bb,5,pp)); %收敛时间
    fprintf(fid2,'%5.2f %5.2f %5.2f %5.2f %5.2f     ',Data_tongji(bb,6,pp),Data_tongji(bb,7,pp),Data_tongji(bb,8,pp),Data_tongji(bb,9,pp),Data_tongji(bb,10,pp)); %RMS
    fprintf(fid2,'%5.2f %5.2f\n',Data_tongji(bb,11,pp),Data_tongji(bb,12,pp)); %PDOP,AVERN
    end
end
fprintf(fid2,'\n');

%N收敛时间
fprintf(fid2,'NConverge\n');
for bb=1:5 %5个频点
        fprintf(fid2,'%5.1f %5.1f %5.1f %5.1f %5.1f %5.1f %5.1f %5.1f %5.1f %5.1f %5.1f %5.1f %5.1f %5.1f %5.1f\n',...
        Data_tongji(bb,1,1),Data_tongji(bb,1,2),Data_tongji(bb,1,3),Data_tongji(bb,1,4),Data_tongji(bb,1,5),Data_tongji(bb,1,6),Data_tongji(bb,1,7),Data_tongji(bb,1,8),...
        Data_tongji(bb,1,9),Data_tongji(bb,1,10),Data_tongji(bb,1,11),Data_tongji(bb,1,12),Data_tongji(bb,1,13),Data_tongji(bb,1,14),Data_tongji(bb,1,15)); %N收敛时间
end
%E收敛时间
fprintf(fid2,'EConverge\n');
for bb=1:5 %5个频点
        fprintf(fid2,'%5.1f %5.1f %5.1f %5.1f %5.1f %5.1f %5.1f %5.1f %5.1f %5.1f %5.1f %5.1f %5.1f %5.1f %5.1f\n',...
        Data_tongji(bb,2,1),Data_tongji(bb,2,2),Data_tongji(bb,2,3),Data_tongji(bb,2,4),Data_tongji(bb,2,5),Data_tongji(bb,2,6),Data_tongji(bb,2,7),Data_tongji(bb,2,8),...
        Data_tongji(bb,2,9),Data_tongji(bb,2,10),Data_tongji(bb,2,11),Data_tongji(bb,2,12),Data_tongji(bb,2,13),Data_tongji(bb,2,14),Data_tongji(bb,2,15)); 
end
%H收敛时间
fprintf(fid2,'HConverge\n');
for bb=1:5 %5个频点
        fprintf(fid2,'%5.1f %5.1f %5.1f %5.1f %5.1f %5.1f %5.1f %5.1f %5.1f %5.1f %5.1f %5.1f %5.1f %5.1f %5.1f\n',...
        Data_tongji(bb,3,1),Data_tongji(bb,3,2),Data_tongji(bb,3,3),Data_tongji(bb,3,4),Data_tongji(bb,3,5),Data_tongji(bb,3,6),Data_tongji(bb,3,7),Data_tongji(bb,3,8),...
        Data_tongji(bb,3,9),Data_tongji(bb,3,10),Data_tongji(bb,3,11),Data_tongji(bb,3,12),Data_tongji(bb,3,13),Data_tongji(bb,3,14),Data_tongji(bb,3,15)); %N收敛时间
end
%U收敛时间
fprintf(fid2,'UConverge\n');
for bb=1:5 %5个频点
        fprintf(fid2,'%5.1f %5.1f %5.1f %5.1f %5.1f %5.1f %5.1f %5.1f %5.1f %5.1f %5.1f %5.1f %5.1f %5.1f %5.1f\n',...
        Data_tongji(bb,4,1),Data_tongji(bb,4,2),Data_tongji(bb,4,3),Data_tongji(bb,4,4),Data_tongji(bb,4,5),Data_tongji(bb,4,6),Data_tongji(bb,4,7),Data_tongji(bb,4,8),...
        Data_tongji(bb,4,9),Data_tongji(bb,4,10),Data_tongji(bb,4,11),Data_tongji(bb,4,12),Data_tongji(bb,4,13),Data_tongji(bb,4,14),Data_tongji(bb,4,15)); %N收敛时间
end
%R收敛时间
fprintf(fid2,'RConverge\n');
for bb=1:5 %5个频点
        fprintf(fid2,'%5.1f %5.1f %5.1f %5.1f %5.1f %5.1f %5.1f %5.1f %5.1f %5.1f %5.1f %5.1f %5.1f %5.1f %5.1f\n',...
        Data_tongji(bb,5,1),Data_tongji(bb,5,2),Data_tongji(bb,5,3),Data_tongji(bb,5,4),Data_tongji(bb,5,5),Data_tongji(bb,5,6),Data_tongji(bb,5,7),Data_tongji(bb,5,8),...
        Data_tongji(bb,5,9),Data_tongji(bb,5,10),Data_tongji(bb,5,11),Data_tongji(bb,5,12),Data_tongji(bb,5,13),Data_tongji(bb,5,14),Data_tongji(bb,5,15)); %N收敛时间
end

fprintf(fid2,'\n');

%NRMS
fprintf(fid2,'N\n');
for bb=1:5 %5个频点
        fprintf(fid2,'%5.1f %5.1f %5.1f %5.1f %5.1f %5.1f %5.1f %5.1f %5.1f %5.1f %5.1f %5.1f %5.1f %5.1f %5.1f\n',...
        Data_tongji(bb,6,1),Data_tongji(bb,6,2),Data_tongji(bb,6,3),Data_tongji(bb,6,4),Data_tongji(bb,6,5),Data_tongji(bb,6,6),Data_tongji(bb,6,7),Data_tongji(bb,6,8),...
        Data_tongji(bb,6,9),Data_tongji(bb,6,10),Data_tongji(bb,6,11),Data_tongji(bb,6,12),Data_tongji(bb,6,13),Data_tongji(bb,6,14),Data_tongji(bb,6,15)); %N收敛时间
end
%ERMS
fprintf(fid2,'E\n');
for bb=1:5 %5个频点
        fprintf(fid2,'%5.1f %5.1f %5.1f %5.1f %5.1f %5.1f %5.1f %5.1f %5.1f %5.1f %5.1f %5.1f %5.1f %5.1f %5.1f\n',...
        Data_tongji(bb,7,1),Data_tongji(bb,7,2),Data_tongji(bb,7,3),Data_tongji(bb,7,4),Data_tongji(bb,7,5),Data_tongji(bb,7,6),Data_tongji(bb,7,7),Data_tongji(bb,7,8),...
        Data_tongji(bb,7,9),Data_tongji(bb,7,10),Data_tongji(bb,7,11),Data_tongji(bb,7,12),Data_tongji(bb,7,13),Data_tongji(bb,7,14),Data_tongji(bb,7,15)); %N收敛时间
end
%HRMS
fprintf(fid2,'H\n');
for bb=1:5 %5个频点
        fprintf(fid2,'%5.1f %5.1f %5.1f %5.1f %5.1f %5.1f %5.1f %5.1f %5.1f %5.1f %5.1f %5.1f %5.1f %5.1f %5.1f\n',...
        Data_tongji(bb,8,1),Data_tongji(bb,8,2),Data_tongji(bb,8,3),Data_tongji(bb,8,4),Data_tongji(bb,8,5),Data_tongji(bb,8,6),Data_tongji(bb,8,7),Data_tongji(bb,8,8),...
        Data_tongji(bb,8,9),Data_tongji(bb,8,10),Data_tongji(bb,8,11),Data_tongji(bb,8,12),Data_tongji(bb,8,13),Data_tongji(bb,8,14),Data_tongji(bb,8,15)); %N收敛时间
end
%URMS
fprintf(fid2,'U\n');
for bb=1:5 %5个频点
        fprintf(fid2,'%5.1f %5.1f %5.1f %5.1f %5.1f %5.1f %5.1f %5.1f %5.1f %5.1f %5.1f %5.1f %5.1f %5.1f %5.1f\n',...
        Data_tongji(bb,9,1),Data_tongji(bb,9,2),Data_tongji(bb,9,3),Data_tongji(bb,9,4),Data_tongji(bb,9,5),Data_tongji(bb,9,6),Data_tongji(bb,9,7),Data_tongji(bb,9,8),...
        Data_tongji(bb,9,9),Data_tongji(bb,9,10),Data_tongji(bb,9,11),Data_tongji(bb,9,12),Data_tongji(bb,9,13),Data_tongji(bb,9,14),Data_tongji(bb,9,15)); %N收敛时间
end
%RRMS
fprintf(fid2,'R\n');
for bb=1:5 %5个频点
        fprintf(fid2,'%5.1f %5.1f %5.1f %5.1f %5.1f %5.1f %5.1f %5.1f %5.1f %5.1f %5.1f %5.1f %5.1f %5.1f %5.1f\n',...
        Data_tongji(bb,10,1),Data_tongji(bb,10,2),Data_tongji(bb,10,3),Data_tongji(bb,10,4),Data_tongji(bb,10,5),Data_tongji(bb,10,6),Data_tongji(bb,10,7),Data_tongji(bb,10,8),...
        Data_tongji(bb,10,9),Data_tongji(bb,10,10),Data_tongji(bb,10,11),Data_tongji(bb,10,12),Data_tongji(bb,10,13),Data_tongji(bb,10,14),Data_tongji(bb,10,15)); %N收敛时间
end

fclose all;