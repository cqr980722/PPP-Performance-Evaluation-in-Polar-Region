clc;clear;close all;

for i=152:181
    doyb=num2str(i);%���º�������
    dayb=num2str(i-151,'%02d');%���º��������
    %����Ҫ�޸ĵ��ļ�
    fid = fopen('F:\��������\Control_Net.txt','r');
    %�������ɵ��ļ�
    fid2 = fopen('F:\��������\Control_Net1.txt','w');
    while ~feof(fid)
        %���ж�ȡ
        s = fgetl(fid);
        %��������
        if(isempty(s))
            fprintf(fid2,'\n');
            continue;
        end
        if(s(1)==' ')
            fprintf(fid2,'%s\n',s);
            continue;
        end
        %��5��
        if strcmp(s(1:3),'day')
            s(25:27) = doyb;
            fprintf(fid2,'%s\n',s); 
            continue;
        end
        %��14��
        if strcmp(s(1:6),'obsdir')
            s(36:38) = doyb;
            fprintf(fid2,'%s\n',s); 
            continue;
        end
        %��18��
        if strcmp(s(1:6),'clkdir')
            s(56:58) = doyb;
            fprintf(fid2,'%s\n',s); 
            continue;
        end
        %��28��
        if strcmp(s(1:10),'start_time')
            s(28:29)=dayb;
            fprintf(fid2,'%s\n',s);
            continue;
        end
         %��29��
        if strcmp(s(1:8),'end_time')
            s(28:29)=dayb;
            fprintf(fid2,'%s\n',s); 
            continue;
        end
        fprintf(fid2,'%s\n',s);
    end
    guan=fclose(fid);%�ر�ԭʼ�ļ�
    guan1=fclose(fid2);%�رո����ļ�
    
    %�ø����ļ��滻ԭʼ�ļ�
    delete('F:\��������\Control_Net.txt');
    eval(['!rename',',F:\��������\Control_Net1.txt, ' ',Control_Net.txt']);
    system('F:\GNSS_software\netdiff\Net_Diff_offline\Input\Net_Diff.dll F:\��������\Control_Net.txt')
end
