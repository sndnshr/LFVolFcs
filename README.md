# Light Field Refocusing with 4-D Sparse FIR Hyperfan Filter
This is a MATLAB implementation of the sparse FIR hyperfan filter for light field refocusing.

- Reference: Sanduni U. Premaratne, Chamira U. S. Edussooriya, Chamith Wijenayake, Len T. Bruton and Panajotis Agathoklis,"A 4-D Sparse FIR Hyperfan Filter for Volumetric Refocusing of Light Fields", pp.1-5, [IEEE DSP 2018](http://dsp2018.org/home.asp) (Accepted)
- License: [BSD 2-Clause](./BSD_2-Clause_Simplified.md)

We kindly request you to cite the above paper in case you refer this work.

## Conventions
The input light field should be in MAT file format (.mat extension). 

Parameters:
- ![](docs/Images/alpha.gif) - Orientation of the fan filter in the ![](docs/Images/xu.gif) and ![](docs/Images/yv.gif) subspaces.
- ![](docs/Images/theta.gif) - Half fan angle.
- B - Length of the bow-tie shaped passband.
- T - Angular width of the bow-tie shaped passband.

## Results
### Output comparison between sparse and nonsparse FIR Hyperfan filter

Results for both sparse and nonsparse filters of the same parameters, are shown below for selected light fields of [EPFL dataset](https://mmspg.epfl.ch/EPFL-light-field-image-dataset) for visual comparison. As a representative case, following values are chosen for the filter parameters ![](docs/Images/alpha.gif), ![](docs/Images/theta.gif), *B* and *T*. 

![val1](docs/Images/val1.gif)![](docs/Images/order.gif)![](docs/Images/hth1.gif)

[SSIM](https://en.wikipedia.org/wiki/Structural_similarity) values of the volumetric refocused images obtained using the proposed ***sparse filter***, with respect to those obtained using the nonsparse filter, are given below.

| Light field | Sparse filter | Nonsparse filter | SSIM |
| --- | --- | --- | --- |
| Flowers | <img src="docs/Images/F_35_45_ht.png" width="300" > | <img src="docs/Images/F_35_45.png" width="300" > | 0.9882 |
| Mirabelle Prune Tree | <img src="docs/Images/MPT_35_45_ht.png" width="300" > | <img src="docs/Images/MPT_35_45.png" width="300" > | 0.9714 |
| Sophie & Vincent 1 | <img src="docs/Images/Sophie_&_Vincent_1_35_45_ht.png" width="300" > | <img src="docs/Images/Sophie_&_Vincent_1_35_45.png" width="300" > | 0.9897 |
| Swans 1 | <img src="docs/Images/Swans_1_35_45_ht.png" width="300" > | <img src="docs/Images/Swans_1_35_45.png" width="300" > | 0.9916 |



### Output comparison with different ![](docs/Images/bold_alpha.gif) values

Following is a visual comparison of output images obtained using the ***sparse filter*** with different ![](docs/Images/alpha.gif) values, on selected light fields. Here,

![](docs/Images/vary_alpha.gif)![](docs/Images/order.gif)![](docs/Images/hth1.gif)

| | ![](docs/Images/bold_alpha.gif)=60 | ![](docs/Images/bold_alpha.gif)=105 |
| --- | --- | --- |
| Books | <img src="docs/Images/Books_15_60_ht.png" width="300" > | <img src="docs/Images/Books_15_105_ht.png" width="300" > |
| Flowers | <img src="docs/Images/F_15_60_ht.png" width="300" > | <img src="docs/Images/F_15_105_ht.png" width="300" > |
| Gravel Garden | <img src="docs/Images/GG_15_60_ht.png" width="300" > | <img src="docs/Images/GG_15_105_ht.png" width="300" > |
| Sophie & Vincent 1 | <img src="docs/Images/Sophie_&_Vincent_1_15_60_ht.png" width="300" > | <img src="docs/Images/Sophie_&_Vincent_1_15_105_ht.png" width="300" > |
| Swans 1 | <img src="docs/Images/Swans_1_15_60_ht.png" width="300" > | <img src="docs/Images/Swans_1_15_105_ht.png" width="300" > |


### Comparison between sparse and nonsparse FIR Hyperfan filter

Normalized root mean square error (NRMSE) is used to quantify the deviation of the frequency response of the sparse filter compared to the nonsparse filter.

![](docs/Images/nrmse_e.gif)                   

where,

![](docs/Images/k.gif)

![](docs/Images/spase_H.gif) - Frequency response of the sparse filter

![](docs/Images/nonsparse_H.gif) - Frequency response of the nonsparse filter

![](docs/Images/fx.gif) - FFT length for ![](docs/Images/nx.gif) dimension

![](docs/Images/fu.gif) - FFT length for ![](docs/Images/nu.gif) dimension

Furthermore, number of non-zero coefficients of the sparse filter with respect to that of nonsparse filter, can be used as a metric to evaluate the reduction of computational complexity.

##### Varying ![](docs/Images/alpha.gif) and ![](docs/Images/hth.gif)

![](docs/Images/vary_alpha.gif)![](docs/Images/order.gif)

 <img src="docs/Images/RMSE_alpha_hth.png" width="430" >  <img src="docs/Images/nonZeroCoef_vs_alpha_hth.png" width="430" > 

##### Varying ![](docs/Images/alpha.gif) and ![](docs/Images/theta.gif)

![](docs/Images/vary_alpha_theta.gif)![](docs/Images/order.gif)

 <img src="docs/Images/RMSE_alpha_theta.png" width="430" >  <img src="docs/Images/nonZeroCoef_vs_alpha_theta.png" width="430" >
