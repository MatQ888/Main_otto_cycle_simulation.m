# Otto Engine Thermodynamic Cycle Simulation

Simulation and preliminary design of a 4-stroke Otto engine using MATLAB.

This project was developed as part of the Aerospace Propulsion course at the Polytechnic University of Madrid (UPM).

## Project objective

The objective of this work is to perform a preliminary design of an internal combustion engine by analysing the influence of several design parameters on engine performance.

Key design variables studied:

- Stroke to bore ratio
- Number of cylinders
- Intake valve closing delay (RCA)
- Exhaust valve opening advance (AAE)
- Compression ratio
- Ignition advance curve

The model evaluates engine performance through thermodynamic cycle simulations.

## Methodology

The engine cycle is simulated using MATLAB. The following analyses were performed:

1. Selection of engine displacement and target power
2. Study of stroke and bore influence on performance
3. Analysis of intake valve closing delay (RCA)
4. Analysis of exhaust valve opening advance (AAE)
5. Optimization of compression ratio
6. Calculation of optimal ignition advance curve
7. Detonation limit analysis using knock integral
8. Performance evaluation (BMEP, power and fuel consumption vs RPM)

The combustion model is based on the Wiebe function.

## Engine parameters

Fixed parameters used in the model:

- Intake pressure: 1 bar
- Exhaust pressure: 1 bar
- Equivalence ratio: 1.15
- Intake temperature: 300 K
- Wall temperature: 500 K
- Wiebe coefficient a = 5
- Wiebe coefficient n = 3.2
- Combustion duration = 50°

## Results

The model generates several performance curves:

- Pressure-volume diagrams
- BMEP vs engine speed
- Power vs RPM
- Ignition advance curve
- Detonation limit analysis

These results allow selecting the optimal engine configuration.

## Tools used

- MATLAB
- Thermodynamic modelling
- Combustion modelling
- Numerical simulation

## Author

Matías Emanuel Quesada Quezada  
Aerospace Engineering – Universidad Politécnica de Madrid
[TRABAJO_DE_CICLO_TERMODINÁMICO_25_PA (2)_removed.pdf](https://github.com/user-attachments/files/25818830/TRABAJO_DE_CICLO_TERMODINAMICO_25_PA.2._removed.pdf)

    
