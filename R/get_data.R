get_schulgemeinden <- function(typ, year, server = TRUE){
  location <- get_location(server)

  st_read(
    paste0(location, "/08_DS/03_GIS/Geodaten/",year,"/",typ,"_SCHULGEMEINDEN_SHAPE_F_KTZH_",year,".shp"),
    stringsAsFactors = FALSE,
    crs=2056
    )
}

get_see <- function(jahr, server = TRUE){
  location <- get_location(server)

  st_read(
    paste0(location, "/08_DS/03_GIS/Geodaten/",jahr,"/GrosseSee_gen_F_KTZH_",jahr,".shp"),
    stringsAsFactors = FALSE,
    crs=2056
    )
}

get_gem <- function(year, server = TRUE){
  location <- get_location(server)

  st_read(
    paste0(location, "/08_DS/03_GIS/Geodaten/",year,"/GemeindeGrosseSeeOhneExklave_gen_F_KTZH_",year,".shp"),
    stringsAsFactors = FALSE,
    crs=2056
  )
}

get_location <- function(server){
  if(server == TRUE){
    location <- "/home/file-server"
  }else{
    location <- "L:/STAT"
  }
  return(location)
}
