devtools::load_all(".")

ps <- get_schulgemeinden("PS", 2020)
os <- get_schulgemeinden("OS", 2020)
gem <- get_gem(2020)
seen <- get_see(2020)

seen_gen <- generalize_boundaries(seen, keep = 0.25)
seen_gen<- st_buffer(seen_gen, dist = 150)

ps_new <- combine_cities(ps)
os_new <- combine_cities(os)

ps_new_gen <- generalize_boundaries(ps_new, keep = 0.01) %>%
  insert_seen(seen_gen)
os_new_gen <- generalize_boundaries(os_new, keep = 0.01) %>%
  insert_seen(seen_gen)
gem_gen <- generalize_boundaries(gem, keep = 0.3)

export_as_geojson(ps_new_gen, "PS_SCHULGEMEINDEN_SHAPE_gen", 2020, "LV95", overwrite = TRUE)
export_as_geojson(os_new_gen, "OS_SCHULGEMEINDEN_SHAPE_gen", 2020, "LV95")
export_as_geojson(ps_new_gen, "PS_SCHULGEMEINDEN_SHAPE_gen", 2020, "WGS84")
export_as_geojson(os_new_gen, "OS_SCHULGEMEINDEN_SHAPE_gen", 2020, "WGS84")
export_as_geojson(gem_gen, "GemeindeGrosseSeeOhneExklave_gen", 2020, "LV95")
export_as_geojson(gem_gen, "GemeindeGrosseSeeOhneExklave_gen", 2020, "WGS84")


