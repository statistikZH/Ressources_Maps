library(lwgeom)
library(rmapshaper)
library(sf)

kanton <- st_read("L:/STAT/08_DS/03_GIS/Geodaten/2020/BezirkeAlleSee_F_KTZH_2020.shp", stringsAsFactors = FALSE, crs=4326)
## Reading layer `KantonOhneGrosseSee_F_KTZH_2019' from data source `L:\STAT\08_DS\03_GIS\Geodaten\2019\KantonOhneGrosseSee_F_KTZH_2019.shp' using driver `ESRI Shapefile'
## Simple feature collection with 1 feature and 2 fields
## geometry type:  POLYGON
## dimension:      XY
## bbox:           xmin: 2669245 ymin: 1223896 xmax: 2716900 ymax: 1283343
## epsg (SRID):    2056
## proj4string:    +proj=somerc +lat_0=46.95240555555556 +lon_0=7.439583333333333 +k_0=1 +x_0=2600000 +y_0=1200000 +ellps=bessel +towgs84=674.374,15.056,405.346,0,0,0,0 +units=m +no_defs

dir.create("P:/GIS_Cheatsheet")

# generalize data as else geojson is too big

kanton_gen_temp <-  rmapshaper::ms_simplify(kanton, keep = 0.015, keep_shapes = TRUE)
kanton_gen <- lwgeom::st_snap_to_grid(kanton_gen_temp,1)

# in order to overwrite the geojson, the geojson has to be deleted
# delete_layer = TRUE does not work

path_4326 = "C:/gitrepos/Ressources_Maps/2020/BezirkeAlleSee_gen_epsg4326_F_KTZH_2020.json"
file.remove(path_4326)
## [1] TRUE
st_write(kanton_gen, path_4326, driver="GeoJSON")
## Writing layer `Kanton_epsg2056_F_KTZH_2019' to data source `P:/GIS_Cheatsheet/Kanton_epsg2056_F_KTZH_2019.json' using driver `GeoJSON'
## Writing 1 features with 2 fields and geometry type Polygon.

##path_4326 = "P:/GIS_Cheatsheet/Kanton_gen_epsg4326_F_KTZH_2019.json"
##file.remove(path_4326)
## [1] TRUE
st_write(kanton_gen %>% st_transform(4326), path_4326, driver="GeoJSON")
## Writing layer `Kanton_gen_epsg4326_F_KTZH_2019' to data source `P:/GIS_Cheatsheet/Kanton_gen_epsg4326_F_KTZH_2019.json' using driver `GeoJSON'
## Writing 1 features with 2 fields and geometry type Polygon.