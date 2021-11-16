clc;clear;close all;

for pp=10:10 %15��վ
    for bb=1:5 %6��Ƶ��

   place={'HOFN', 'QAQ1' 'REYK' 'SCOR' 'SOD3' 'THU2' 'OHI3' 'BILL' 'DJIG' 'GAMG' 'KRGG' 'LPGS' 'MCHL' 'MKEA' 'URUM'};
   
   combination={'BD3_B1IB3I_PPK' 'BDS_IF1IF2_PPK' 'BDS_B1CB2A_PPK' 'BDS_B1IB3I_PPK' 'GPS_PPK_______'}

    %�����ַ��� ����/�ϼ� GPS_PPP
    s7='F:\��������\output\THU2\BD3_B1IB3I_PPK\Coor_2021152_THU2-THU2.txt';
 
    s7(16:19)=cell2mat(place(pp));
    s7(21:34)=cell2mat(combination(bb));
    s7(49:52)=cell2mat(place(pp));
    s7(54:57)=cell2mat(place(pp));
    fprintf('%s\n',s7);
    
    %�������ɵ��ļ�
    ss='F:\��������\analysis\HOFN\HOFN_BDS_B1IB3I_PPP.txt';
    ss(18:21)=cell2mat(place(pp));
    ss(23:26)=cell2mat(place(pp));
    ss(28:41)=cell2mat(combination(bb));
    fprintf('%s\n',ss);
%***************************************ʵ�ֶԾ�̬���ݵķ����ͽ�����***********************************%
%�����������ڱ���ʱ������
Data_oneday=zeros(2880,13);
for i=1:30
   Data_total(:,:,i)=Data_oneday;
end
%%
% 
%   for x = 1:10
%       disp(x)
%   end
% 
%�����������ڱ���������
Analy_total=zeros(30,12);

for i=152:181
    doyb=num2str(i);%���º�������
    
%     %�����ַ��� ����/�ϼ� BDS_B1CB2A_PPP/BDS_B1IB3I_PPP/BD3_B1IB3I_PPP
%     s='C:\Users\��Ȫ��\Desktop\��������\output\North_pole\HOFN\BDS_B1CB2A_PPP\Coor_2021158_HOFN-HOFN.txt';
%     s(74:76)=doyb;

%     %�����ַ��� ����/�ϼ� BDS_ZD
%     s='C:\Users\��Ȫ��\Desktop\��������\output\North_pole\HOFN\BDS_ZD\Coor_2021158_HOFN-HOFN.txt';
%     s(66:68)=doyb;

    s7(45:47)=doyb;
    
    fid2 = fopen(ss,'w');
    if(fid2==-1)
        fprintf('Open Outfile Filed!')
    end
    fprintf(fid2,'//----------------------------------------------------------------------%s  %s-------------------------------------------------------------------//\n',s7(49:56),s7(21:34)); 
    fprintf(fid2,'    Time                   First converge time(min)                           3D Root Mean Square(cm)\n');
    fprintf(fid2,'                     N        E       H       U        R                  N        E       H       U       R           AveragePDOP   AverageN\n');
    %���ļ�
    fid = fopen(s7,'r');
    if(fid==-1)
        fprintf('Open Coor Filed!')
        continue
    end
    %����
    while ~feof(fid)
        %���ж�ȡ
        s = fgetl(fid);
        %��������
        if(isempty(s))
            continue;
        end
        if(s(1)==' ')
            continue;
        end
        %��Coordinate��ʼ
        if strcmp(s(1:12),'++Coordinate')
            break;
        end
    end
    
    %��ȡ����
    j=1;%����
    while ~feof(fid)
        %���ж�ȡ
        s = fgetl(fid);
        %����--Coordinate����ѭ��
        if strcmp(s(1:12),'--Coordinate')
            break;
        end
        %ʱ��
        Time=regexp(s(7:28),'  ','split');
        Second=regexp(s(29:32),'  ','split');
        Data_total(j,1,i-151)=str2num(cell2mat(Time(1)));%��
        Data_total(j,2,i-151)=str2num(cell2mat(Time(2)));%��
        Data_total(j,3,i-151)=str2num(cell2mat(Time(3)));%��
        Data_total(j,4,i-151)=str2num(cell2mat(Time(4)));%ʱ
        Data_total(j,5,i-151)=str2num(cell2mat(Time(5)));%��
        Data_total(j,6,i-151)=str2num(cell2mat(Second(1)));%��
        %erorr
        NEUR=regexp(s(38:81),'    ','split');
        NEURdouble=transpose(str2num(cell2mat(NEUR)));
        Data_total(j,7,i-151)=NEURdouble(1);%N error
        Data_total(j,8,i-151)=NEURdouble(2);%E error
        Data_total(j,13,i-151)=sqrt(NEURdouble(1).^2+NEURdouble(2).^2);%H error ������13��
        Data_total(j,9,i-151)=NEURdouble(3);%U error
        Data_total(j,10,i-151)=NEURdouble(4);%R error
        %PDOP
        PDOP=str2num(s(88:93));
        Data_total(j,11,i-151)=PDOP;
        %N
        N=str2num(s(102:104));
        Data_total(j,12,i-151)=N;
        j=j+1;
    end
end

%��������д���
for i=152:181
    %�������ά���г����˽⣬�����е�ʱ�����㲻������ģ�����������п��ܲ���2880
    maxrow=0;
    for m=1:2880
        if(Data_total(m,1,i-151)~=0)
            maxrow=maxrow+1;
        else
            break
        end
    end
    %�ҵ�N�����״�����ʱ��
    for j=1:2880
        flag=0;%����ˢ������Ѱ�ҹ���
        if(abs(Data_total(j,7,i-151))<0.20)
            hour=Data_total(j,4,i-151);
            min=Data_total(j,5,i-151);
            sec=Data_total(j,6,i-151);
            converge_row_N=j;
        else 
            continue
        end
        t=0;%��¼������������Ԫ��
        for k=j:2880
           flag2=0;%������������׶�ѭ��
           %����������ַ����ұ��ֵ���Ԫ����20������������ѭ��������һ������Ѱ��
           if(abs(Data_total(k,7,i-151))>0.20&&t<20)
               flag2=1;
               break
           end
           if(flag2==1)
               flag=1;
               break%
           end
           t=t+1;
           if(t>=20)
               %���������20����Ԫ�����������˳�ѭ��
               Analy_total(i-151,1)=hour*60+min+sec/60;
               flag=1;
               break
           end
        end
        if(flag==1)
           break
        end
    end
    %�ҵ�E�����״�����ʱ��
    for j=1:2880
        flag=0;%����ˢ������Ѱ�ҹ���
        if(abs(Data_total(j,8,i-151))<0.20)
            hour=Data_total(j,4,i-151);
            min=Data_total(j,5,i-151);
            sec=Data_total(j,6,i-151);
            converge_row_E=j;
        else 
            continue
        end
        t=0;%��¼������������Ԫ��
        for k=j:2880
           flag2=0;%������������׶�ѭ��
           %����������ַ����ұ��ֵ���Ԫ����20������������ѭ��������һ������Ѱ��
           if(abs(Data_total(k,8,i-151))>0.20&&t<20)
               flag2=1;
               break
           end
           if(flag2==1)
               flag=1;
               break%
           end
           t=t+1;
           if(t>=20)
               %���������20����Ԫ�����������˳�ѭ��
               Analy_total(i-151,2)=hour*60+min+sec/60;
               flag=1;
               break
           end
        end
        if(flag==1)
           break
        end
    end
    %�ҵ�U�����״�����ʱ��
    for j=1:2880
        flag=0;%����ˢ������Ѱ�ҹ���
        if(abs(Data_total(j,9,i-151))<0.20)
            hour=Data_total(j,4,i-151);
            min=Data_total(j,5,i-151);
            sec=Data_total(j,6,i-151);
            converge_row_U=j;
        else 
            continue
        end
        t=0;%��¼������������Ԫ��
        for k=j:2880
           flag2=0;%������������׶�ѭ��
           %����������ַ����ұ��ֵ���Ԫ����20������������ѭ��������һ������Ѱ��
           if(abs(Data_total(k,9,i-151))>0.20&&t<20)
               flag2=1;
               break
           end
           if(flag2==1)
               flag=1;
               break%
           end
           t=t+1;
           if(t>=20)
               %���������20����Ԫ�����������˳�ѭ��
               Analy_total(i-151,3)=hour*60+min+sec/60;
               flag=1;
               break
           end
        end
        if(flag==1)
           break
        end
    end
    %�ҵ�R�����״�����ʱ��
    for j=1:2880
        flag=0;%����ˢ������Ѱ�ҹ���
        if(abs(Data_total(j,10,i-151))<0.2)
            hour=Data_total(j,4,i-151);
            min=Data_total(j,5,i-151);
            sec=Data_total(j,6,i-151);
            converge_row_R=j;
        else 
            continue
        end
        t=0;%��¼������������Ԫ��
        for k=j:2880
           flag2=0;%������������׶�ѭ��
           %����������ַ����ұ��ֵ���Ԫ����20������������ѭ��������һ������Ѱ��
           if(abs(Data_total(k,10,i-151))>0.2&&t<20)
               flag2=1;
               break
           end
           if(flag2==1)
               flag=1;
               break%
           end
           t=t+1;
           if(t>=20)
               %���������20����Ԫ�����������˳�ѭ��
               Analy_total(i-151,4)=hour*60+min+sec/60;
               flag=1;
               break
           end
        end
        if(flag==1)
           break
        end
    end
    %�ҵ�ˮƽ�����״�����ʱ��
    for j=1:2880
        flag=0;%����ˢ������Ѱ�ҹ���
        if(Data_total(j,13,i-151)<0.20)
            hour=Data_total(j,4,i-151);
            min=Data_total(j,5,i-151);
            sec=Data_total(j,6,i-151);
            converge_row_Hori=j;
        else 
            continue
        end
        t=0;%��¼������������Ԫ��
        for k=j:2880
           flag2=0;%������������׶�ѭ��
           %����������ַ����ұ��ֵ���Ԫ����20������������ѭ��������һ������Ѱ��
           if(Data_total(j,13,i-151)>0.20&&t<20)
               flag2=1;
               break
           end
           if(flag2==1)
               flag=1;
               break%
           end
           t=t+1;
           if(t>=20)
               %���������20����Ԫ�����������˳�ѭ��
               Analy_total(i-151,11)=hour*60+min+sec/60;
               flag=1;
               break
           end
        end
        if(flag==1)
           break
        end
    end
    
    %N��������rms
    Analy_total(i-151,5)=rms(Data_total(converge_row_N:maxrow,7,i-151));
    %E��������rms
    Analy_total(i-151,6)=rms(Data_total(converge_row_E:maxrow,8,i-151));
    %H��������rms
    Analy_total(i-151,12)=rms(Data_total(converge_row_Hori:maxrow,13,i-151));
    %U��������rms
    Analy_total(i-151,7)=rms(Data_total(converge_row_U:maxrow,9,i-151));
    %R��������rms
    Analy_total(i-151,8)=rms(Data_total(converge_row_R:maxrow,10,i-151));
    %����ƽ��PDOP
    Analy_total(i-151,9)=mean(Data_total(1:maxrow,11,i-151));
    %����ƽ���ɼ�������
    Analy_total(i-151,10)=mean(Data_total(1:maxrow,12,i-151));
end

%���
for i=152:181
    %���ʱ��
    fprintf(fid2,'%4d  %2d  %2d       ',Data_total(1,1,i-151),Data_total(1,2,i-151),Data_total(1,3,i-151));
    %�������ʱ��
    fprintf(fid2,'%5.1f     %5.1f    %5.1f    %5.1f     %5.1f               ',Analy_total(i-151,1),Analy_total(i-151,2),Analy_total(i-151,11),Analy_total(i-151,3),Analy_total(i-151,4)); 
    %���rms
    fprintf(fid2,'%5.2f    %5.2f   %5.2f   %5.2f   %5.2f            ',Analy_total(i-151,5)*100,Analy_total(i-151,6)*100,Analy_total(i-151,12)*100,Analy_total(i-151,7)*100,Analy_total(i-151,8)*100); 
    %���ƽ��PDOP
    fprintf(fid2,'%5.2f        ',Analy_total(i-151,9)); 
    %���ƽ���ɼ�������
    fprintf(fid2,'%5.2f\n',Analy_total(i-151,10)); 
end

%���30��ƽ��ͳ������
fprintf(fid2,'30��ƽ����         %5.1f     %5.1f    %5.1f    %5.1f     %5.1f               ',mean(Analy_total(:,1)),mean(Analy_total(:,2)),mean(Analy_total(:,11)),mean(Analy_total(:,3)),mean(Analy_total(:,4))); %����ʱ��
fprintf(fid2,'%5.2f    %5.2f   %5.2f   %5.2f   %5.2f            ',rms(Analy_total(:,5))*100,rms(Analy_total(:,6))*100,rms(Analy_total(:,12))*100,rms(Analy_total(:,7))*100,rms(Analy_total(:,8))*100); %���
fprintf(fid2,'%5.2f        ',mean(Analy_total(:,9))); %ƽ��PDOP
fprintf(fid2,'%5.2f         ',mean(Analy_total(:,10)));%ƽ��������

fclose all;
    end
end