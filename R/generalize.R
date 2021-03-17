generalize_boundaries <- function(df, keep){
  gen_temp <- ms_simplify(df, keep = keep, keep_shapes = TRUE)
  gen <- st_snap_to_grid(gen_temp, 1)

  return(gen)
}

combine_cities <- function(df){
  cities <- c("Winterthur", "Zürich")

  col_name <- sym(str_subset(names(df), "GEM_NAM"))

  df_new <- df %>%
    mutate_at(vars(!!col_name), ~case_when(
      str_detect(!!col_name, "Winterthur") ~ "Winterthur",
      str_detect(!!col_name, "Zürich") ~ "Zürich",
      TRUE ~ !!sym(col_name)
    )) %>%
    mutate(SGEM_CODE = case_when(
      str_detect(!!col_name, "Winterthur") ~ "J000",
      str_detect(!!col_name, "Zürich") ~ "A000",
      TRUE ~ !!sym(col_name)
    )) %>%
    group_by(SGEM_CODE, !!col_name, STICHTAG) %>%
    summarize()

  return(df_new)
}

insert_seen <- function(df, seen){
  cols_to_add <- str_subset(names(df), "geometry", negate = TRUE)

  seen_prep <- seen %>%
    `is.na<-` (cols_to_add) %>%
    select(SGEM_CODE, PS_GEM_NAM = See_N, STICHTAG)

  df_out <- st_difference(df, st_union(seen_prep)) %>%
    rbind(seen_prep) %>%
    mutate(ART_N = ifelse(is.na(SGEM_CODE), "See", "Schulgemeinde"))
}
