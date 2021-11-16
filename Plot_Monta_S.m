subplot(3,4,9);
plot(GAMG_N(1:60,:));
set(gca,'YLim',[0 200]);
ylabel('N (cm)'); 
xlabel('GAMG'); 


subplot(3,4,5);
plot(GAMG_E(1:60,:));
set(gca,'YLim',[0 300]);
ylabel('E (cm)'); 

subplot(3,4,1);
plot(GAMG_U(1:60,:));
set(gca,'YLim',[0 600]);
ylabel('U (cm)'); 

subplot(3,4,10);
plot(LPGS_N(1:60,:));
set(gca,'YLim',[0 200]);
xlabel('LPGS'); 

subplot(3,4,6);
plot(LPGS_E(1:60,:));
set(gca,'YLim',[0 300]);

subplot(3,4,2);
plot(LPGS_U(1:60,:));
set(gca,'YLim',[0 600]);

subplot(3,4,11);
plot(REYK_N(1:60,:));
set(gca,'YLim',[0 200]);
xlabel('REYK'); 

subplot(3,4,7);
plot(REYK_E(1:60,:));
set(gca,'YLim',[0 300]);

subplot(3,4,3);
plot(REYK_U(1:60,:));
set(gca,'YLim',[0 600]);

subplot(3,4,12);
plot(THU2_N(1:60,:));
set(gca,'YLim',[0 200]);
xlabel('THU2'); 

subplot(3,4,8);
plot(THU2_E(1:60,:));
set(gca,'YLim',[0 300]);

subplot(3,4,4);
plot(THU2_U(1:60,:));
set(gca,'YLim',[0 600]);