# Efficient Silicon-on-Insulator (SOI) Waveguide Tapers
Adiabatic exponential and non-adiabatic sinusoidal tapers optimized for high transmission from 10 µm → 0.5 µm SOI waveguides at λ = 1.55 µm.

---

## Overview
This repository accompanies the report **“Efficient silicon-on-insulator waveguide taper design.”**  
It provides formulas, example scripts, and instructions to reproduce simulations and optimization results for three taper families:

- **Linear (adiabatic)**
- **Exponential (adiabatic)**
- **Sinusoidal (non-adiabatic)**

We use **Eigenmode Expansion (EME)** to sweep design parameters and apply **Particle Swarm Optimization (PSO)** to maximize the **intensity transmission coefficient** between the input and output SOI waveguides.

---

## Key Results
- **Platform:** SOI (Si core, SiO₂ cladding), thickness **220 nm**  
- **Transition:** **10 µm (input) → 0.5 µm (output)**  
- **Representative length:** **15 µm**  
- **Exponential taper:** best around **α ≈ 0.76**, ~**0.50** transmission at **1.55 µm**  
- **Sinusoidal taper:** PSO-optimized **β ≈ 0.2 µm**, **γ ≈ 7.5**, ~**0.97** transmission at **1.55 µm**; **> 0.9** across **1.5–1.6 µm**  
- Across **10–30 µm** lengths, the sinusoidal taper yields the highest transmission; very long adiabatic tapers also become low-loss.

---

## Repository Structure
