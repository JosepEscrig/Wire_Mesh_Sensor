# Wire Mesh Sensor
The Wire Mesh Sensor (WMS) is a device used to measure gas-liquid two-phase flows developed
in [HSDR](https://www.hzdr.de/db/Cms?pOid=25191&pNid=393&pLang=en) research center.
<p>

The sensor can be installed cross-sectionally to a pipe in which gas and liquid are flowing together
and it gives you an image of the gas and liquid distribution crossing the pipe.

An example is given in the next figure. It represents a cross-section of the pipe with a resolution of 24 by 24 divisions or cells.
Cells in white are occupied by gass (100% gass), cells in black are filled by liquid (0% gass), and the range of yellow and red colours
represent cells filled with both gass and liquid in different proportions.
</p>
<p align="center">
  <img width="300" height="300" src="/images/WMS_section.png">
</p>

The data contained in this image can be stored in a matrix of dimensions 24x24 which values range from 0 to 100. Additionally, by taking
many images over time, it produces a matrix of data with an additional dimension which is time. This makes a 3D matrix and this is the form
in which the data of WMS is normally processed.

Some codes to open and process these 3D matrices of data of the WMS are included in this repository

## Opening files

[Cfile2Data](/Cfile2Data.m) opens .cdat files containing 12 bits capacitive raw data

[Vfile2Data](/Vfile2Data.m) opens .v files containing 8 bits void fraction data

[Rfile2Data](/Rfile2Data.m) opens .ces files containing 12 bits capacitive raw data (only works for 32x32 wires)


## Saving files

[Data2Vfile](/Data2Vfile.m) saves data into a .v files containing 8 bits void fraction data

[Data2Cfile](/Data2Cfile.m) saves data into a .cdat files containing 12 bits raw data


## Weights and transformation matrices

[weightsMatrixGenerator](/weightsMatrixGenerator.m) generates the void fraction weights matrix for a specific sensor geometry

[maskGenerator](/maskGenerator.m) generates the mask matrix from the weights matrix

[radialWeightsMatrixGenerator](/radialWeightsMatrixGenerator.m) generates the weights matrix to calculate the radial distribuition
of the void fraction

[rotationMatrixGenerator](/rotationMatrixGenerator.m) generates the rotation matrix for an especific angle of rotation


## Processing data

[calibrationPermittivity](/calibrationPermittivity.m) obtains calibrated data of the void fraction from capacitive raw data

[Data2TimeSeries](/Data2TimeSeries.m) calculates void fraction time series from the void fraction data

[Data2RadialDistribution](/Data2RadialDistribution.m) calculates void fraction radial distribution from void fraction data

[rotateData](/rotateData.m) rotates void fraction data matrix using the rotation matrix for an especific angle of rotation


## Example

[example24x24](/example24x24.mlx) is a Matlab live script that shows how to use all these functions


## See also

[WMS data processing software manual](http://mpmt.de/en/products/wire-mesh-sensor/en/downloads/manual-wire-mesh-sensor-system-cap200), link to WMS developers, HZDR Innovation
