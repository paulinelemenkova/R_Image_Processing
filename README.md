# R k-means Classification and NDVI — Congo River Basin, DRC

R scripts for unsupervised classification and vegetation-index computation of
Landsat OLI/TIRS imagery over the Congo River Basin in the Democratic Republic
of the Congo (the Basoko and Kisangani regions). The repository couples the
paper's applied workflow (k-means classification, NDVI, colour composites) with
a short, self-contained terra tutorial series that builds the method up from
raster basics.

## Related publication

The Landsat_UC_* scripts are the code of:

Lemenkova, P.; Debeir, O. R Libraries for Remote Sensing Data Classification by
k-means Clustering and NDVI Computation in Congo River Basin, DRC. Applied
Sciences 2022, 12(24), 12554.

- DOI:    https://doi.org/10.3390/app122412554
- Zenodo: https://doi.org/10.5281/zenodo.7426773
- MDPI:   https://www.mdpi.com/2076-3417/12/24/12554 (ISSN 2076-3417, Scopus / Web of Science)

## Applied workflow (Congo River Basin)

- Landsat_UC_metadata_rGDAL.r: reads a Landsat scene and inspects its metadata,
  grid, extent and CRS with rgdal / raster.
- Landsat_UC_color_composites.r: true-colour and false-colour composites
  (plotRGB with contrast stretching) of the Basoko / Kisangani scenes.
- Landsat_UC_NDVI.r: NDVI = (NIR - Red) / (NIR + Red) from Bands 5 and 4, mapped
  with a histogram of the value distribution.
- Landsat_UC_k_means_RStoolbox.r: unsupervised k-means classification of the
  multiband stack into land-cover classes with RStoolbox::unsuperClass (raster
  stack / brick, per-class colour palette and legend).
- Landsat_grayscale_multibands_Basoko.r: grayscale multi-band display of the
  Basoko scene.
- The *_20112022.r files are dated working copies of the composites / NDVI /
  k-means scripts; Echo_grep.r is a small shell/grep helper.

## terra tutorial series

R_1_terra_metadata.r through R_6_terra_NDVI.r form a step-by-step introduction
with the terra package: (1) reading a scene and its metadata; (2) single-band
and grayscale multi-band display; (3) raster band handling; (4) subsetting the
visible/NIR bands; (5) inter-band correlation (pairs plots of e.g. Red vs NIR);
(6) NDVI computation.

## Methods

- Unsupervised k-means clustering of multispectral imagery into land-cover
  classes (RStoolbox).
- NDVI vegetation-index computation by band arithmetic (terra / raster).
- True-/false-colour composite generation with contrast stretching.
- Raster metadata inspection, band subsetting and inter-band correlation.

## Data

- Landsat 8-9 OLI/TIRS scenes over the Congo River Basin, DRC (path/rows 176060,
  177059, 178058; Basoko and Kisangani), plus example scenes used by the terra
  tutorials. The GeoTIFF bands are expected in the working directory and are not
  stored in this repository.

## Requirements

- R (>= 4.0); packages: terra, raster, rgdal, RStoolbox, RColorBrewer, viridis,
  viridisLite, pals, colorspace

## Usage

Place the Landsat bands for a scene in the working directory and run, e.g.:

    Rscript Landsat_UC_k_means_RStoolbox.r
    Rscript Landsat_UC_NDVI.r

## Authors and citation

Polina Lemenkova, Olivier Debeir
ORCID: https://orcid.org/0000-0002-5759-1089

If you use the applied scripts, please cite:

Lemenkova, P.; Debeir, O. R Libraries for Remote Sensing Data Classification by
k-means Clustering and NDVI Computation in Congo River Basin, DRC. Applied
Sciences 2022, 12(24), 12554. https://doi.org/10.3390/app122412554

## License

See the LICENSE file in this repository (Copyright Polina Lemenkova).
