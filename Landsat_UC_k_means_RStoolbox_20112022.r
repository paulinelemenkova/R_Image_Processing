library(rgdal)
library(raster)
#library(terra)
library(RColorBrewer)
library(viridis)
library("viridisLite")
library(pals)
library(colorspace)
library(RStoolbox)
library(graphics)

#--------------------1. Basoko-2013-----------------#
# Set up working directory
setwd("/Users/polinalemenkova/Documents/R/53_UC_k_means/Basoko_LC08_L1TP_177059_20131216_20200912_02_T1")
# Importing data
Landsat_Basoko2013 <- list.files("/Users/polinalemenkova/Documents/R/53_UC_k_means/Basoko_LC08_L1TP_177059_20131216_20200912_02_T1")
# Printing the list
list.files()


# Creating the object of RasterLayer class for one random band
Basoko2013_B2 <- raster(Landsat_Basoko2013[2])
Basoko2013_B2

Basoko2013_B4 <- raster(Landsat_Basoko2013[4])
Basoko2013_B4

Basoko2013_B5 <- raster(Landsat_Basoko2013[5])
Basoko2013_B5

# Plotting one random band
colors <- kovesi.cyclic_grey_15_85_c0(100)
par(mfrow=c(1,1))
plot(Basoko2013_B5, main = "Landsat OLI/TIRS 2013 band 5 Basoko, Congo \nLC08_L1TP_177059_20131216_20200912_02_T1", font.main=2, cex.main = 0.90, axes = FALSE, box = FALSE, legend = FALSE, col = gray(0:100 / 100))

# Stacking the data to create a RasterStack. A RasterStack is a collection of RasterLayer objects (layers of selected bands) with the same spatial extent and resolution. A RasterStack can be created from RasterLayer objects, or from raster files
# Landsat_Basoko2013_stack <- stack(Landsat_Basoko2013)
# Turning a stack into a brick. RasterBrick is a multi-layer raster object created from the multi-layer file(s) (bands). RasterBrick is similar to a RasterStack (that can be created with stack), but processing time is shorter for RasterBrick. RasterBrick is less flexible as it can only point to a single file.
# Landsat_Basoko2013_brick <- brick(Landsat_Basoko2013_stack)
Landsat_Basoko2013_brick <- brick(Basoko2013_B2)
# Viewing brick attributes
Landsat_Basoko2013_brick

# Plotting RGB triplet from RasterBrick
olpar <- par(no.readonly = TRUE) # back-up par
#par(mfrow=c(1,2))
par(mfrow=c(1,1))
plotRGB(Landsat_Basoko2013_brick)

## Running the classification
set.seed(25)
unC <- unsuperClass(Landsat_Basoko2013_brick, nSamples = 100, nClasses = 10, nStarts = 5)
unC

# Creating color palette, e.g., colors <- rainbow(10)
# colors <- kovesi.rainbow_bgyrm_35_85_c69(10)
# colors <- kovesi.rainbow_bgyr_35_85_c72(100)
colors <- kovesi.rainbow_bgyr_35_85_c73(100)
colors <- kovesi.rainbow_bgyr_35_85_c73(10)
# plotting a map
plot(unC$map, main = "K-means Clustering for Landsat-8 OLI/TIRS C1 image of Basoko, Congo  \nLC08_L1TP_177059_20131216_20200912_02_T1 (2013)", font.main=2, cex.main = 0.95, col = colors, axes = FALSE, box = FALSE, legend = FALSE)
# adding legend
legend("topleft", legend=c("1", "2", "3", "4", "5", "6", "7", "8", "9", "10"), fill = colors, title = "Classes", horiz = FALSE,  bty = "n", text.font=3, ncol=1)


#--------------------2. Basoko-2022-----------------#
# Set up working directory
setwd("/Users/polinalemenkova/Documents/R/53_UC_k_means/Basoko_LC08_L1TP_177059_20220208_20220212_02_T1")
# Importing data
Landsat_Basoko2022 <- list.files("/Users/polinalemenkova/Documents/R/53_UC_k_means/Basoko_LC08_L1TP_177059_20220208_20220212_02_T1")
# Printing the list
list.files()

# Creating the object of RasterLayer class for one band
Basoko2022_B2 <- raster(Landsat_Basoko2022[2])
Basoko2022_B2

Basoko2022_B5 <- raster(Landsat_Basoko2022[5])
Basoko2022_B5

colors <- kovesi.linear_grey_10_95_c0(100)
# Plotting one band
plot(Basoko2022_B5,
    main = "Landsat OLI/TIRS 2022 band 2 Basoko, Congo \nLC08_L1TP_177059_20220208_20220212_02_T1", font.main=2, cex.main = 0.90, axes = FALSE, box = FALSE, legend = FALSE, col = gray(0:100 / 100))

# Stacking the data to create a RasterStack. A RasterStack is a collection of RasterLayer objects (layers of selected bands) with the same spatial extent and resolution. A RasterStack can be created from RasterLayer objects, or from raster files
Landsat_Basoko2022_stack <- stack(Landsat_Basoko2022)
# Turning a stack into a brick. RasterBrick is a multi-layer raster object created from the multi-layer file(s) (bands). RasterBrick is similar to a RasterStack (that can be created with stack), but processing time is shorter for RasterBrick. RasterBrick is less flexible as it can only point to a single file.
# Landsat_Basoko2022_brick <- brick(Landsat_Basoko2022_stack)
Landsat_Basoko2022_brick <- brick(Basoko2022_B2)
# Viewing brick attributes
Landsat_Basoko2022_brick

# Plotting RGB triplet from RasterBrick
olpar <- par(no.readonly = TRUE) # back-up par
par(mfrow=c(1,1))
plotRGB(Landsat_Basoko2022_brick)

## Running the classification
set.seed(25)
unC <- unsuperClass(Landsat_Basoko2022_brick, nSamples = 100, nClasses = 10, nStarts = 5)
unC

# Creating color palette, e.g., colors <- rainbow(10)
# colors <- brewer.pal(10, "Paired")
colors <- kovesi.diverging_rainbow_bgymr_45_85_c67(10)
no_of_colors <- 10
colors <- viridis_pal(option = "H")(no_of_colors)
colors <- rainbow(10)
colors <- jet(10)
# plotting a map
plot(unC$map, main = "K-means Clustering for Landsat-8 OLI/TIRS C1 image of Basoko, Congo  \nL1TP_177059_20220208_20220212_02_T1 (2022)", font.main=2, cex.main = 0.95, col = colors, axes = FALSE, box = FALSE, legend = FALSE)
# adding legend
legend(x = "topleft", inset = 0.11, legend=c("1", "2", "3", "4", "5", "6", "7", "8", "9", "10"), fill = colors, title = "Classes", horiz = FALSE,  bty = "n", text.font=3, ncol=1)

#--------------------3. Kisangani-2013-----------------#
# Set up working directory
setwd("/Users/polinalemenkova/Documents/R/53_UC_k_means/Kisangani_LC08_L1TP_176060_20130413_20200913_02_T1")
# Importing data
Landsat_Kisangani2022 <- list.files("/Users/polinalemenkova/Documents/R/53_UC_k_means/Kisangani_LC08_L1TP_176060_20130413_20200913_02_T1")
# Printing the list
list.files()

# Creating the object of RasterLayer class for one band
Kisangani2013_B2 <- raster(Landsat_Kisangani2022[2])
Kisangani2013_B2
Kisangani2013_B5 <- raster(Landsat_Kisangani2022[5])
Kisangani2013_B5
Kisangani2013_B4 <- raster(Landsat_Kisangani2022[4])
Kisangani2013_B4
Kisangani2013_B3 <- raster(Landsat_Kisangani2022[3])
Kisangani2013_B3
Kisangani2013_B7 <- raster(Landsat_Kisangani2022[7])
Kisangani2013_B7

# colors <- kovesi.linear_blue_95_50_c20(100)
# colors <- kovesi.isoluminant_cm_70_c39(100)
colors <- gray(0:100 / 100)
# Plotting one band
plot(Kisangani2013_B7, main = "Landsat OLI/TIRS 2022 band 5 (NIR) Kisangani, Congo \nLC08_L1TP_176060_20130413_20200913_02_T1", font.main=2, cex.main = 0.90, axes = FALSE, box = FALSE, legend = TRUE, col = gray(0:100 / 100))
legend("topleft", fill = colors, horiz = FALSE,  bty = "n", text.font=3, ncol=1)

# Stacking the data to create a RasterStack. A RasterStack is a collection of RasterLayer objects (layers of selected bands) with the same spatial extent and resolution. A RasterStack can be created from RasterLayer objects, or from raster files
# Landsat_Kisangani2022_stack <- stack(Landsat_Kisangani2022)
# Turning a stack into a brick. RasterBrick is a multi-layer raster object created from the multi-layer file(s) (bands). RasterBrick is similar to a RasterStack (that can be created with stack), but processing time is shorter for RasterBrick. RasterBrick is less flexible as it can only point to a single file.
# Landsat_Kisangani2022_brick <- brick(Landsat_Basoko2022_stack)
Landsat_Kisangani2013_brick <- brick(Kisangani2013_B7)
# Viewing brick attributes
Landsat_Kisangani2013_brick

# Plotting RGB triplet from RasterBrick
olpar <- par(no.readonly = TRUE) # back-up par
par(mfrow=c(1,1))
plotRGB(Landsat_Kisangani2013_brick)

## Running the classification
set.seed(25)
unC <- unsuperClass(Landsat_Kisangani2013_brick, nSamples = 100, nClasses = 10, nStarts = 5)
unC

# Creating color palette, e.g., colors <- rainbow(10)
# colors <- brewer.pal(10, "Paired")
# colors <- kovesi.diverging_rainbow_bgymr_45_85_c67(100)
# colors <- kovesi.cyclic_mygbm_30_95_c78(10)
# colors <- kovesi.cyclic_mrybm_35_75_c68_s25(100)
# colors <- kovesi.cyclic_mygbm_30_95_c78_s25(100)
# colors <- alphabet2
colors <- alphabet2(10)
colors <- alphabet(10)
no_of_colors <- 10
colors <- viridis_pal(option = "H")(10)
colors <- rainbow(10)
colors <- brewer.spectral(10)
colors <- jet(5)
colors <- kovesi.diverging_rainbow_bgymr_45_85_c67(10)
colors <- kovesi.cyclic_mygbm_30_95_c78(10)
# plotting a map
plot(unC$map, main = "K-means Clustering for Landsat-8 OLI/TIRS C1 image of Kisangani, Congo  \nLC08_L1TP_176060_20130413_20200913_02_T1 (2013)", font.main=2, cex.main = 0.95, col = colors, axes = FALSE, box = FALSE, legend = FALSE)
# adding legend
legend("topleft", legend=c("1", "2", "3", "4", "5", "6", "7", "8", "9", "10"), fill = colors, title = "Classes", horiz = FALSE,  bty = "n", text.font=3, ncol=1)

#--------------------3. Kisangani-2015-----------------#
# Set up working directory
setwd("/Users/polinalemenkova/Documents/R/53_UC_k_means/Kisangani_LC08_L1TP_176060_20150113_20200910_02_T1")
# Importing data
Landsat_Kisangani2015 <- list.files("/Users/polinalemenkova/Documents/R/53_UC_k_means/Kisangani_LC08_L1TP_176060_20150113_20200910_02_T1")
# Printing the list
list.files()

# Creating the object of RasterLayer class for one band
Kisangani2015_B2 <- raster(Landsat_Kisangani2015[2])
Kisangani2015_B2

colors <- kovesi.linear_grey_10_95_c0(100)
# Plotting one band
plot(Kisangani2015_B2,
    main = "Landsat OLI/TIRS 2022 band 2 Kisangani, Congo \nLC08_L1TP_176060_20150113_20200910_02_T1", font.main=2, cex.main = 0.90, axes = FALSE, box = FALSE, legend = FALSE, col = colors)

# Stacking the data to create a RasterStack. A RasterStack is a collection of RasterLayer objects (layers of selected bands) with the same spatial extent and resolution. A RasterStack can be created from RasterLayer objects, or from raster files
# Landsat_Kisangani2015_stack <- stack(Landsat_Kisangani2015)
# Turning a stack into a brick. RasterBrick is a multi-layer raster object created from the multi-layer file(s) (bands). RasterBrick is similar to a RasterStack (that can be created with stack), but processing time is shorter for RasterBrick. RasterBrick is less flexible as it can only point to a single file.
# Landsat_Kisangani2022_brick <- brick(Landsat_Basoko2022_stack)
Landsat_Kisangani2015_brick <- brick(Kisangani2015_B2)
# Viewing brick attributes
Landsat_Kisangani2015_brick

# Plotting RGB triplet from RasterBrick
olpar <- par(no.readonly = TRUE) # back-up par
par(mfrow=c(1,1))
plotRGB(Landsat_Kisangani2015_brick)

## Running the classification
set.seed(25)
unC <- unsuperClass(Landsat_Kisangani2015_brick, nSamples = 100, nClasses = 10, nStarts = 5)
unC

# Creating color palette, e.g., colors <- rainbow(10)
# colors <- brewer.pal(10, "Paired")
# colors <- kovesi.diverging_rainbow_bgymr_45_85_c67(100)
# colors <- kovesi.cyclic_mygbm_30_95_c78(10)
# colors <- kovesi.cyclic_mrybm_35_75_c68_s25(100)
# colors <- kovesi.cyclic_mygbm_30_95_c78_s25(100)
colors <- alphabet2
colors <- alphabet2(10)
no_of_colors <- 10
# colors <- viridis_pal(option = "H")(no_of_colors)
colors <- viridis_pal(option = "H")(10)
colors=jet.colors(10)
rainbow

colors <- palette
colors <- rainbow(10)
colors <- jet(10)
# plotting a map
plot(unC$map, main = "K-means Clustering for Landsat-8 OLI/TIRS C1 image of Kisangani, Congo  \nLC08_L1TP_176060_20220217_20220302_02_T1 (2022)", font.main=2, cex.main = 0.95, col = colors, axes = FALSE, box = FALSE, legend = FALSE)
# adding legend
legend("topleft", legend=c("1", "2", "3", "4", "5", "6", "7", "8", "9", "10"), fill = colors, title = "Classes", horiz = FALSE,  bty = "n", text.font=3, ncol=1)

#--------------------3. Kisangani-2022-----------------#
# Set up working directory
setwd("/Users/polinalemenkova/Documents/R/53_UC_k_means/Kisangani_LC08_L1TP_176060_20220217_20220302_02_T1")
# Importing data
Landsat_Kisangani2022 <- list.files("/Users/polinalemenkova/Documents/R/53_UC_k_means/Kisangani_LC08_L1TP_176060_20220217_20220302_02_T1")
# Printing the list
list.files()

# Creating the object of RasterLayer class for one band
Kisangani2022_B2 <- raster(Landsat_Kisangani2022[2])
Kisangani2022_B2

colors <- kovesi.linear_grey_10_95_c0(100)
# Plotting one band
plot(Kisangani2022_B2,
    main = "Landsat OLI/TIRS 2022 band 2 Kisangani, Congo \nLC08_L1TP_176060_20220217_20220302_02_T1", font.main=2, cex.main = 0.90, axes = FALSE, box = FALSE, legend = FALSE, col = colors)

# Stacking the data to create a RasterStack. A RasterStack is a collection of RasterLayer objects (layers of selected bands) with the same spatial extent and resolution. A RasterStack can be created from RasterLayer objects, or from raster files
# Landsat_Kisangani2022_stack <- stack(Landsat_Kisangani2022)
# Turning a stack into a brick. RasterBrick is a multi-layer raster object created from the multi-layer file(s) (bands). RasterBrick is similar to a RasterStack (that can be created with stack), but processing time is shorter for RasterBrick. RasterBrick is less flexible as it can only point to a single file.
# Landsat_Kisangani2022_brick <- brick(Landsat_Basoko2022_stack)
Landsat_Kisangani2022_brick <- brick(Kisangani2022_B2)
# Viewing brick attributes
Landsat_Kisangani2022_brick

# Plotting RGB triplet from RasterBrick
olpar <- par(no.readonly = TRUE) # back-up par
par(mfrow=c(1,1))
plotRGB(Landsat_Kisangani2022_brick)

## Running the classification
set.seed(25)
unC <- unsuperClass(Landsat_Kisangani2022_brick, nSamples = 100, nClasses = 10, nStarts = 5)
unC

# Creating color palette, e.g., colors <- rainbow(10)
# colors <- brewer.pal(10, "Paired")
# colors <- kovesi.diverging_rainbow_bgymr_45_85_c67(100)
# colors <- kovesi.cyclic_mygbm_30_95_c78(10)
# colors <- kovesi.cyclic_mrybm_35_75_c68_s25(100)
# colors <- kovesi.cyclic_mygbm_30_95_c78_s25(100)
# colors <- alphabet2
colors <- alphabet2(10)
no_of_colors <- 10
palette <- viridis_pal(option = "H")(no_of_colors)
rainbow

colors <- palette
colors <- rainbow(10)
colors <- jet(100)
# plotting a map
plot(unC$map, main = "K-means Clustering for Landsat-8 OLI/TIRS C1 image of Kisangani, Congo  \nLC08_L1TP_176060_20220217_20220302_02_T1 (2022)", font.main=2, cex.main = 0.95, col = colors, axes = FALSE, box = FALSE, legend = FALSE)
# adding legend
legend("topleft", legend=c("1", "2", "3", "4", "5", "6", "7", "8", "9", "10"), fill = colors, title = "Classes", horiz = FALSE,  bty = "n", text.font=3, ncol=1)

#--------------------1. Bumba-2013-----------------#
# Set up working directory
setwd("/Users/polinalemenkova/Documents/R/53_UC_k_means/Bumba_LC08_L1TP_178058_20131223_20200912_02_T1")
# Importing data
Landsat_Bumba2013 <- list.files("/Users/polinalemenkova/Documents/R/53_UC_k_means/Bumba_LC08_L1TP_178058_20131223_20200912_02_T1")
# Printing the list
list.files()

# Creating the object of RasterLayer class for one random band
Bumba2013_B5 <- raster(Landsat_Bumba2013[5])
Bumba2013_B5

Bumba2013_B2 <- raster(Landsat_Bumba2013[2])
Bumba2013_B2

# Plotting one randon band
# colors <- kovesi.cyclic_grey_15_85_c0_s25(100)
# colors <- kovesi.cyclic_grey_15_85_c0(100)
# colors <- jet(10)
# colors <- ocean.gray(100)
# colors <- brewer.greys(100)
par(mfrow=c(1,1))
plot(Bumba2013_B5, main = "Landsat OLI/TIRS 2013 band 2 Bumba, Congo \nLC08_L1TP_178058_20131223_20200912_02_T1", font.main=2, cex.main = 0.90, axes = FALSE, box = FALSE, legend = FALSE, col = colors)

# Stacking the data to create a RasterStack. A RasterStack is a collection of RasterLayer objects (layers of selected bands) with the same spatial extent and resolution. A RasterStack can be created from RasterLayer objects, or from raster files
 Landsat_Bumba2013_stack <- stack(Landsat_Bumba2013)
# Turning a stack into a brick. RasterBrick is a multi-layer raster object created from the multi-layer file(s) (bands). RasterBrick is similar to a RasterStack (that can be created with stack), but processing time is shorter for RasterBrick. RasterBrick is less flexible as it can only point to a single file.
# Landsat_Bumba2013_brick <- brick(Landsat_Bumba2013_stack)
Landsat_Bumba2013_brick <- brick(Bumba2013_B2)
# Viewing brick attributes
Landsat_Bumba2013_brick

# Plotting RGB triplet from RasterBrick
olpar <- par(no.readonly = TRUE) # back-up par
#par(mfrow=c(1,2))
par(mfrow=c(1,1))
plotRGB(Landsat_Bumba2013_brick)

## Running the classification
set.seed(25)
unC <- unsuperClass(Landsat_Bumba2013_brick, nSamples = 100, nClasses = 10, nStarts = 5)
unC

# Creating color palette, e.g., colors <- rainbow(10)
colors <- kovesi.linear_bmy_10_95_c71(10)
# plotting a map
plot(unC$map, main = "K-means Clustering for Landsat-8 OLI/TIRS C1 image of Bumba, Congo  \nLC08_L1TP_178058_20131223_20200912_02_T1 (2013)", font.main=1, cex.main = 0.85, col = colors, axes = FALSE, box = FALSE, legend = FALSE)
# adding legend
legend(x = "topleft", inset = 0.11, legend=c("1", "2", "3", "4", "5", "6", "7", "8", "9", "10"), fill = colors, title = "Classes", horiz = FALSE,  bty = "n", text.font=3, ncol=1)

#--------------------1. Bumba-2022-----------------#
# Set up working directory
setwd("/Users/polinalemenkova/Documents/R/53_UC_k_means/Bumba_LC08_L1TP_178058_20220130_20220204_02_T1")
# Importing data
Landsat_Bumba2022 <- list.files("/Users/polinalemenkova/Documents/R/53_UC_k_means/Bumba_LC08_L1TP_178058_20220130_20220204_02_T1")
# Printing the list
list.files()

# Creating the object of RasterLayer class for one random band
Bumba2022_B2 <- raster(Landsat_Bumba2022[2])
Bumba2022_B2

Bumba2022_B4 <- raster(Landsat_Bumba2022[4])
Bumba2022_B4

Bumba2022_B5 <- raster(Landsat_Bumba2022[5])
Bumba2022_B5

# Plotting one randon band
# colors <- kovesi.cyclic_grey_15_85_c0_s25(100)
colors <- kovesi.cyclic_grey_15_85_c0(10)
# colors <- jet(10)
# colors <- ocean.gray(100)
# colors <- brewer.greys(100)
par(mfrow=c(1,1))
plot(Bumba2022_B5, main = "Landsat OLI/TIRS 2013 band 5 (NIR) Bumba, Congo \nLC08_L1TP_178058_20220130_20220204_02_T1", font.main=2, cex.main = 0.90, axes = FALSE, box = FALSE, legend = FALSE, col = colors)

# Stacking the data to create a RasterStack. A RasterStack is a collection of RasterLayer objects (layers of selected bands) with the same spatial extent and resolution. A RasterStack can be created from RasterLayer objects, or from raster files
 # Landsat_Bumba2013_stack <- stack(Landsat_Bumba2013)
# Turning a stack into a brick. RasterBrick is a multi-layer raster object created from the multi-layer file(s) (bands). RasterBrick is similar to a RasterStack (that can be created with stack), but processing time is shorter for RasterBrick. RasterBrick is less flexible as it can only point to a single file.
# Landsat_Bumba2013_brick <- brick(Landsat_Bumba2013_stack)
Landsat_Bumba2022_brick <- brick(Bumba2022_B2)
# Viewing brick attributes
Landsat_Bumba2022_brick

# Plotting RGB triplet from RasterBrick
olpar <- par(no.readonly = TRUE) # back-up par
#par(mfrow=c(1,2))
par(mfrow=c(1,1))
plotRGB(Landsat_Bumba2022_brick)

## Running the classification
set.seed(25)
unC <- unsuperClass(Landsat_Bumba2022_brick, nSamples = 100, nClasses = 10, nStarts = 5)
unC

# Creating color palette, e.g., colors <- rainbow(10)
# colors <- brewer.pal(10, "Paired")
# colors <- brewer.pal(10, "Paired")
# no_of_colors <- 10
# palette <- viridis_pal(option = "H")(no_of_colors)

colors <- palette
colors <- rainbow(10)
colors <- cubicl(100)
colors <- kovesi.diverging_rainbow_bgymr_45_85_c67(10)
colors <- kovesi.cyclic_mygbm_30_95_c78(100)
colors <- kovesi.cyclic_mrybm_35_75_c68(10)
colors <- kovesi.linear_bmy_10_95_c78(10)
# plotting a map
plot(unC$map, main = "K-means Clustering for Landsat-8 OLI/TIRS C1 image of Bumba, Congo  \nLC08_L1TP_178058_20131223_20200912_02_T1 (2013)", font.main=1, cex.main = 0.95, col = colors, axes = FALSE, box = FALSE, legend = FALSE)
# adding legend
legend(x = "topleft", inset = 0.11, legend=c("1", "2", "3", "4", "5", "6", "7", "8", "9", "10"), fill = colors, title = "Classes", horiz = FALSE,  bty = "n", text.font=3, ncol=1)
