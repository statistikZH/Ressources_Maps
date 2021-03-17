export_as_geojson <- function(df, name, year, crs, overwrite = FALSE){
  if(crs == "LV95"){
    crs_code <- 2056
  }else if(crs == "WGS84"){
    crs_code <- 4326
  }

  file_name <- paste0(name, "_epsg", crs_code, "_F_KTZH_", year, ".json")

  dir.create(paste0("data/", year), showWarnings = FALSE)

  file_path <- paste0("data/", year,"/",file_name)

  if(file.exists(file_path) & overwrite == F){
    stop("file already exists. set overwrite to true, to replace the file")
  }else if(file.exists(file_path) & overwrite){
    file.remove(file_path)
  }

  df_transformed <- df %>%
    st_transform(crs_code)

  sf::st_write(df_transformed, file_path, driver="GeoJSON")
}
