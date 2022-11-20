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

#-------------------- Bumba-2013: START-----------------#
# Set up working directory
setwd("/Users/polinalemenkova/Documents/R/53_UC_k_means/Bumba_LC08_L1TP_178058_20131223_20200912_02_T1")
# Importing data
Landsat_Bumba2013 <- list.files("/Users/polinalemenkova/Documents/R/53_UC_k_means/Bumba_LC08_L1TP_178058_20131223_20200912_02_T1")
# Printing the list
list.files()
#
# Stacking the data to create a RasterStack. 
Landsat_Bumba2013_stack <- stack(Landsat_Bumba2013)
# Turning a stack into a brick. 
Landsat_Bumba2013_brick <- brick(Landsat_Bumba2013_stack)
# Viewing brick attributes
Landsat_Bumba2013_brick
#
# Running the classification
set.seed(25)
unC <- unsuperClass(Landsat_Bumba2013_brick, nSamples = 100, nClasses = 10, nStarts = 5)
unC
#
# Creating color palette
#colors <- rainbow(10)
colors <- brewer.pal(n = 10, name = 'Paired')
#colors <- jet(10)
# plotting a map
plot(unC$map, main = "K-means Clustering for Landsat-8 OLI/TIRS C1 image of Bumba, Congo  \nLC08_L1TP_178058_20131223_20200912_02_T1 (2013)", font.main=1, cex.main = 0.85, col = colors, axes = FALSE, box = FALSE, legend = FALSE)
# adding legend
legend(x = "topleft", inset = 0.03, legend=c("1=Swamp forest", "2=Humid tropical forest", "3=Secondary forest", "4=Inundated grassland", "5=Deciduous forest", "6=Shrubland and grassland", "7=Urban areas", "8=Cropland and mosaic forest", "9=Water", "10=Savannah with sparse trees"), fill = colors, title = "LULC ID Classes", horiz = FALSE,  bty = "n", text.font=3, ncol=1)

#-------------------- Bumba-2013: END-----------------#


#-------------------- Bumba-2022: START-----------------#
# Set up working directory
setwd("/Users/polinalemenkova/Documents/R/53_UC_k_means/Bumba_LC08_L1TP_178058_20220130_20220204_02_T1")
# Importing data
Landsat_Bumba2022 <- list.files("/Users/polinalemenkova/Documents/R/53_UC_k_means/Bumba_LC08_L1TP_178058_20220130_20220204_02_T1")
# Printing the list
list.files()
#
# Stacking the data to create a RasterStack. 
Landsat_Bumba2022_stack <- stack(Landsat_Bumba2022)
# Turning a stack into a brick. 
Landsat_Bumba2022_brick <- brick(Landsat_Bumba2022_stack)
# Viewing brick attributes
Landsat_Bumba2022_brick
#
# Running the classification
set.seed(25)
unC <- unsuperClass(Landsat_Bumba2022_brick, nSamples = 100, nClasses = 10, nStarts = 5)
unC
#
# Creating color palette
#colors <- jet(10)
#colors <- rev(jet(10))
colors <- brewer.pal(n = 10, name = 'Paired')
# plotting a map
plot(unC$map, main = "K-means Clustering for Landsat-8 OLI/TIRS C1 image of Bumba, Congo  \nLC08_L1TP_178058_20220130_20220204_02_T1 (2022)", font.main=1, cex.main = 0.85, col = colors, axes = FALSE, box = FALSE, legend = FALSE)
# adding legend
legend(x = "topleft", inset = 0.03, legend=c("1=Swamp forest", "2=Humid tropical forest", "3=Secondary forest", "4=Inundated grassland", "5=Deciduous forest", "6=Shrubland and grassland", "7=Urban areas", "8=Cropland and mosaic forest", "9=Water", "10=Savannah with sparse trees"), fill = colors, title = "LULC ID Classes", horiz = FALSE,  bty = "n", text.font=3, ncol=1)

#-------------------- Bumba-2022: END-----------------#

#-------------------- Basoko-2013: START-----------------#
# Set up working directory
setwd("/Users/polinalemenkova/Documents/R/53_UC_k_means/Basoko_LC08_L1TP_177059_20131216_20200912_02_T1")
# Importing data
Landsat_Basoko2013 <- list.files("/Users/polinalemenkova/Documents/R/53_UC_k_means/Basoko_LC08_L1TP_177059_20131216_20200912_02_T1")
# Printing the list
list.files()
#
# Stacking the data to create a RasterStack. 
Landsat_Basoko2013_stack <- stack(Landsat_Basoko2013)
# Turning a stack into a brick. 
Landsat_Basoko2013_brick <- brick(Landsat_Basoko2013_stack)
# Viewing brick attributes
Landsat_Basoko2013_brick
#
# Running the classification
set.seed(25)
unC <- unsuperClass(Landsat_Basoko2013_brick, nSamples = 100, nClasses = 10, nStarts = 5)
unC
#
# Creating color palette
#colors <- rainbow(10)
#colors <- brewer.pal(n = 11, name = 'Paired')
colors <- rev(brewer.pal(n = 11, name = 'Paired'))
#colors <- jet(10)
# plotting a map
plot(unC$map, main = "K-means Clustering for Landsat-8 OLI/TIRS C1 image of Basoko, Congo  \nLC08_L1TP_177059_20131216_20200912_02_T1 (2013)", font.main=1, cex.main = 0.85, col = colors, axes = FALSE, box = FALSE, legend = FALSE)
# adding legend
legend(x = "topleft", inset = 0.03, legend=c("1=Swamp forest", "2=Humid tropical forest", "3=Secondary forest", "4=Water", "5=Deciduous forest", "6=Shrubland and grassland", "7=Urban areas", "8=Cropland and mosaic forest", "9=Inundated grassland", "10=Savannah with sparse trees"), fill = colors, title = "LULC ID Classes", horiz = FALSE,  bty = "n", text.font=3, ncol=1)

#-------------------- Basoko-2013: END-----------------#

#-------------------- Basoko-2022: START-----------------#
# Set up working directory
setwd("/Users/polinalemenkova/Documents/R/53_UC_k_means/Basoko_LC08_L1TP_177059_20220208_20220212_02_T1")
# Importing data
Landsat_Basoko2022 <- list.files("/Users/polinalemenkova/Documents/R/53_UC_k_means/Basoko_LC08_L1TP_177059_20220208_20220212_02_T1")
# Printing the list
list.files()
#
# Stacking the data to create a RasterStack. 
Landsat_Basoko2022_stack <- stack(Landsat_Basoko2022)
# Turning a stack into a brick. 
Landsat_Basoko2022_brick <- brick(Landsat_Basoko2022_stack)
# Viewing brick attributes
Landsat_Basoko2022_brick
#
# Running the classification
set.seed(25)
unC <- unsuperClass(Landsat_Basoko2022_brick, nSamples = 100, nClasses = 10, nStarts = 5)
unC
#
# Creating color palette
#colors <- rainbow(10)
#colors <- brewer.pal(n = 11, name = 'Paired')
colors <- rev(brewer.pal(n = 10, name = 'Paired'))
#colors <- jet(10)
# plotting a map
plot(unC$map, main = "K-means Clustering for Landsat-8 OLI/TIRS C1 image of Basoko, Congo  \nLC08_L1TP_177059_20220208_20220212_02_T1 (2022)", font.main=1, cex.main = 0.85, col = colors, axes = FALSE, box = FALSE, legend = FALSE)
# adding legend
legend(x = "topleft", inset = 0.03, legend=c("1=Swamp forest", "2=Humid tropical forest", "3=Secondary forest", "4=Water", "5=Deciduous forest", "6=Shrubland and grassland", "7=Urban areas", "8=Cropland and mosaic forest", "9=Inundated grassland", "10=Savannah with sparse trees"), fill = colors, title = "LULC ID Classes", horiz = FALSE,  bty = "n", text.font=3, ncol=1)

#-------------------- Basoko-2022: END-----------------#

#-------------------- Kisangani-2013: START-----------------#
# Set up working directory
setwd("/Users/polinalemenkova/Documents/R/53_UC_k_means/Kisangani_LC08_L1TP_176060_20130413_20200913_02_T1")
# Importing data
Landsat_Kisangani2013 <- list.files("/Users/polinalemenkova/Documents/R/53_UC_k_means/Kisangani_LC08_L1TP_176060_20130413_20200913_02_T1")
# Printing the list
list.files()
#
# Stacking the data to create a RasterStack. 
Landsat_Kisangani2013_stack <- stack(Landsat_Kisangani2013)
# Turning a stack into a brick. 
Landsat_Kisangani2013_brick <- brick(Landsat_Kisangani2013_stack)
# Viewing brick attributes
Landsat_Kisangani2013_brick
#
# Running the classification
set.seed(25)
unC <- unsuperClass(Landsat_Kisangani2013_brick, nSamples = 100, nClasses = 10, nStarts = 5)
unC
#
# Creating color palette
#colors <- rainbow(10)
colors <- brewer.pal(n = 11, name = 'Paired')
#colors <- rev(brewer.pal(n = 10, name = 'Paired'))
#colors <- jet(10)
# plotting a map
plot(unC$map, main = "K-means Clustering for Landsat-8 OLI/TIRS C1 image of Kisangani, Congo  \nKisangani_LC08_L1TP_176060_20130413_20200913_02_T1 (2013)", font.main=1, cex.main = 0.85, col = colors, axes = FALSE, box = FALSE, legend = FALSE)
# adding legend
legend(x = "topleft", inset = 0.03, legend=c("1=Urban areas", "2=Humid tropical forest", "3=Secondary forest", "4=Inundated grassland", "5=Deciduous forest", "6=Shrubland and grassland", "7=Water", "8=Cropland and mosaic forest", "9=Swamp forest", "10=Savannah, sparse trees"), fill = colors, title = "LULC ID Classes", horiz = FALSE,  bty = "n", text.font=3, ncol=1)

#-------------------- Kisangani-2013: END-----------------#

#-------------------- Kisangani-2015: START-----------------#
# Set up working directory
setwd("/Users/polinalemenkova/Documents/R/53_UC_k_means/Kisangani_LC08_L1TP_176060_20150113_20200910_02_T1")
# Importing data
Landsat_Kisangani2015 <- list.files("/Users/polinalemenkova/Documents/R/53_UC_k_means/Kisangani_LC08_L1TP_176060_20150113_20200910_02_T1")
# Printing the list
list.files()
#
# Stacking the data to create a RasterStack. 
Landsat_Kisangani2015_stack <- stack(Landsat_Kisangani2015)
# Turning a stack into a brick. 
Landsat_Kisangani2015_brick <- brick(Landsat_Kisangani2015_stack)
# Viewing brick attributes
Landsat_Kisangani2015_brick
#
# Running the classification
set.seed(25)
unC <- unsuperClass(Landsat_Kisangani2015_brick, nSamples = 100, nClasses = 10, nStarts = 5)
unC
#
# Creating color palette
#colors <- rainbow(10)
colors <- brewer.pal(n = 11, name = 'Paired')
colors <- rev(brewer.pal(n = 10, name = 'Paired'))
colors <- rev(brewer.pal(n = 12, name = 'Paired'))
#colors <- rev(brewer.pal(n = 10, name = 'Set2'))
#colors <- jet(10)
# plotting a map
plot(unC$map, main = "K-means Clustering for Landsat-8 OLI/TIRS C1 image of Kisangani, Congo  \nKisangani_LC08_L1TP_176060_20150113_20200910_02_T1 (2015)", font.main=1, cex.main = 0.85, col = colors, axes = FALSE, box = FALSE, legend = FALSE)
# adding legend
legend(x = "topleft", inset = 0.03, legend=c("1=Cropland and mosaic forest", "2=Humid tropical forest", "3=Water", "4=Inundated grassland", "5=Deciduous forest", "6=Shrubland and grassland", "7=Secondary forest", "8=Urban areas", "9=Swamp forest", "10=Savannah, sparse trees"), fill = colors, title = "LULC ID Classes", horiz = FALSE,  bty = "n", text.font=3, ncol=1)

#-------------------- Kisangani-2015: END-----------------#

#-------------------- Kisangani-2022: START-----------------#
# Set up working directory
setwd("/Users/polinalemenkova/Documents/R/53_UC_k_means/Kisangani_LC08_L1TP_176060_20220217_20220302_02_T1")
# Importing data
Landsat_Kisangani2022 <- list.files("/Users/polinalemenkova/Documents/R/53_UC_k_means/Kisangani_LC08_L1TP_176060_20220217_20220302_02_T1")
# Printing the list
list.files()
#
# Stacking the data to create a RasterStack. 
Landsat_Kisangani2022_stack <- stack(Landsat_Kisangani2022)
# Turning a stack into a brick. 
Landsat_Kisangani2022_brick <- brick(Landsat_Kisangani2022_stack)
# Viewing brick attributes
Landsat_Kisangani2022_brick
#
# Running the classification
set.seed(25)
unC <- unsuperClass(Landsat_Kisangani2022_brick, nSamples = 100, nClasses = 10, nStarts = 5)
unC
#
# Creating color palette
#colors <- rainbow(10)
colors <- brewer.pal(n = 10, name = 'Paired')
#colors <- rev(brewer.pal(n = 10, name = 'Paired'))
#colors <- jet(10)
# plotting a map
plot(unC$map, main = "K-means Clustering for Landsat-8 OLI/TIRS C1 image of Kisangani, Congo  \nKisangani_LC08_L1TP_176060_20220217_20220302_02_T1 (2022)", font.main=1, cex.main = 0.85, col = colors, axes = FALSE, box = FALSE, legend = FALSE)
# adding legend
legend(x = "topleft", inset = 0.03, legend=c("1=Inundated grassland", "2=Humid tropical forest", "3=Savannah, sparse trees", "4=Cropland and mosaic forest", "5=Deciduous forest", "6=Urban areas", "7=Water", "8=Shrubland and grassland", "9=Swamp forest", "10=Secondary forest"), fill = colors, title = "LULC ID Classes", horiz = FALSE,  bty = "n", text.font=3, ncol=1)

#-------------------- Kisangani-2022: END-----------------#

