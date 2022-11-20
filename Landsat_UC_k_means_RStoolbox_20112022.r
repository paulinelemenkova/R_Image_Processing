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

