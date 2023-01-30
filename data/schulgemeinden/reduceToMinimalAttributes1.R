library(rgdal)

for (i in 2008:2023) {

    print(i)

    geofile=readOGR(paste0("G:/BISTA/_Wissensbasis/_Kartenmaterial/ZH/statistikZH/Ressources_Maps/data/schulgemeinden/oberstufenschulgemeinden/",i,".geojson"), encoding = "utf8")

    print(names(geofile))

    geofile$id=if("SGEM_CODE" %in% names(geofile)){geofile$SGEM_CODE} else {"Fehler"}
    geofile$name=if("SGEM_NAME" %in% names(geofile)){geofile$SGEM_NAME} else {if("OS_GEM_NAM" %in% names(geofile)){geofile$OS_GEM_NAM} else {"Fehler"}}
    geofile$art=if("Geor" %in% names(geofile)){geofile$Geor} else {if("TrÃ.gerart" %in% names(geofile)){geofile$TrÃ.gerart} else {if("Trdgerart" %in% names(geofile)){geofile$Trdgerart} else {NA}}}
    #geofile$parent=if("diss" %in% names(geofile)){geofile$diss} else {if("dissolve" %in% names(geofile)){geofile$dissolve} else {NA}}

    geofile=geofile[,which(names(geofile) %in% c("id", "name", "art"))]

    print(names(geofile))

    writeOGR(geofile, paste0("G:/BISTA/_Wissensbasis/_Kartenmaterial/ZH/statistikZH/Ressources_Maps/data/schulgemeinden/oberstufenschulgemeinden/new/",i,".geojson"), layer=paste0("oberstufenschulgemeinden_zh_",i), driver="GeoJSON", overwrite_layer = T, )

}

for (i in 2008:2023) {

    print(i)

    geofile=readOGR(paste0("G:/BISTA/_Wissensbasis/_Kartenmaterial/ZH/statistikZH/Ressources_Maps/data/schulgemeinden/oberstufenschulgemeinden/",i,"_gen.geojson"), encoding = "utf8")

    print(names(geofile))

    geofile$id=if("SGEM_CODE" %in% names(geofile)){geofile$SGEM_CODE} else {"Fehler"}
    geofile$name=if("SGEM_NAME" %in% names(geofile)){geofile$SGEM_NAME} else {if("OS_GEM_NAM" %in% names(geofile)){geofile$OS_GEM_NAM} else {"Fehler"}}
    geofile$art=if("Geor" %in% names(geofile)){geofile$Geor} else {if("TrÃ.gerart" %in% names(geofile)){geofile$TrÃ.gerart} else {if("Trdgerart" %in% names(geofile)){geofile$Trdgerart} else {NA}}}
    #geofile$parent=if("diss" %in% names(geofile)){geofile$diss} else {if("dissolve" %in% names(geofile)){geofile$dissolve} else {NA}}

    geofile=geofile[,which(names(geofile) %in% c("id", "name", "art"))]

    print(names(geofile))

    writeOGR(geofile, paste0("G:/BISTA/_Wissensbasis/_Kartenmaterial/ZH/statistikZH/Ressources_Maps/data/schulgemeinden/oberstufenschulgemeinden/new/",i,"_gen.geojson"), layer=paste0("oberstufenschulgemeinden_zh_",i), driver="GeoJSON", overwrite_layer = T, )

}

for (i in 2008:2023) {

    print(i)

    geofile=readOGR(paste0("G:/BISTA/_Wissensbasis/_Kartenmaterial/ZH/statistikZH/Ressources_Maps/data/schulgemeinden/oberstufenschulgemeinden/",i,"_gen_wsg84.geojson"), encoding = "utf8")

    print(names(geofile))

    geofile$id=if("SGEM_CODE" %in% names(geofile)){geofile$SGEM_CODE} else {"Fehler"}
    geofile$name=if("SGEM_NAME" %in% names(geofile)){geofile$SGEM_NAME} else {if("OS_GEM_NAM" %in% names(geofile)){geofile$OS_GEM_NAM} else {"Fehler"}}
    geofile$art=if("Geor" %in% names(geofile)){geofile$Geor} else {if("TrÃ.gerart" %in% names(geofile)){geofile$TrÃ.gerart} else {if("Trdgerart" %in% names(geofile)){geofile$Trdgerart} else {NA}}}
    #geofile$parent=if("diss" %in% names(geofile)){geofile$diss} else {if("dissolve" %in% names(geofile)){geofile$dissolve} else {NA}}

    geofile=geofile[,which(names(geofile) %in% c("id", "name", "art"))]

    print(names(geofile))

    writeOGR(geofile, paste0("G:/BISTA/_Wissensbasis/_Kartenmaterial/ZH/statistikZH/Ressources_Maps/data/schulgemeinden/oberstufenschulgemeinden/new/",i,"_gen_wsg84.geojson"), layer=paste0("oberstufenschulgemeinden_zh_",i), driver="GeoJSON", overwrite_layer = T, )

}


for (i in 2008:2023) {

    print(i)

    geofile=readOGR(paste0("G:/BISTA/_Wissensbasis/_Kartenmaterial/ZH/statistikZH/Ressources_Maps/data/schulgemeinden/primarschulgemeinden/",i,"_gen.geojson"), encoding = "utf8")

    print(names(geofile))

    geofile$id=if(i>=2016){geofile$SGEM_CODE_} else {if("SGEM_CODE" %in% names(geofile)){geofile$SGEM_CODE} else {if("SGEM_CODE_" %in% names(geofile)){geofile$SGEM_CODE_} else {"Fehler"}}}
    geofile$name=if(i>=2016){geofile$SGEM_NAME_} else {if("SGEM_NAME" %in% names(geofile)){geofile$SGEM_NAME} else {if("PS_GEM_NAM" %in% names(geofile)){geofile$PS_GEM_NAM} else {"Fehler"}}}
    geofile$art=if("Geor" %in% names(geofile)){geofile$Geor}
    else {if("TrÃ.gerart" %in% names(geofile)){geofile$TrÃ.gerart}
        else {if("Trdgerart" %in% names(geofile)){geofile$Trdgerart}
            else {if("TrC_gerart" %in% names(geofile)){geofile$Trdgerart} else {if("TrC_B_gera" %in% names(geofile)){geofile$Trdgerart} else {NA}}}}}
    #geofile$parent=if("diss" %in% names(geofile)){geofile$diss} else {if("dissolve" %in% names(geofile)){geofile$dissolve} else {NA}}

    geofile=geofile[,which(names(geofile) %in% c("id", "name", "art"))]

    print(names(geofile))

    writeOGR(geofile, paste0("G:/BISTA/_Wissensbasis/_Kartenmaterial/ZH/statistikZH/Ressources_Maps/data/schulgemeinden/primarschulgemeinden/new/",i,"_gen.geojson"), layer=paste0("oberstufenschulgemeinden_zh_",i), driver="GeoJSON", overwrite_layer = T, )

}

for (i in 2008:2023) {

    print(i)

    geofile=readOGR(paste0("G:/BISTA/_Wissensbasis/_Kartenmaterial/ZH/statistikZH/Ressources_Maps/data/schulgemeinden/primarschulgemeinden/",i,"_gen.geojson"), encoding = "utf8")

    print(names(geofile))

    geofile$id=if(i>=2016){geofile$SGEM_CODE_} else {if("SGEM_CODE" %in% names(geofile)){geofile$SGEM_CODE} else {if("SGEM_CODE_" %in% names(geofile)){geofile$SGEM_CODE_} else {"Fehler"}}}
    geofile$name=if(i>=2016){geofile$SGEM_NAME_} else {if("SGEM_NAME" %in% names(geofile)){geofile$SGEM_NAME} else {if("PS_GEM_NAM" %in% names(geofile)){geofile$PS_GEM_NAM} else {"Fehler"}}}
    geofile$art=if("Geor" %in% names(geofile)){geofile$Geor}
    else {if("TrÃ.gerart" %in% names(geofile)){geofile$TrÃ.gerart}
        else {if("Trdgerart" %in% names(geofile)){geofile$Trdgerart}
            else {if("TrC_gerart" %in% names(geofile)){geofile$Trdgerart} else {if("TrC_B_gera" %in% names(geofile)){geofile$Trdgerart} else {NA}}}}}
    #geofile$parent=if("diss" %in% names(geofile)){geofile$diss} else {if("dissolve" %in% names(geofile)){geofile$dissolve} else {NA}}

    geofile=geofile[,which(names(geofile) %in% c("id", "name", "art"))]

    print(names(geofile))

    writeOGR(geofile, paste0("G:/BISTA/_Wissensbasis/_Kartenmaterial/ZH/statistikZH/Ressources_Maps/data/schulgemeinden/primarschulgemeinden/new/",i,"_gen.geojson"), layer=paste0("oberstufenschulgemeinden_zh_",i), driver="GeoJSON", overwrite_layer = T, )

}

for (i in 2008:2023) {

    print(i)

    geofile=readOGR(paste0("G:/BISTA/_Wissensbasis/_Kartenmaterial/ZH/statistikZH/Ressources_Maps/data/schulgemeinden/primarschulgemeinden/",i,"_gen.geojson"), encoding = "utf8")

    print(names(geofile))

    geofile$id=if(i>=2016){geofile$SGEM_CODE_} else {if("SGEM_CODE" %in% names(geofile)){geofile$SGEM_CODE} else {if("SGEM_CODE_" %in% names(geofile)){geofile$SGEM_CODE_} else {"Fehler"}}}
    geofile$name=if(i>=2016){geofile$SGEM_NAME_} else {if("SGEM_NAME" %in% names(geofile)){geofile$SGEM_NAME} else {if("PS_GEM_NAM" %in% names(geofile)){geofile$PS_GEM_NAM} else {"Fehler"}}}
    geofile$art=if("Geor" %in% names(geofile)){geofile$Geor}
    else {if("TrÃ.gerart" %in% names(geofile)){geofile$TrÃ.gerart}
        else {if("Trdgerart" %in% names(geofile)){geofile$Trdgerart}
            else {if("TrC_gerart" %in% names(geofile)){geofile$Trdgerart} else {if("TrC_B_gera" %in% names(geofile)){geofile$Trdgerart} else {NA}}}}}
    #geofile$parent=if("diss" %in% names(geofile)){geofile$diss} else {if("dissolve" %in% names(geofile)){geofile$dissolve} else {NA}}

    geofile=geofile[,which(names(geofile) %in% c("id", "name", "art"))]

    print(names(geofile))

    writeOGR(geofile, paste0("G:/BISTA/_Wissensbasis/_Kartenmaterial/ZH/statistikZH/Ressources_Maps/data/schulgemeinden/primarschulgemeinden/new/",i,"_gen.geojson"), layer=paste0("oberstufenschulgemeinden_zh_",i), driver="GeoJSON", overwrite_layer = T, )

}

