# EEG_Fractal_Dimension_Calculator
A MATLAB script for calculating the fractal dimension (FD) of EEG images using box-counting method.

This project aims to analyze EEG signals for epilepsy detection using fractal dimension (FD) and lacunarity. The box-counting method is employed to compute FD, and the gliding box algorithm is used to calculate lacunarity. The project uses the publicly available Bonn University EEG dataset.

# Fractal Dimension Analysis

This project computes **fractal dimension (FD)** of EEG signals using the box-counting method.

## Features
- Supports **batch processing** of EEG data.
- Computes FD using MATLAB.

## Usage
1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/fractal-dimension-analysis.git

% Example MATLAB command
run('src/box_counting/compute_fd.m')
