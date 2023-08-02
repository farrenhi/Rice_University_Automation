clc
clear
close all
clear legend
clear Legend

%remindder: add c rate


whichdataset=15
%data14:calibration for three-electrode cell
%pre-lith 0.2C--------------------------------------------------------------

data1={
% 1.47,0.00106,13,3,3,'f0310-3211-a13106c06120-prelith.xls';%archived
% 1.53,0.00100,09,3,3,'f1204-3227-a09010c06118-preli.xls';%archived
1.56,0.00108,13,3,3,0.2,'f0314-3225-a13108c06130-prelith.xls';%archived
% 1.60,0.00100,10,3,3,'f1218-3216-a10010c06123-preli.xls';%archived
1.94,0.00082,13,3,3,0.2,'f0314-3223-a13082c061223-prelith.xls';%archived
2.52,0.00062,14,3,3,0.2,'f0322-3215-a14062c06120-prelith.xls';;%archived
%3.01,0.00053,15,3,3,0.2,'f0324-3228-a1503053c061230.xls';;%archived low CE
%3.03,0.00052,15,3,3,0.2,'f0525-3205-a15052c06121-prelith-303r.xls';%archived
3.54,0.00040,07,3,3,0.2,'f3229-1021-a0704c06109-preli.xls';%archived
%4.03,0.00040,16,3,3,0.2,'f0527-3206-a16040c06124-prelith-403r.xls';%archived

%4.00,0.00040,161,3,3,0.2,'f0401-3201-a16040c06123-prelith.xls';%low CE

%4.64,0.00030,07,3,3,0.2,'f3230-1021-a0703c06107-preli.xls';%archived
%5.02,0.00030,161,3,3,0.2,'f0401-3204-a161030c06116-prelith.xls';%archived
};

% %pre-lith 1C--------------------------------------------------------------
data2={1.50,0.00064,14,3,6,1,'f0322-3209-s14064c06120-prelith.xls';  %archived
      1.82,0.00054,14,3,6,1,'f0323-3212-a14054c061234-prelith.xls'; %archived
      2.51,0.00038,161,3,6,1,'f0412-3205-a161038c06119-prelith.xls';%archived
      %3.00,0.00032,161,3,6,1,'f0401-3206-a161032c06120-prelith.xls';%archived
      };
%pre-cycling 0.2C--------------------------------------------------------------
data3={
      1.37,0.0012,10,3,3,'f0211-3206-a10120c06126-5cycles.xls'; %archived
      1.63,0.00093,13,3,3,'f0311-3216-a13093c061164-precy5.xls'; %archived
      };
name13=['pre_cycling_02C.jpg'];
name23=['pre_cycling_02C_endofcharge.jpg'];
xlim3=70;
td3=['Different ratios at 0.2C, pre-cycling with Li foil for 5 cycles']; %titledischarge
te3=['End of charge potential, pre-cycling at 0.2C'];
%pre-cycling 1C--------------------------------------------------------------
data4={1.30,0.00077,14,3,6,1,'f0317-3227-a14077c06125-precy5.xls'; %archived
      1.50,0.00064,14,3,6,1,'f0314-3222-a14064c06120-precy5.xls'; %archived
%       1.79,0.00050,99,3,3,1,'f1113-3218-aabi05c06112-preli.xls';%archived
      1.86,0.00050,10,3,6,1,'f0205-3231-a10005c06116-5cycle.xls';%archived
      2.51,0.00038,16,3,6,1,'f0415-3230-a16038c06119-precy.xls'};%archived
      %3.00,0.00033,161,3,6,1,'f0404-3211-a16033-c06124-precy.xls'};%archived
%precyling for 5.5 cycles, 1C-------------------------------------------------------------------
data5={2.53,0.00037,161,3,6,1,'f0428-3209-a16037c06117-precy55.xls'};
name15=['pre_cycling_1C.jpg'];
name25=['pre_cycling_1C_endofcharge.jpg'];
xlim5=300;
td5=['Different ratios at 1C, pre-cycling with Li foil for 5 cycles']; %titledischarge
te5=['End of charge potential, pre-cycling at 1C'];
%-----------------------------------------------------------------
data6={1.20,0.0013,13,3,3,'f0502-3212-a1313c06120-precy.xls';
       1.30,0.0012,13,3,3,'f0503-3216-a1312c0612-precy.xls';
};
name16=['pre_cycling_0.2C_full_potential.jpg'];
name26=['pre_cycling_0.2C_full_potential_endofcharge.jpg'];
xlim6=100;
td6=['0.2C for full potential, pre-cycling with Li foil for 5 cycles']; %titledischarge
te6=['End of charge potential for full potential, pre-cycling with Li foil for 5 cycles'];
%---------------------------------
data7={1.60,0.00100,10,3,3,'f1218-3216-a10010c06123-preli.xls';
       1.63,0.00093,13,3,3,'f0311-3216-a13093c061164-precy5.xls'; %archived
};
name17=['pretreatment_0.2C_ratio160.jpg'];
name27=['pretreatment_0.2C_ratio160_endofcharge.jpg'];
xlim7=100;
td7=['0.2C, 1.60:pre-lith., 1.63:pre-cycling']; %titledischarge
te7=['End of charge potential, 1.60:pre-lith., 1.63:pre-cycling'];
%-------------------------------
data8={1.50,0.00064,14,3,6,'f0322-3209-s14064c06120-prelith.xls';  %archived
      2.51,0.00038,161,3,6,'f0412-3205-a161038c06119-prelith.xls';
      3.00,0.00032,161,3,6,'f0401-3206-a161032c06120-prelith.xls';
      1.50,0.00064,14,3,6,'f0314-3222-a14064c06120-precy5.xls'; %archived
      2.51,0.00038,16,3,6,'f0415-3230-a16038c06119-precy.xls';
      3.00,0.00033,161,3,6,'f0404-3211-a16033-c06124-precy.xls'
};
name18=['pretreatment_1C.jpg'];
name28=['pretreatment_1C_endofcharge.jpg'];
xlim8=450;
td8=['1C']; %titledischarge
te8=['End of charge potential, 1C'];
%-------------------------------
%-----------------------------------------------------------------
%plot: full potential
data9={1.25,0.00078,15,3,3,0.2,'f0506-3201-a15078c06120-precy.xls';
       1.25,0.00077,15,3,3,0.2,'f60801-3218-a15077c06118.xls';%A/C, no pretreatment
       1.25,0.00049,161,3,3,0.2,'f0706-3207-a161049c06120-precy-fullpotential.xls';%C/A, npre-lithiation
       1.25,0.00049,161,3,3,0.2,'f0707-3208-a161049c06120-precy-fullpotential-02.xls';%C/A, npre-cycling
       1.25,0.00049,161,3,3,0.2,'f0714-3209-a161049c06120.xls';%C/A, no pretreatment
       1.25,0.00049,161,3,3,0.2,'f60804-a17049c06120-fullpotential.xls';
       
       %1.60,0.001,1502,3,3,'f0506-3208-a150210c06120-precy.xls';
};
name19=['pre_cycling_0.2C_full_potential.jpg'];
name29=['pre_cycling_0.2C_full_potential_endofcharge.jpg'];
xlim9=30;
td9=['0.2C for full potential, pre-cycling with Li foil for 5 cycles']; %titledischarge
te9=['End of charge potential for full potential, pre-cycling with Li foil for 5 cycles'];
%---------------------------------
%-----------------------------------------------------------------
%plot: 3 eletrode cell
data10={2.48,0.00064,15,3,3,0.2,'f0822-0806-a15064c06122-prelith-3e.xls';
        2.49,0.00061,161,3,6,0.2,'f60913-3207-a161061c06117-prelith-3e.xls';
        %1.56,0.001,1503,3,3,0.2,'f0518-0806-a150310c06120-prelith-3e.xls';
        %2.50,0.00063,15,3,3,0.2,'f0525-0806-a15063c06121-prelith-3e.xls';
        %2.49,0.00061,161,3,3,0.2,'f0629-3206-a161061c06117-prelith-3e.xls';
        %2.49,0.00063,14,3,3,0.2,'f0715-0806-a14063c06121-3e.xls';
        %2.48,0.00064,14,3,3,0.2,'f0727-0807-a14064c06122-3e.xls';
        %2.49,0.00063,17,3,3,0.2,'f60815-0807-a17063c06121-prelith.xls';
        }
    
%doulbe check prelith 0.2C 2.5 and 3.0---------------------------------
% data11={2.52,0.00062,14,3,3,'f0322-3215-a14062c06120-prelith.xls';;%archived
%         3.01,0.00053,15,3,3,'f0324-3228-a1503053c061230.xls';;%archived
%         2.51,0.00061,15,3,3,'f0525-3203-a15061c06118-prelith-251r.xls';
%         3.03,0.00052,15,3,3,'f0525-3205-a15052c06121-prelith-303r.xls';}
    
%---------------------------------------------
%plot: prelith, random cells
data11={2.51,0.00061,15,3,3,0.2,'f0525-3203-a15061c06118-prelith-251r.xls';
        3.03,0.00052,15,3,3,0.2,'f0525-3205-a15052c06121-prelith-303r.xls';
        4.03,0.00040,16,3,3,0.2,'f0527-3206-a16040c06124-prelith-403r.xls';
        1.42,0.00041,00,3,3,0.2,'f0714-3202-a161041cL402-prelith.xls';
        1.47,0.00106,13,3,3,0.2,'f0310-3211-a13106c06120-prelith.xls';
        1.25,0.00050,17,3,3,0.2,'f60817-3201-a17050c06121-ccc.xls';
        1.25,0.00078,15,3,3,0.2,'f60817-3202-a15078c06121-ccc.xls';
        };
%-----------
data12={1.30,0.00077,14,3,6,'f0314-0807-precy-a14077.xls';
        1.50,0.00064,14,3,6,'f0311-0807-precy-a14064.xls';
        1.86,0.00050,07,3,3,'f0201-0807-a07005.xls';
        2.51,0.00039,16,3,6,'f0412-0807-precy-a16039.xls';
        3.00,0.00033,16,3,6,'f0401-0807-precy-a161033.xls';

       };
%-----------
%plot: precy, random cells
data13={%2.54,0.00060,161,3,3,0.2,'f0705-3201-a161060c06117-precy-02c.xls';
        2.51,0.00035,161,3,6,1,'f0708-3212-a161035c06110-precy1c-55.xls';};
%-----------
data14={0,0.0006,00,3,3,0.2,'f609270807calibration_test_with_si_halfcell.xls';}

%cathode data
data15={0,0.00423,00,3,3,1,'f0808-3222-cLFP423-1c.xls';
    }

% 0,0.00398,00,3,3,1,'f0722-3216-cLFP-398.xls',...
%         0,0.0009,00,3,6,1,'RX-0_9mg-Electrolyte_A.xls';
%         0,0.0009,00,3,6,1,'RX-0_9mg-Electrolyte_B.xls';
%         0,0.0009,00,3,6,1,'RX-0_9mg-Electrolyte_C.xls';
%         0,0.0009,00,3,6,1,'RX-0_9mg-Electrolyte_D-restart.xls';
    

datas={data1,data2,data3,data4,data5,data6,data7,data8,data9,data10,data11,data12,data13,data14,data15};

%anode or cathode= 1 or 0
whichway=[1 1 1 1 1,...
          1 1 1 1 1,...
          1 1 1 1 0
         ];

crates={'0.2C','1C','0.2C','1C','1C',...
       '0.2C','0.2C','0.2C','0.2C','0.2C',...
       '0.2C','1C','1C','1C','1c'};
   
pret={'pre-lith','pre-lith','pre-cy','pre-cy','pre-cy',...
      'pre-cy','00','pre-cy','00','pre-lith',...
      'pre-lith','pre-cy','pre-cy','nopret','nopret'};

for k=whichdataset
clear data    
clear legend
clear Legend

data=datas{k};


%data process session (same code for different data set)
ratios=cell2mat(data(:,1)');
masses=data(:,2)';
batches=cell2mat(data(:,3)');
key1=data(:,4)';
key2=data(:,5)';
cratess=cell2mat(data(:,6)');
files=data(:,7)';


for ii=1:length(files)

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
clear voltage
clear endvoltage
clear avoltage
clear A

%aux voltage
if k==14
    clear endavli
    clear endavdeli
else 
end


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

deli=[1;1;1];


if lastcycle<11
 for j=1:lastcycle %indicate each cyle index 
    a=find(ci==j);% how many points for cycle (index) 1
    if length(a) > 0
        ssi=(si(a(1):a(end)));
        step3=find(ssi==key1{ii});
       if length(find(ssi==key1{ii})) > 0
    step3=find(ssi==key1{ii});
    
    cycle(j,1)=j;
    pt_li=a(1)+step3(1)-2;
    endvoltage(j,1)=ve(pt_li);%end of lithiation
    if k==14
     
     endavli(j,1)=av(pt_li);%end of lithiation, aux volt
    else
    end
    li(j,1)=st(pt_li)*abs(cu(pt_li))*1000/3600/m;
    
    pt_deli=a(1)+step3(end)-1;
    if k==14       
     endavdeli(j,1)=av(pt_deli);%end of delithiation, aux volt
    else
    end
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
else
       
 for j=1:10 %indicate each cyle index 
    a=find(ci==j);% how many points for cycle (index) 1
    if length(a) > 0
        ssi=(si(a(1):a(end)));
        step3=find(ssi==key1{ii});
       if length(find(ssi==key1{ii})) > 0
    step3=find(ssi==key1{ii});
    
    cycle(j,1)=j;
    pt_li=a(1)+step3(1)-2;
    endvoltage(j,1)=ve(pt_li);%end of lithiation
    if k==14
     endavli(j,1)=av(pt_li);%end of lithiation, aux volt
    else
    end
    li(j,1)=st(pt_li)*abs(cu(pt_li))*1000/3600/m;
    
    pt_deli=a(1)+step3(end)-1;
    if k==14
     endavdeli(j,1)=av(pt_deli);%end of delithiation, aux volt
    else
    end
    
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
 
 for j=11:lastcycle %indicate each cyle index 

     
    a=find(ci==j);% how many points for cycle (index) 1
    if length(a) > 0
    
    
    
    ssi=(si(a(1):a(end)));
    step3=find(ssi==key2{ii});
    
    cycle(j,1)=j;
    pt_li=a(1)+step3(1)-2;
    endvoltage(j,1)=ve(pt_li);%end of lithiation
    if k==14
     endavli(j,1)=av(pt_li);%end of lithiation, aux volt
    else
    end
    li(j,1)=st(pt_li)*abs(cu(pt_li))*1000/3600/m;
    
    pt_deli=a(1)+step3(end)-1;
    deli(j,1)=st(pt_deli)*abs(cu(pt_deli))*1000/3600/m;
    if k==14
     endavdeli(j,1)=av(pt_deli);%end of delithiation, aux volt
    else
    end
    
    else cycle(j,1)=j;
         li(j,1)=0;
         deli(j,1)=0;
        
    
    end
 end
end

if whichway(k)==0
    lii=li;
    delii=deli;
    
    li=delii;
    deli=lii;
    
end


lastcrate=deli(lastcycle)*m/(abs(cu(totalpt)))/1000;
ce=deli./li*100;
dw=j+9;

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

A(:,1)=cycle;
A(:,2)=li;
A(:,3)=deli;
A(:,4)=endvoltage;
A(:,5)=ce;
if k==14
    A(:,6)=endavli;
    A(:,7)=endavdeli;
else
end


savetitle=['dataset_' num2str(k) '_no_' num2str(ii) '_' pret{k} '_' num2str(cratess(ii)) 'C_' num2str(ratios(ii)) 'r.txt'];
save(savetitle,'A','-ascii','-tabs');



% gp{ii,2}=deli;
% gp{ii,3}=endvoltage; %end of lithiation plot
% gp{ii,4}=li;
gp{ii,1}=cycle;
gp{ii,2}=li;
gp{ii,3}=deli; %end of lithiation plot
gp{ii,4}=endvoltage;
gp{ii,5}=ce;
gp{ii,6}=ratios(ii);

gp{ii,9}=br(1,1);
gp{ii,10}=ratio(1);
gp{ii,11}=pret{k};
gp{ii,12}=cratess(ii);
gp{ii,13}=m;
gp{ii,14}=lastcycle;
gp{ii,15}=ce(lastcycle);
gp{ii,16}=filename;


% gp{ii,6}=endavli;
% gp{ii,7}=endavdeli;
%aux voltage
if k==14
    gp{ii,7}=endavli;
    gp{ii,8}=endavdeli;
else
end

if k==14
    datapoint=[1:1:length(ve)]';
    drn=ve-av;
    
    cln{1,1}=datapoint;
    cln{1,2}=ve;
    cln{1,3}=av;
    cln{1,4}=drn;
    
    name_cln=['data_cln' '.mat']
    save(name_cln,'cln');
    
else
end


 n=length(cycle);%end of lithiation
 endv=endvoltage(1:n);%end of lithiation
 




end
%savet=['dataset_' num2str(k) '_' pret{k} '_' num2str(cratess(ii)) '.mat'];
savet=['dataset_' num2str(k) '.mat']
save(savet,'gp');





end


% mktype = ['.','s','>','<','o','*','#'];
%.emf for windows
%.eps for mac