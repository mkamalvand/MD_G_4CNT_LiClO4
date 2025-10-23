README — Simulation Data for
“Molecular Insights into the Critical Role of Carbon Nanotube Diameter on Capacitive Performance and Charging Mechanism for Advanced Aqueous Supercapacitors”

Authors:
Fatemeh Dehghan Safiabad¹, Mohammad Kamalvand²*, Ezat Keshavarzi¹
¹ Department of Chemistry, Isfahan University of Technology, Isfahan, Iran
² Department of Chemistry, Faculty of Science, Yazd University, Yazd, Iran
*Corresponding author: kamalvand@yazd.ac.ir

Overview
This repository contains the input, output, and analysis files supporting the constant-potential molecular dynamics (CPM-MD) simulations reported in the manuscript submitted to Journal of Materials Chemistry A.
All simulations were performed using the LAMMPS package (version 23 Jun 2022) under NVT conditions with a timestep of 1 fs at 298 K using the Nosé–Hoover thermostat.
The SPC/E water model was employed, and the electrolyte was a 5.0 m LiClO₄ aqueous solution confined between two parallel graphene electrodes decorated with vertically anchored CNTs of various diameters: (7,7), (11,11), (15,15), and (20,20).

Electrode polarization was implemented using the Constant Potential Method (CPM).
Three bias states were simulated:
- V = 0 V (neutral)
- V = –1 V / +1 V (bottom negative / top positive)
- V = +1 V / –1 V (bottom positive / top negative)

File contents
DATA — Initial atomic configuration (graphene–CNT hybrid electrode with aqueous 5 m LiClO₄).
run.txt — LAMMPS input script for production runs (equilibrated system, reusable for all bias states).
run_average.txt — Script for averaged runs across all three bias states.
Q_0.15000000 — Auxiliary file containing integrated charge–potential data.
psi_periodic.m — MATLAB script used to compute electrostatic potential profiles from atomic charge data.
allcharges_V_0.mat — Induced atomic charges at zero bias (V = 0 V).
allcharges_DownNeg.mat — Induced atomic charges for the negative-bottom bias configuration (bottom = –1 V, top = +1 V).
allcharges_DownPos.mat — Induced atomic charges for the positive-bottom bias configuration (bottom = +1 V, top = –1 V).
V_0_CPM.15000000 — Restart file after 15 ns equilibration for zero-bias simulation.
V_Neg_CPM.15000000 — Restart file after 15 ns equilibration for negative-bottom bias.
V_Pos_CPM.15000000 — Restart file after 15 ns equilibration for positive-bottom bias.

Simulation details (summary)
Software: LAMMPS 23 Jun 2022
Ensemble: NVT
Timestep: 1 fs
Temperature: 298 K
Thermostat: Nosé–Hoover
Electrolyte: 5 m LiClO₄ (SPC/E water)
Force fields: nonbonded 12–6 LJ + Coulomb; cutoff = 9 Å; PPPM for long-range electrostatics
System size: 20 838 atoms (4590 H₂O + 413 LiClO₄ pairs)
Equilibration: 15 ns + 5 ns production per bias state
Boundary conditions: periodic in x–y, nonperiodic in z
Graphene–CNT geometry: electrode gap = 50 Å; CNT heights ≈ 18.6 Å

Full computational details are described in the Computational Methods section of the accompanying manuscript.

Usage
The LAMMPS input scripts (run.txt, run_average.txt) can be executed directly with standard LAMMPS.
The restart files (V_*_CPM.*) allow continuing or re-analyzing equilibrated configurations.
The MATLAB script (psi_periodic.m) reads the .mat charge files to compute electrostatic potential profiles along the cell axis.

Contact
For questions or reuse requests, please contact:
Dr. Mohammad Kamalvand
Department of Chemistry, Faculty of Science, Yazd University
Email: kamalvand@yazd.ac.ir ; kamalvand@gmail.com

License
All data and scripts are released under the Creative Commons Attribution 4.0 (CC BY 4.0) license.
Please cite the associated article when using these files.

Citation
F. Dehghan Safiabad, M. Kamalvand*, E. Keshavarzi,
Molecular Insights into the Critical Role of Carbon Nanotube Diameter on Capacitive Performance and Charging Mechanism for Advanced Aqueous Supercapacitors,
Journal of Materials Chemistry A, 2025. DOI: 10.5281/zenodo.17428545
