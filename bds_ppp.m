clc;clear;close all;

for i=152:181
    doyb=num2str(i);%更新后的年积日
    dayb=num2str(i-151,'%02d');%更新后的月内日
    %打开需要修改的文件
    fid = fopen('F:\极区导航\Control_Net.txt','r');
    %创建生成的文件
    fid2 = fopen('F:\极区导航\Control_Net1.txt','w');
    while ~feof(fid)
        %逐行读取
        s = fgetl(fid);
        %空行跳过
        if(isempty(s))
            fprintf(fid2,'\n');
            continue;
        end
        if(s(1)==' ')
            fprintf(fid2,'%s\n',s);
            continue;
        end
        %第5行
        if strcmp(s(1:3),'day')
            s(25:27) = doyb;
            fprintf(fid2,'%s\n',s); 
            continue;
        end
        %第14行
        if strcmp(s(1:6),'obsdir')
            s(36:38) = doyb;
            fprintf(fid2,'%s\n',s); 
            continue;
        end
        %第18行
        if strcmp(s(1:6),'clkdir')
            s(56:58) = doyb;
            fprintf(fid2,'%s\n',s); 
            continue;
        end
        %第28行
        if strcmp(s(1:10),'start_time')
            s(28:29)=dayb;
            fprintf(fid2,'%s\n',s);
            continue;
        end
         %第29行
        if strcmp(s(1:8),'end_time')
            s(28:29)=dayb;
            fprintf(fid2,'%s\n',s); 
            continue;
        end
        fprintf(fid2,'%s\n',s);
    end
    guan=fclose(fid);%关闭原始文件
    guan1=fclose(fid2);%关闭更新文件
    
    %用更新文件替换原始文件
    delete('F:\极区导航\Control_Net.txt');
    eval(['!rename',',F:\极区导航\Control_Net1.txt, ' ',Control_Net.txt']);
    system('F:\GNSS_software\netdiff\Net_Diff_offline\Input\Net_Diff.dll F:\极区导航\Control_Net.txt')
end
