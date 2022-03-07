
<!-- README.md is generated from README.Rmd. Please edit that file -->

# DataRobotColors

<!-- badges: start -->
<!-- badges: end -->

The goal of DataRobotColors is to allow users to bring the DataRobot
color schemes in to R plots and specifically {ggplo2}. The main
functions of this package are `scale_color_DataRobot()` and
`scale_fill_DataRobot()`. Additionally, the `DataRobot_pal()` function
returns a `pal` function that can be used in other R plotting functions.
Helper functions include `DataRobot_palette_names()` to name the
palettes available, and `DataRobot_get_palettes()` to return the hex
values of the underlying palette.

## Installation

You can install the development version of DataRobotColors from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("mrecos/DataRobotColors")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(DataRobotColors)
library(ggplot2)
theme_set(theme_minimal())
```

What is special about using `README.Rmd` instead of just `README.md`?
You can include R chunks like so:

``` r
ggplot(iris, aes(Sepal.Width, Sepal.Length, color = Species)) +
  geom_point(size = 4) +
  scale_color_DataRobot()
```

<img src="man/figures/README-plot-1.png" width="100%" />

You’ll still need to render `README.Rmd` regularly, to keep `README.md`
up-to-date. `devtools::build_readme()` is handy for this. You could also
use GitHub Actions to re-render `README.Rmd` every time you push. An
example workflow can be found here:
<https://github.com/r-lib/actions/tree/v1/examples>.

You can also embed plots, for example:

<img src="man/figures/README-pressure-1.png" width="100%" />

In that case, don’t forget to commit and push the resulting figure
files, so they display on GitHub and CRAN.
