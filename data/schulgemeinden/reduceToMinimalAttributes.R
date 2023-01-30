library(rgdal)
library(dplyr)

for(i in 2009:2013) {

    geofile=readOGR(paste0("G:/BISTA/_Wissensbasis/_Kartenmaterial/ZH/statistikZH/Ressources_Maps/data/schulgemeinden/oberstufenschulgemeinden/",i,"_new.geojson"))

    writeOGR(geofile, paste0("G:/BISTA/_Wissensbasis/_Kartenmaterial/ZH/statistikZH/Ressources_Maps/data/schulgemeinden/oberstufenschulgemeinden/",i,".geojson"), layer = paste0("oberstufenschulgemeinden_zh_",i), overwrite_layer = T, driver="GeoJSON")

}


for(i in 2009:2013) {

    geofile=readOGR(paste0("G:/BISTA/_Wissensbasis/_Kartenmaterial/ZH/statistikZH/Ressources_Maps/data/schulgemeinden/oberstufenschulgemeinden/",i,"_gen.geojson"))

    writeOGR(geofile, paste0("G:/BISTA/_Wissensbasis/_Kartenmaterial/ZH/statistikZH/Ressources_Maps/data/schulgemeinden/oberstufenschulgemeinden/",i,"_gen.geojson"), layer = paste0("oberstufenschulgemeinden_zh_",i), overwrite_layer = T, driver="GeoJSON")

}


for(i in 2009:2013) {

    geofile=readOGR(paste0("G:/BISTA/_Wissensbasis/_Kartenmaterial/ZH/statistikZH/Ressources_Maps/data/schulgemeinden/oberstufenschulgemeinden/",i,"_gen_wsg84.geojson"))

    writeOGR(geofile, paste0("G:/BISTA/_Wissensbasis/_Kartenmaterial/ZH/statistikZH/Ressources_Maps/data/schulgemeinden/oberstufenschulgemeinden/",i,"_gen_wsg84.geojson"), layer = paste0("oberstufenschulgemeinden_zh_",i), overwrite_layer = T, driver="GeoJSON")

}


for(i in 2009:2023) {

    geofile=readOGR(paste0("G:/BISTA/_Wissensbasis/_Kartenmaterial/ZH/statistikZH/Ressources_Maps/data/schulgemeinden/primarschulgemeinden/",i,".geojson"))

    print(names(geofile))

    geofile$id=if(i %in% c(2015:2023)) {geofile$SGEM_CODE_} else {if("SGEM_CODE" %in% names(geofile)) {geofile$SGEM_CODE} else {if("SGEM_CODE_" %in% names(geofile)) {geofile$SGEM_CODE_} else {"Fehler"}}}
    geofile$name=if(i %in% c(2015:2023)) {geofile$SGEM_NAME_} else {if("PS_GEM_NAM" %in% names(geofile)) {geofile$PS_GEM_NAM} else {"Fehler"}}
    geofile$art=if("Trägerart" %in% names(geofile)) {geofile$Trägerart} else {if("TrC_B_gera" %in% names(geofile)) {geofile$TrC_B_gera} else {if("Trdgerart" %in% names(geofile)) {geofile$Trdgerart} else {if("TrC_gerart" %in% names(geofile)) {geofile$TrC_gerart} else {NA}}}}

    geofile=geofile[,which(names(geofile) %in% c("id", "name", "art"))]

    print(names(geofile))

    geofile$name=recode(geofile$id,
                        "A012"="ZÃ¼rich-Uto",
                        "A062"="ZÃ¼rich-Letzi",
                        "A042"="ZÃ¼rich-ZÃ¼richberg",
                        "A022"="ZÃ¼rich-Limmattal",
                        .default = geofile$name)

    writeOGR(geofile, paste0("G:/BISTA/_Wissensbasis/_Kartenmaterial/ZH/statistikZH/Ressources_Maps/data/schulgemeinden/primarschulgemeinden/new/",i,".geojson"), layer = paste0("primarschulgemeinden_zh_",i), overwrite_layer = T, driver="GeoJSON")

}


for(i in 2009:2023) {

    geofile=readOGR(paste0("G:/BISTA/_Wissensbasis/_Kartenmaterial/ZH/statistikZH/Ressources_Maps/data/schulgemeinden/primarschulgemeinden/",i,"_gen.geojson"))

    print(names(geofile))

    geofile$id=if(i %in% c(2015:2023)) {geofile$SGEM_CODE_} else {if("SGEM_CODE" %in% names(geofile)) {geofile$SGEM_CODE} else {if("SGEM_CODE_" %in% names(geofile)) {geofile$SGEM_CODE_} else {"Fehler"}}}
    geofile$name=if(i %in% c(2015:2023)) {geofile$SGEM_NAME_} else {if("PS_GEM_NAM" %in% names(geofile)) {geofile$PS_GEM_NAM} else {"Fehler"}}
    geofile$art=if("Trägerart" %in% names(geofile)) {geofile$Trägerart} else {if("TrC_B_gera" %in% names(geofile)) {geofile$TrC_B_gera} else {if("Trdgerart" %in% names(geofile)) {geofile$Trdgerart} else {if("TrC_gerart" %in% names(geofile)) {geofile$TrC_gerart} else {NA}}}}

    geofile=geofile[,which(names(geofile) %in% c("id", "name", "art"))]

    print(names(geofile))

    geofile$name=recode(geofile$id,
                        "A012"="ZÃ¼rich-Uto",
                        "A062"="ZÃ¼rich-Letzi",
                        "A042"="ZÃ¼rich-ZÃ¼richberg",
                        "A022"="ZÃ¼rich-Limmattal",
                        .default = geofile$name)

    writeOGR(geofile, paste0("G:/BISTA/_Wissensbasis/_Kartenmaterial/ZH/statistikZH/Ressources_Maps/data/schulgemeinden/primarschulgemeinden/new/",i,"_gen.geojson"), layer = paste0("primarschulgemeinden_zh_",i), overwrite_layer = T, driver="GeoJSON")

}


for(i in 2009:2023) {

    geofile=readOGR(paste0("G:/BISTA/_Wissensbasis/_Kartenmaterial/ZH/statistikZH/Ressources_Maps/data/schulgemeinden/primarschulgemeinden/",i,"_gen_wsg84.geojson"))

    print(names(geofile))

    geofile$id=if(i %in% c(2015:2023)) {geofile$SGEM_CODE_} else {if("SGEM_CODE" %in% names(geofile)) {geofile$SGEM_CODE} else {if("SGEM_CODE_" %in% names(geofile)) {geofile$SGEM_CODE_} else {"Fehler"}}}
    geofile$name=if(i %in% c(2015:2023)) {geofile$SGEM_NAME_} else {if("PS_GEM_NAM" %in% names(geofile)) {geofile$PS_GEM_NAM} else {"Fehler"}}
    geofile$art=if("Trägerart" %in% names(geofile)) {geofile$Trägerart} else {if("TrC_B_gera" %in% names(geofile)) {geofile$TrC_B_gera} else {if("Trdgerart" %in% names(geofile)) {geofile$Trdgerart} else {if("TrC_gerart" %in% names(geofile)) {geofile$TrC_gerart} else {NA}}}}

    geofile=geofile[,which(names(geofile) %in% c("id", "name", "art"))]

    print(names(geofile))

    geofile$name=recode(geofile$id,
                        "A012"="ZÃ¼rich-Uto",
                        "A062"="ZÃ¼rich-Letzi",
                        "A042"="ZÃ¼rich-ZÃ¼richberg",
                        "A022"="ZÃ¼rich-Limmattal",
                        .default = geofile$name)

    writeOGR(geofile, paste0("G:/BISTA/_Wissensbasis/_Kartenmaterial/ZH/statistikZH/Ressources_Maps/data/schulgemeinden/primarschulgemeinden/new/",i,"_gen_wsg84.geojson"), layer = paste0("primarschulgemeinden_zh_",i), overwrite_layer = T, driver="GeoJSON")

}
