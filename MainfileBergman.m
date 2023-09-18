function MainfileBergman(r0, Ego, Si, sigma, alpha, k, do, r1, r2)


model1 = BergmanMinModelMod;
model1.r0 = r0;
model1.Ego = Ego;
model1.Si = Si;
model1.sigma = sigma;
model1.alpha = alpha;
model1.k = k;
model1.do = do;
model1.r1 = r1;
model1.r2 = r2;

time = [];
daysCount =3;
for x = 1:1:daysCount+1
    time = [time, x];
end
gluc1concentrations = [];
ins1concentrations = [];
beta1concentrations = [];
dbchange = [];

count=0;

global insconcentration
global glucconcentration
global betacellmass

    for i = 1:0.0001:length(time)
    
        
        count = count+1;
    
        
        dg = 0.0001*(model1.glucconcentration(insconcentration, glucconcentration));
        di = 0.0001*(model1.insconcentration(betacellmass, glucconcentration, insconcentration));
        %dg = 0;
        %di = 0;
        db = 0;
        db = 0.0001*(model1.betacellmass(betacellmass,glucconcentration));
    
        glucconcentration = glucconcentration + dg;
        insconcentration = insconcentration + di;
        betacellmass = betacellmass + db;
        gluc1concentrations = [gluc1concentrations,glucconcentration];
        ins1concentrations = [ins1concentrations, insconcentration];
        beta1concentrations = [beta1concentrations, betacellmass];
        dbchange = [dbchange, (db*100000)];
        end
        
        %concentrations = [concentrations, glucconcentration, insconcentration, betacellmass];
        %disp(concentrations)
    
    
    


fprintf("done")
count;

V = uint32(0):uint32(count-1);

 figure()
 LineWidth = 1.5;
 FontSize = 12;
 subplot(2,2,1)
 plot(V, gluc1concentrations,'LineWidth',LineWidth)
 xlabel('Time (days)')
 ylabel('Glucose Concentration (mg/dL)')
 set(gca,'FontSize', FontSize)

 subplot(2,2,2)
 plot(V, ins1concentrations,'LineWidth',LineWidth)
 xlabel('Time (days)')
 ylabel('Insulin Concentration (μU/mL)')
 set(gca,'FontSize', FontSize)
 
 subplot(2,2,3)
 plot(V, beta1concentrations,'LineWidth',LineWidth)
 xlabel('Time (days)')
 ylabel('Beta Cell Mass (mg)')
 set(gca,'FontSize', FontSize)

 subplot(2,2,4)
 plot(V, dbchange,'LineWidth',LineWidth)
 xlabel('Time (days)')
 ylabel('Change ')
 set(gca,'FontSize', FontSize)
 end
