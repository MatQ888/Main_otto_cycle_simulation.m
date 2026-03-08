% ==========================================================
% OTTO ENGINE THERMODYNAMIC CYCLE SIMULATION
% ==========================================================
%
% ## Authors

% Matías Emanuel Quesada Quezada  
% Jorge Martínez  
% Alberto Rojo  

% Project developed as part of the Aerospace Propulsion course  
% at Universidad Politécnica de Madrid (UPM).

%
% Description:
% Main script for the preliminary design and thermodynamic
% simulation of a 4-stroke Otto engine.
%
% The script defines the main geometric, operating and
% combustion parameters of the engine, calls the cycle model,
% and computes the main performance indicators:
%
% - IMEP (Indicated Mean Effective Pressure)
% - FMEP (Friction Mean Effective Pressure)
% - BMEP (Brake Mean Effective Pressure)
% - Brake power
% - Brake torque
% - Effective efficiency
% - BSFC (Brake Specific Fuel Consumption)
% - Volumetric efficiency
% - Knock / detonation integral
%
% Main input parameters:
% - Stroke (s1)
% - Bore (b1)
% - Compression ratio (rg)
% - Intake valve closing delay (rca)
% - Exhaust valve opening advance (aae)
% - Ignition advance (aicb)
% - Combustion duration (dcb)
% - Engine speed (rpm)
% - Number of cylinders (ncil)
%
% Outputs:
% - Engine performance parameters
% - Pressure-temperature history
% - Pressure-volume diagrams
% - Temperature evolution plots
%
% External scripts/functions used:
% - princotto
% - plot_P_T
% - plot_P_V
% - plot_T_T
%
% ==========================================================

clear
clc
close all

s1=90;
b1=83.05;
lambda=0.3;
rg=10;
rca=55;
aae=40;
aicb=22;
dcb=50;
rpm=6000;
pe1=1;
Ta=300;
pa1=1;
fequ=1.15;
Tw=500;
a=5;
n=3.2;
NO=95;
gamma1=1.3;
gamma2=1.3;
miter=3;
ncil=4;

r21=s1/2;
vd=pi*b1^2/4*s1/1000;

% ******************************************************
% *   QANG : ESCRITURA DE FICHEROS (SI=1,NO=resto)     *
% ******************************************************
QANG=1;
ORIG=0;

%% Main cycle simulation

s=s1/1000;
b=b1/1000;

r2=s/2;

pa=pa1*100000;
pe=pe1*100000;
qr=vd/1000000;

Avalv_a=0.35*pi*b^2/4;
Avalv_e=0.25*pi*b^2/4;

princotto

% Estimation of friction losses (without pumping losses)
FMEP=1*(0.97+0.8*(Up/17.2)+0.6*(Up/17.2)^2);   % Friction mean effective pressure [bar]
IMEP=Trabajo/vd*10;                            % Indicated mean effective pressure [bar]
ETAM=(IMEP-FMEP)/IMEP;                         % Mechanical efficiency [-]
BMEP=ETAM*IMEP;                                % Brake mean effective pressure [bar]
Pow=BMEP*ncil*vd/10*rpm/120/1000;              % Brake power [kW]
Rend_e=Rend*ETAM;                              % Effective efficiency [-]
BSFC=3600000000/Rend_e/Li;                     % Brake specific fuel consumption [g/kWh]
Par=BMEP*ncil*vd/10/4/pi;                      % Torque [Nm]

% Knock / detonation calculation
Pdet=0;
gamma=1.3;
ide=180+rca;
tret1=0.01806*(NO/100)^3.4017*APTV(ide+1,2)^-1.7*exp(3800/APTV(ide+1,3));

for ide=180+rca+1:360-aicb
    p=APTV(ide+1,2);
    T=APTV(ide+1,3);
    tret2=0.01806*(NO/100)^3.4017*p^-1.7*exp(3800/T);
    Pdet=Pdet+(1/tret1+1/tret2)/2*pi/180;
    tret1=tret2;
end

for ide=360-aicb+1:360-aicb+dcb
    p=APTV(ide+1,2);
    T=T2*(p*100000/P2)^((gamma-1)/gamma);
    tret2=0.01806*(NO/100)^3.4017*p^-1.7*exp(3800/T);
    Pdet=Pdet+(1/tret1+1/tret2)/2*pi/180;
    tret1=tret2;
end

Pdet=Pdet/wrpm;
Rend_vol=Masa_adm/(1+fequ/14.7)/(pa/287/Ta)/vd*1000000;

gasto_aire=ncil*Masa_adm/(1+fequ/14.7)*rpm/120;
gasto_comb=fequ/14.7*gasto_aire*3600;

save vars.mat APTV

plot_P_T
plot_P_V
plot_T_T
