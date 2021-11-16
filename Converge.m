clc;clear;close all;

for pp=1:15 %15��վ
    for bb=4:4 %5��Ƶ��

   place={'HOFN', 'QAQ1' 'REYK' 'SCOR' 'SOD3' 'THU2' 'OHI3' 'BILL' 'DJIG' 'GAMG' 'KRGG' 'LPGS' 'MCHL' 'MKEA' 'URUM'};
   
   combination={'BD3_B1IB3I_PPP' 'BDS_IF1IF2_PPP' 'BDS_B1CB2A_PPP'  'BDS_B1IB3I_PPP' 'GPS_PPP_______'};

    %�����ַ��� ����/�ϼ� GPS_PPP
    s7='F:\��������\output\THU2\BD3_B1IB3I_PPK\Coor_2021152_THU2-THU2.txt';
 
    s7(16:19)=cell2mat(place(pp));
    s7(21:34)=cell2mat(combination(bb));
    s7(49:52)=cell2mat(place(pp));
    s7(54:57)=cell2mat(place(pp));
    fprintf('%s\n',s7);
    
    %�������ɵ��ļ�
    ss='F:\��������\analysis\HOFN\HOFN_BDS_B1IB3I_PPP_CV.txt';
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

Converge_oneStation_oneD=zeros(2880,30);
for i=1:3
   Converge_oneStation(:,:,i)=Converge_oneStation_oneD;
end
for i=1:15
   Converge_all(:,:,:,i)=Converge_oneStation;
end


%%


for i=152:181
    doyb=num2str(i);%���º�������

    s7(45:47)=doyb;
    
    fid2 = fopen(ss,'w');
    if(fid2==-1)
        fprintf('Open Outfile Filed!')
    end
    
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
        Data_total(j,7,i-151)=abs(NEURdouble(1));%N error
        Data_total(j,8,i-151)=abs(NEURdouble(2));%E error
        Data_total(j,9,i-151)=abs(NEURdouble(3));%U error
        Data_total(j,10,i-151)=abs(NEURdouble(4));%R error
        j=j+1;
    end
end

%�������
fprintf(fid2,'//-----------------------------------------------------------------------------------------------------------------------%s  %s-------------------------------------------------------------------------------------------------------//\n',s7(49:52),s7(21:34));

%N
fprintf(fid2,'\n//--------------------------  N  --------------------------//\n\n');
for i=1:2880
    for j=1:30
        fprintf(fid2,'%8.3f',Data_total(i,7,j)*100);
        Converge_all(i,j,1,pp)=Data_total(i,7,j)*100;
    end
    fprintf(fid2,'\n');
end

%E
fprintf(fid2,'\n//--------------------------  E  --------------------------//\n\n');
for i=1:2880
    for j=1:30
        fprintf(fid2,'%8.3f',Data_total(i,8,j)*100);
        Converge_all(i,j,2,pp)=Data_total(i,8,j)*100;
    end
    fprintf(fid2,'\n');
end

%U
fprintf(fid2,'\n//--------------------------  U  --------------------------//\n\n');
for i=1:2880
    for j=1:30
        fprintf(fid2,'%8.3f',Data_total(i,9,j)*100);
        Converge_all(i,j,3,pp)=Data_total(i,9,j)*100;
    end
    fprintf(fid2,'\n');
end

fclose all;
    end
end