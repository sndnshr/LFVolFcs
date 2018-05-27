# Light Field Refocusing with 4-D Sparse FIR Hyperfan Filter
This is a MATLAB implementation of the Sparse FIR Hyperfan filter for light field refocusing.

## Conventions
The input light field should be in MAT file format (.mat extension). 

Parameters:
- ![](docs/Images/alpha.gif) - Orientation of fan filter in ![](docs/Images/xu.gif) and ![](docs/Images/yv.gif) subspaces.
- ![](docs/Images/theta.gif) - Half fan angle.
- B - Length of bow-tie shaped passband.
- T - Angular width of bow-tie shaped passband.

## Results
#### Comparison between sparse and nonsparse FIR Hyperfan filter

Results for both sparse and nonsparse filters of the same parameters, are shown below for selected light fields of [EPFL dataset](https://mmspg.epfl.ch/EPFL-light-field-image-dataset) for visual comparison. As a representative case, following values are chosen for the filter parameters ![](docs/Images/alpha.gif), ![](docs/Images/theta.gif), *B* and *T*. 

![val1](docs/Images/val1.gif)

 | | Flowers | Mirabelle Prune Tree | Sophie & Vincent 1 | Swans 1|
| --- | --- | --- | --- | --- |
|Sparse filter| <img src="docs/Images/F_35_45.png" width="300" > | <img src="docs/Images/MPT_35_45.png" width="300" > | <img src="docs/Images/Sophie_&_Vincent_1_35_45.png" width="300" > | <img src="docs/Images/Swans_1_35_45.png" width="300" > |
|Nonsparse filter| <img src="docs/Images/F_35_45_ht.png" width="300" > | <img src="docs/Images/MPT_35_45_ht.png" width="300" > | <img src="docs/Images/Sophie_&_Vincent_1_35_45_ht.png" width="300" > | <img src="docs/Images/Swans_1_35_45_ht.png" width="300" > |

#### Output comparison with different ![](docs/Images/bold_alpha.gif) values

Following is a visual comparison of output images obtained using the ***sparse filter*** with different ![](docs/Images/alpha.gif) values, on selected light fields. Here,

![](docs/Images/vary_alpha.gif)

| | ![](docs/Images/bold_alpha.gif)=60 | ![](docs/Images/bold_alpha.gif)=105 |
| --- | --- | --- |
| Books | <img src="docs/Images/Books_15_60_ht.png" width="300" > | <img src="docs/Images/Books_15_105_ht.png" width="300" > |
| Flowers | <img src="docs/Images/F_15_60_ht.png" width="300" > | <img src="docs/Images/F_15_105_ht.png" width="300" > |
| Gravel Garden | <img src="docs/Images/GG_15_60_ht.png" width="300" > | <img src="docs/Images/GG_15_105_ht.png" width="300" > |
| Sophie & Vincent 1 | <img src="docs/Images/Sophie_&_Vincent_1_15_60_ht.png" width="300" > | <img src="docs/Images/Sophie_&_Vincent_1_15_105_ht.png" width="300" > |
| Swans 1 | <img src="docs/Images/Swans_1_15_60_ht.png" width="300" > | <img src="docs/Images/Swans_1_15_105_ht.png" width="300" > |

