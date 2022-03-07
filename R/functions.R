# .onLoad = function (libname, pkgname) {
#   #assign('myvar', value, envir = topenv())
#   source("./R/palettes.R")
# }

#' Function to extract DataRobot colors as hex codes
#'
#' @param ... Character names of DataRobot colors
#'
DataRobot_cols <- function(...) {
  DataRobot_colors <- c(
    `Bright blue`         = "#2d8fe2",
    `Soft blue1`          = "#559ee6",
    `Soft blue2`          = "#73adea",
    `Very soft blue1`     = "#8ebcee",
    `Very soft blue2`     = "#a8ccf2",
    `Very soft blue3`     = "#c1dbf6",
    `Light grayish blue1` = "#daeafa",
    `Light grayish blue2` = "#f4f9fe",
    `Pure orange`         = "#ff5600",
    `Vivid orange`        = "#ff712f",
    `Light orange1`       = "#ff8950",
    `Very light orange1`  = "#ffa06f",
    `Very light orange2`  = "#ffb68f",
    `Pale orange`         = "#ffcbaf",
    `Very pale orange1`   = "#ffe1d0",
    `Very pale orange2`   = "#fff6f2",
    `Mostly dark blue1`   = "#53718f",
    `Mostly dark blue2`   = "#68849d",
    `Mostly dark blue3`   = "#7d96ac",
    `Grayish blue1`       = "#94aaba",
    `Grayish blue2`       = "#abbdc9",
    `Light grayish blue3` = "#c3d0d9",
    `Light grayish blue4` = "#dce4e9",
    `Light grayish blue5` = "#f6f8f9",
    `Soft blue3`          = "#69a1e5",
    `Very soft blue4`     = "#90b4e9",
    `Very soft blue5`     = "#b2c8ec",
    `Light grayish blue3` = "#d2dcee",
    `Very light gray`     = "#f1f1f1",
    `Very soft orange`    = "#fed4c3",
    `Very light orange3`  = "#ffb796",
    `Very light orange4`  = "#ff996a",
    `Light orange2`       = "#ff793e",
    `Pure orange`         = "#ff5600",
    `Bright yellow`       = "#f1c232",
    `Moderate lime green` = "#39b54a",
    `Strong red`          = "#b70000",
    `Pure magenta`        = "#da00a8",
    `Dark violet`         = "#662d91",
    `Grayish blue3`       = "#bac5ce"
  )

  cols <- c(...)

  if (is.null(cols))
    return (DataRobot_colors)

  DataRobot_colors[cols]
}

#' Return function to interpolate a DataRobot color palette
#'
#' @param palette Character name of palette in DataRobot_palettes
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments to pass to colorRampPalette()
#'
DataRobot_pal <- function(palette = "DR_Blues", reverse = FALSE, ...) {
  pal <- DataRobot_get_palettes()[[palette]]

  if (reverse) pal <- rev(pal)

  colorRampPalette(pal, ...)
}

#' Return the names of DataRobot color palettes
#'
DataRobot_palette_names <- function(){
  return(names(DataRobot_get_palettes()))
}

#' Return function to return a list of DataRobot color palettes
#'
DataRobot_get_palettes <- function(palette = palette){

  DataRobot_palettes <- list(
    `DR_Blues` = DataRobot_cols(
      "Bright blue"         ,
      "Soft blue1"          ,
      "Soft blue2"          ,
      "Very soft blue1"     ,
      "Very soft blue2"     ,
      "Very soft blue3"     ,
      "Light grayish blue1" ,
      "Light grayish blue2"
    ),

    `DR_Reds` = DataRobot_cols(
      "Pure orange"        ,
      "Vivid orange"       ,
      "Light orange1"      ,
      "Very light orange1" ,
      "Very light orange2" ,
      "Pale orange"        ,
      "Very pale orange1"  ,
      "Very pale orange2"
    ),

    `DR_Grays` = DataRobot_cols(
      "Mostly dark blue1"   ,
      "Mostly dark blue2"   ,
      "Mostly dark blue3"   ,
      "Grayish blue1"       ,
      "Grayish blue2"       ,
      "Light grayish blue3" ,
      "Light grayish blue4" ,
      "Light grayish blue5"
    ),

    `DR_Diverging` = DataRobot_cols(
      "Bright blue"         ,
      "Soft blue3"          ,
      "Very soft blue4"     ,
      "Very soft blue5"     ,
      "Light grayish blue3" ,
      "Very light gray"     ,
      "Very soft orange"    ,
      "Very light orange3"  ,
      "Very light orange4"  ,
      "Light orange2"       ,
      "Pure orange"
    ),

    `DR_Qualitative` = DataRobot_cols(
      "Pure orange"         ,
      "Bright blue"         ,
      "Bright yellow"       ,
      "Moderate lime green" ,
      "Strong red"          ,
      "Pure magenta"        ,
      "Dark violet"         ,
      "Grayish blue3"
    )
  )
  return(DataRobot_palettes)
}


#' Color scale constructor for DataRobot colors
#'
#' @param palette Character name of palette in DataRobot_palettes
#' @param discrete Boolean indicating whether color aesthetic is discrete or not
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments passed to discrete_scale() or
#'            scale_color_gradientn(), used respectively when discrete is TRUE or FALSE
#'
scale_color_DataRobot <- function(palette = "DR_Blues", discrete = TRUE, reverse = FALSE, ...) {
  pal <- DataRobot_pal(palette = palette, reverse = reverse)

  if (discrete) {
    discrete_scale("colour", paste0("DataRobot_", palette), palette = pal, ...)
  } else {
    scale_color_gradientn(colours = pal(256), ...)
  }
}

#' Fill scale constructor for DataRobot colors
#'
#' @param palette Character name of palette in DataRobot_palettes
#' @param discrete Boolean indicating whether color aesthetic is discrete or not
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments passed to discrete_scale() or
#'            scale_fill_gradientn(), used respectively when discrete is TRUE or FALSE
#'
scale_fill_DataRobot <- function(palette = "DR_Blues", discrete = TRUE, reverse = FALSE, ...) {
  pal <- DataRobot_pal(palette = palette, reverse = reverse)

  if (discrete) {
    discrete_scale("fill", paste0("DataRobot_", palette), palette = pal, ...)
  } else {
    scale_fill_gradientn(colours = pal(256), ...)
  }
}
