# Light Field Refocusing with 4-D Sparse FIR Hyperfan Filter
This is a MATLAB implementation of the Sparse FIR Hyperfan filter for light field refocusing.

## Conventions
The input light field should be in MAT file format (.mat extension). 

Parameters:
- alpha - Orientation of fan filter in 
- theta - Half fan angle
- B - Length of bow-tie shaped passband
- T - Angular width of bow-tie shaped passband


![val1](docs/Images/val1.gif)

 | | Flowers | Mirabelle Prune Tree | Sophie & Vincent 1 | Swans 1|
| --- | --- | --- | --- | --- |
|Sparse filter| <img src="docs/Images/F_35_45.png" width="300" > | <img src="docs/Images/MPT_35_45.png" width="300" > | <img src="docs/Images/Sophie_&_Vincent_1_35_45.png" width="300" > | <img src="docs/Images/Swans_1_35_45.png" width="300" > |
|Nonsparse filter| <img src="docs/Images/F_35_45_ht.png" width="300" > | <img src="docs/Images/MPT_35_45_ht.png" width="300" > | <img src="docs/Images/Sophie_&_Vincent_1_35_45_ht.png" width="300" > | <img src="docs/Images/Swans_1_35_45_ht.png" width="300" > |
