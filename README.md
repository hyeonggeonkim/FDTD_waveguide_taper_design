# Efficient Silicon-on-Insulator (SOI) Waveguide Tapers
## Abstract

Designing efficient waveguide tapers is critical in silicon photonics. We introduce two taper designs—an **adiabatic exponential** taper and a **non-adiabatic sinusoidal** taper—aimed at achieving high transmission between a **10-µm-wide** input silicon waveguide and a **0.5-µm-wide** output silicon waveguide at **λ = 1.55 µm**. Taper parameters were optimized via parameter sweeps and global optimization using the **Lumerical Eigenmode Expansion (EME)** solver. The **sinusoidal** taper outperforms both linear and exponential designs, especially at shorter lengths, and achieves **>90% transmission** across the **1.5–1.6 µm** wavelength range.

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
