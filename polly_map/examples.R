# mapping raster using ggplot 2
# This scipt follows the tutorials from https://datacarpentry.org/r-raster-vector-geospatial/01-raster-structure/index.html
library(raster)
library(rgdal)
library(ggplot2)
library(dplyr)

DSM_HARV <- raster("polly_map/NEON-DS-Airborne-Remote-Sensing/HARV/DSM/HARV_dsmCrop.tif")
DSM_HARV_df <- as.data.frame(DSM_HARV, xy = TRUE)

ggplot() +
  geom_raster(data = DSM_HARV_df , aes(x = x, y = y, fill = HARV_dsmCrop)) +
  scale_fill_viridis_c() +  #choose color scheme, the c is for continuous, there is also d(discrete) and b(binned)
  coord_quickmap() # uses Mercator coordinate system, for more projections, see ?coord_map
