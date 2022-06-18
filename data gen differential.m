%set parameter sweep

%set parameter sweep

% fault distance line1+line2=300km
%line1=[20 40 60 80 100 120 140 160 180]
%line2 = 100 -line1
% fault resistance
line2 = [15 11 17]
faultres1 = [0.1 45 95]
Vn=[]
for i = 1:length(line2)
    for j = 1:length(faultres1)
        simIn(i,j) = Simulink.SimulationInput('diff_IEEE_9bus_new_o');
        %simIn(i,j) = setVariable(simIn(i,j),'line1',line1(i));
        simIn(i,j) = setVariable(simIn(i,j),'line2',line2(i));
        simIn(i,j) = setVariable(simIn(i,j),'faultres1',faultres1(j));
        out(i,j)   = sim(simIn(i,j));
        I1= out(i,j).Sig_B2.signals(1).values;  
        I2= out(i,j).Sig_B2.signals(2).values;
        %V = V(333:end,1:3) old dataset setting
        %I = I(333:end,1:3)
        I1new = I1(166:499,1:3);
        I2new = I2(166:499,1:3);
        I1I2 = [I1new,I2new];
        faultfile = sprintf('test2/CG_%d_%0.2f.mat',line1(i),faultres(j));
        save(faultfile,'VI');
        Vn = [Vn;I1I2]

        %Vn(i,j) = VI
    end 
end
%plot voltage
%plot(out(1,1).Sig_B1.signals(1).values)

 V = out.Sig_B2.signals(1).values  
 I = out.Sig_B2.signals(2).values 
 VI = [V,I]
 plot(VI)
%plot voltage
%plot(out(1,1).Sig_B1.signals(1).values)
%faulttype = ["A_G", "B_G","C_G", "A_B","A_C","B_C","AB_G","AC_G","BC_G","ABC_G","NON_fault"]