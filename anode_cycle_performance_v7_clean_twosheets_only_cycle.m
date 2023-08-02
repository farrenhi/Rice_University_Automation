clc  
clear all
close all

aaa=1 %change it to 1 if cycle performance is needed

%change the files name
%change the corresponding mass for the previous file
files={'RX-0_9mg-Electrolyte_A.xls','RX-0_9mg-Electrolyte_B.xls',...
       'RX-0_9mg-Electrolyte_C.xls','RX-0_9mg-Electrolyte_D-restart.xls'}
%     'f1210-3217-a09007_02C.xls','f1210-3220-a10009.xls',...
%     'f1218-3209-a12014.xls','f3224-a0904.xls','f0310-3202-a1312.xls','f0310-3210-a1406.xls'};

masses={0.0009,0.0009,...
        0.0009,0.0009}
%     0.0007,0.0009,...
%     0.0014,0.0004,0.0012,0.0006};

iii=2
iiii=length(files)

te=cell(length(files),4);

%%%%%%%%%%%% Defaults for this blog post
height = 1.5*3;    % Height in inches
width = height/3*4;     % Width in inches

alw = 1;    % AxesLineWidth
fsz = 14;      % Fontsize

fsza= 12; %Fonsize for axis
msz = 12;       % MarkerSize

lw = 2;      % LineWidth
%%%%%%%%%%%%%%%%%%%%%


for ii=iii:iiii

%define parameters and import files
filename = files{ii}%automatically load from the file
m = masses{ii};

sheet = 2;%change it if different location

clear step_index
clear cycle_index
clear current
clear step_time
clear cycle
clear li
clear deli
clear ce
clear br
clear ratio
clear r1
clear r



%%%
sheet = 2;%change it if different location

step_index='E2:E99999';
cycle_index='F2:F99999';
current='G2:G99999';
step_time='D2:D99999';
voltage='H2:H99999';%end of lithiation

format long
si1= xlsread(filename,sheet,step_index);
ci1= xlsread(filename,sheet,cycle_index);
cu1= xlsread(filename,sheet,current);
st1= xlsread(filename,sheet,step_time);
ve1= xlsread(filename,sheet,voltage);%end of lithiation

sheet2 = 3;

step_index2='E3:E99999';%from E3 not E2
cycle_index2='F3:F99999';
current2='G3:G99999';
step_time2='D3:D99999';

format long
si2= xlsread(filename,sheet2,step_index2);
ci2= xlsread(filename,sheet2,cycle_index2);
cu2= xlsread(filename,sheet2,current2);
st2= xlsread(filename,sheet2,step_time2);
ve2= xlsread(filename,sheet,voltage);%end of lithiation

a={si1;si2};
si=cell2mat(a);

b={ci1;ci2};
ci=cell2mat(b);

c={cu1;cu2};
cu=cell2mat(c);

d={st1;st2};
st=cell2mat(d);

e={ve1;ve2};
ve=cell2mat(e);

%%%


totalpt=length(ci);%total of data points
lastcycle=ci(totalpt)-1;

%
deli=[1;1;1];
%


 for j=1:10%indicate each cyle index 
    a=find(ci==j);% how many points for cycle (index) 1
    if length(a) > 0
        ssi=(si(a(1):a(end)));
        step3=find(ssi==3);
       if length(find(ssi==3)) > 0
          step3=find(ssi==3);
          cycle(j,1)=j;
          pt_li=a(1)+step3(1)-2;
          %endvoltage(j,1)=ve(pt_li);%end of lithiation
          
          li(j,1)=st(pt_li)*abs(cu(pt_li))*1000/3600/m;
    
          pt_deli=a(1)+step3(end)-1;
          deli(j,1)=st(pt_deli)*abs(cu(pt_deli))*1000/3600/m;
        else cycle(j,1)=j;
             li(j,1)=0;
             deli(j,1)=0;
    
        
        end
    else cycle(j,1)=j;
         li(j,1)=0;
         deli(j,1)=0;
        
    end
 end
 for j=11:lastcycle%indicate each cyle index 
    a=find(ci==j);% how many points for cycle (index) 1
    if length(a) > 0
        ssi=(si(a(1):a(end)));
        step3=find(ssi==6);
       if length(find(ssi==6)) > 0
          step3=find(ssi==6);
          cycle(j,1)=j;
          pt_li=a(1)+step3(1)-2;
          endvoltage(j,1)=ve(pt_li);%end of lithiation
          
          li(j,1)=st(pt_li)*abs(cu(pt_li))*1000/3600/m;
    
          pt_deli=a(1)+step3(end)-1;
          deli(j,1)=st(pt_deli)*abs(cu(pt_deli))*1000/3600/m;
        else cycle(j,1)=j;
             li(j,1)=0;
             deli(j,1)=0;
    
        
        end
    else cycle(j,1)=j;
         li(j,1)=0;
         deli(j,1)=0;
        
    end
 end

 n=length(cycle);%end of lithiation
 endv=endvoltage(1:n);%end of lithiation
 
%find the cyle number which is below 80% capacity of the first cycle
ratio=deli/deli(5);
r1=find(ratio<0.90);
r=1;
br(1,1)=0;
for i=1:length(r1)
    if r1(i)>10
        br(r,1)=r1(i);
        r=r+1;   
    end
end


%lastcrate=deli(lastcycle)*m/(abs(cu(lastcycle)))/1000;
ce=deli./li*100;
dw=1000;

%table concludes the cycle number and efficiency


% te{ii,1}=filename;
% te{ii,2}=lastcycle;
% te{ii,3}=ce(lastcycle);
% te{ii,4}=br(1);


%plotting

if aaa==1
figure(ii)
%%%%%%%hq
pos = get(gcf, 'Position');
set(gcf, 'Position', [pos(1) pos(2) width*100, height*100]); %<- Set size
set(gca, 'FontSize', fsz, 'LineWidth', alw); %<- Set properties
%%%%%%%hq

[AX,H1,H2]= plotyy([cycle,cycle],[li,deli],cycle,ce);


set(H1(1),'Marker','o','MarkerSize',msz)%hq
set(H1(2),'Marker','x','MarkerSize',msz)%hq
set(AX(1),'ylim',[0 1100])
set(AX(1),'YTick',[0:200:1100])%interval

set(H2,'Marker','.','MarkerSize',msz)%hq
set(AX(2),'ylim',[0 110])
set(AX(2),'YTick',[0:20:110])%interval

set(AX(1),'xlim',[0 dw]);
set(AX(2),'xlim',[0 dw]);

%annotation
dim = [0.45 0.15 0.3 0.3];
eighty=strcat('90% @ Cycle 0',num2str(br(1)));
lf=strcat('ratio of last/fifth delithiation:', num2str(ratio(end)*100,'%.1f'),'%');
str={filename,eighty,lf};
annotation('textbox',dim,'String',str,'FitBoxToText','on','FontSize',fsza,'Fontname','Arial');


dt=date;

ylabel(AX(1),'Specific capacity (mAh/g)','FontSize',fsz,'Fontname','Arial','FontWeight','bold') 
ylabel(AX(2),'Coulombic Efficiency (%)','FontSize',fsz,'Fontname','Arial','FontWeight','bold') 
xlabel('Cycle number','FontSize',fsz,'Fontname','Arial','FontWeight','bold')
title([num2str(m*1000),' mg/cm2, C-rate: 0.2, ',...
num2str(ce(lastcycle),'%.1f'),'% @ cycle ',num2str(lastcycle)],'Fontname','Arial','FontSize',fsz)

set(AX(1),'FontSize',fsza,'Fontname','Arial')
set(AX(2),'FontSize',fsza,'Fontname','Arial')

legend('Lithiation','Delithiation','Efficiency','Location','southeast')

% Here we preserve the size of the image when we save it.
set(gcf,'InvertHardcopy','on');
set(gcf,'PaperUnits', 'inches');
papersize = get(gcf, 'PaperSize');
left = (papersize(1)- width)/2;
bottom = (papersize(2)- height)/2;
myfiguresize = [left, bottom, width, height];
set(gcf,'PaperPosition', myfiguresize);

pic=strcat(filename,'.jpg');%make a file name for png file
%set(gcf,'PaperPositionMode','manual')%not sure how to do this
print('-djpeg', '-r600',pic);

else 
end
%plotting
% figure(ii+100)
% plot(cycle,endv,'Marker','.','MarkerSize',msz)
% ylim([0 1])
% 
% dim = [0.45 0.15 0.3 0.3];
% str={filename};
% annotation('textbox',dim,'String',str,'FitBoxToText','on','FontSize',fsza,'Fontname','Arial');
% 
% xlabel('Cycle number','FontSize',fsz,'Fontname','Arial','FontWeight','bold')
% ylabel('End of lithiation (V)','FontSize',fsz,'Fontname','Arial','FontWeight','bold')   
% title('End of lithiation','Fontname','Arial','FontSize',fsz)
% set(gca,'FontSize',18,'Fontname','Calibri')
% pic=strcat(filename,'end_of_lithiation.jpg');%make a file name for tiff file
% set(gcf,'PaperPositionMode','auto')
% print('-dtiff', '-r300',pic);

end

%%

figure(ii+100)
plot(cycle,endv,'Marker','.','MarkerSize',msz)
ylim([0 1])

dim = [0.45 0.15 0.3 0.3];
str={filename};
annotation('textbox',dim,'String',str,'FitBoxToText','on','FontSize',fsza,'Fontname','Arial');

xlabel('Cycle number','FontSize',fsz,'Fontname','Arial','FontWeight','bold')
ylabel('End of lithiation (V)','FontSize',fsz,'Fontname','Arial','FontWeight','bold')   
title('End of lithiation','Fontname','Arial','FontSize',fsz)
set(gca,'FontSize',18,'Fontname','Calibri')
pic=strcat(filename,'end_of_lithiation.jpg');%make a file name for tiff file
set(gcf,'PaperPositionMode','auto')
print('-dtiff', '-r300',pic);


