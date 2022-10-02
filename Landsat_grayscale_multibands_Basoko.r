library(raster)
library(terra)
## terra version 1.2.11
# Change working directory
setwd("/Users/polinalemenkova/Documents/R/53_UC_k_means/Basoko_LC08_L1TP_177059_20220208_20220212_02_T1")
b1 <- rast('LC08_L1TP_177059_20220208_20220212_02_T1_B1.TIF') # Ultra Blue
b2 <- rast('LC08_L1TP_177059_20220208_20220212_02_T1_B2.TIF') # Blue
b3 <- rast('LC08_L1TP_177059_20220208_20220212_02_T1_B3.TIF') # Green
b4 <- rast('LC08_L1TP_177059_20220208_20220212_02_T1_B4.TIF') # Red
b5 <- rast('LC08_L1TP_177059_20220208_20220212_02_T1_B5.TIF') # Near Infrared (NIR)
b6 <- rast('LC08_L1TP_177059_20220208_20220212_02_T1_B6.TIF') # Green
b7 <- rast('LC08_L1TP_177059_20220208_20220212_02_T1_B7.TIF') # Red
b9 <- rast('LC08_L1TP_177059_20220208_20220212_02_T1_B8.TIF') # Near Infrared (NIR)
b8 <- rast('LC08_L1TP_177059_20220208_20220212_02_T1_B9.TIF') # Panchromatic
b10 <- rast('LC08_L1TP_177059_20220208_20220212_02_T1_B10.TIF') # Thermal Infrared (TIRS) 1
b11 <- rast('LC08_L1TP_177059_20220208_20220212_02_T1_B11.TIF') # Thermal Infrared (TIRS) 2.
# Plotting selected individual 6 bands
par(mfrow = c(2,2))
plot(b2, main = "Blue (Band 2)", col = gray(0:100 / 100))
plot(b3, main = "Green (Band 3)", col = gray(0:100 / 100))
plot(b4, main = "Red (Band 4)", col = gray(0:100 / 100))
plot(b5, main = "NIR (Band 5)", col = gray(0:100 / 100))
plot(b6, main = "SWIR (Band 6)", col = gray(0:100 / 100))
# Plotting natural color composite from bands B4, B3 and B2.
landsatRGB <- c(b4, b3, b2)
plotRGB(landsatRGB, stretch = "lin")
# Plotting 11 original individual 11 layers (raw bands) of the multi-spectral image Landsat-8.
colors <- kovesi.cyclic_grey_15_85_c0(100)
#
par(mfrow = c(4, 3), mar=c(0, 5, 0, 0), mai = c(0.1, 0.1, 0.1, 0.1)) # c(bottom, left, top, right)
plot(b1, main = "Ultra Blue / Aerosol (B1)", col = colors, axes = FALSE, legend = TRUE)
plot(b2, main = "Blue (B2)", col = colors, axes = FALSE, legend = TRUE)
plot(b3, main = "Green (B3)", col = colors, axes = FALSE, legend = TRUE)
plot(b4, main = "Red (B4)", col = colors, axes = FALSE, legend = TRUE)
plot(b5, main = "Near Infrared (NIR) (B5)", col = colors, axes = FALSE, legend = TRUE)
plot(b6, main = "SWIR (B6)", col = colors, axes = FALSE, legend = TRUE)
plot(b7, main = "NIR (B7)", col = colors, axes = FALSE, legend = TRUE)
plot(b8, main = "Panchromatic (B8)", col = colors, axes = FALSE, legend = TRUE)
plot(b9, main = "Cirrus (B9)", col = colors, axes = FALSE, legend = TRUE)
plot(b10, main = "TIRS 1 (B10)", col = colors, axes = FALSE, legend = TRUE)
plot(b11, main = "TIRS 2 (B11)", col = colors, axes = FALSE, legend = TRUE)

landsatRGB <- c(b4, b3, b2)
plotRGB(landsatRGB, stretch = "lin")
