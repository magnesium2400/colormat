# colormat
Custom colormap functionality in MATLAB


## Data Sources
- Seaborn [tutorial](https://seaborn.pydata.org/tutorial/color_palettes.html) and [data](https://github.com/mwaskom/seaborn/blob/7001ebe72423238e99c0434a2ef0a0ebc9cb55c1/seaborn/cm.py)
- crameri [site](https://www.fabiocrameri.ch/colourmaps/) and [repo with data](https://github.com/chadagreene/crameri) 
- matplotlib by Stephen23 [on MATLAB FileExchange](https://au.mathworks.com/matlabcentral/fileexchange/62729-matplotlib-perceptually-uniform-colormaps) - used under BSD License and CC0
- ColorBrewer [site](https://colorbrewer2.org/) and [data](https://github.com/scottclowe/cbrewer2/tree/master/cbrewer2) - used under Apache License 2.0
- `bwr`, `coolwarm`, `seismic` generated manually using data from the [matplotlib repo](https://github.com/matplotlib/matplotlib/blob/main/lib/matplotlib/_cm.py)


## Usage
- There are several kinds of colormaps included:
  - Sequential
  - Diverging
  - Qualitative
  - Cyclic
  - Multisequential (only in crameri) - not yet implemented
- The maps have been implemented as functions that return an Nx3 array of RGB values in the range 0-1.
- The maps can be used directly in MATLAB with the `colormap` function. For example: `colormap('viridis');` or `colormap(viridis);`
- All the maps can be called with an optional first argument to specify the number of colors. For example: `colormap(viridis(100));`.
  - The sequential/cyclic/diverging maps can be requested with any number of colors, and will be linearly interpolated as necessary.
  - The qualitative maps have a maximum number of colors that can be requested. If a larger number is requested, the colours will cycle.

### Cyclic Maps  
- The cyclic maps can be called with a second optional argument (in the interval `[0,1)`) to specify what position to start the cycle at. For example: `colormap(twilight(100, 0.5));` will start the cycle halfway through the map.
  - Try `figure; for ii=0:14; imagesc(nexttile, (1:255)/255); colormap(gca(), twilight(100, ii/14)); colorbar('Location', 'southoutside'); end` to see the effect.

### Diverging Maps
- By default, the whole range of colours in the map is returned. The diverging maps are centred on the middle colour (e.g. white in `bwr`/`seismic`, yellow in `spectral`). This is appropriate for data that are symmetrically distributed around a central value. 
  - `figure; colormap(bwr); colorbar` or `figure; colormap('bwr'); colorbar`
- The number of colours `n` in the map can be specified as an optional first argument, as described above.
  - `figure; colormap(bwr(15)); colorbar`
- The distribution of colours can be changed using the `mapname(___,'clims', [cmin cmax])` syntax. The centre point remains at 0, unless this is changed. 
  - `figure; for ii = 0:3; clim(nexttile,[-2.5 -0.5]+ii); colormap(gca(), bwr(256,'clim',gca().CLim)); colorbar; end`
- By default, the centre point is treated as 0, and the limits of the map are at -1 and 1. These can be changed independently. If the data are all positive/negative, only the upper/lower half of the colour range will be used.
- The location of the centre point can be changed using the `mapname(___,'center', center)` syntax. The middle colour will be at the value `center`.
  - `figure; for ii = 0:4; clim(nexttile,[-1 1]); colormap(gca(), bwr(256,'center',-1+ii/2)); colorbar; end`
- The way the colours are trimmed at the limits can be changed using the `mapname(___,'mode', 'complete')` or `mapname(___,'mode', 'trimmed')` syntax. For example, if the data range is `[-1, 2]`, the default 'trimmed' mode will return the utilise only half the colours in the lower half of the colour range. The 'complete' mode will use all the colours in the in the lower half of the colour range, but will be compressed. 
  - `figure; for ii = 0:4; for jj = ["trimmed","complete"]; clim(nexttile,[-1 1]); colormap(gca(), bwr(256,'center',-1+ii/2,'mode',jj)); colorbar; end; end`
- The parameters `n` and `clim` can be automatically detected using the `mapname(___,'Parent', h)` syntax, where `h` is an axes or figure handle. If the handle `h` contains the property `CLim`, this will be used to determine the colour limits. If the handle `h` contains a colormap, this will be used to determine the height of the output. Note that specifying `n` or `clim` directly will override the automatic detection.
- Also note that the `mapname(___,'Parent', h)` syntax does NOT apply the colormap to the axes/figure `h`. It only uses the properties of `h` to determine the output. The colormap must still be applied using the `colormap` function.

## Maps
| Name | Source | Type | Map |
| :--: | :----: | :--: | :-: |
| accent | colorbrewer | qualitative | ![accent](./docs/images/accent.png) |
| acton | crameri | sequential | ![acton](./docs/images/acton.png) |
| bam | crameri | diverging | ![bam](./docs/images/bam.png) |
| bamako | crameri | sequential | ![bamako](./docs/images/bamako.png) |
| bamo | crameri | cyclic | ![bamo](./docs/images/bamo.png) |
| batlow | crameri | sequential | ![batlow](./docs/images/batlow.png) |
| batlowk | crameri | sequential | ![batlowk](./docs/images/batlowk.png) |
| batloww | crameri | sequential | ![batloww](./docs/images/batloww.png) |
| berlin | crameri | diverging | ![berlin](./docs/images/berlin.png) |
| bilbao | crameri | sequential | ![bilbao](./docs/images/bilbao.png) |
| blues | colorbrewer | sequential | ![blues](./docs/images/blues.png) |
| brbg | colorbrewer | diverging | ![brbg](./docs/images/brbg.png) |
| broc | crameri | diverging | ![broc](./docs/images/broc.png) |
| broco | crameri | cyclic | ![broco](./docs/images/broco.png) |
| buda | crameri | sequential | ![buda](./docs/images/buda.png) |
| bugn | colorbrewer | sequential | ![bugn](./docs/images/bugn.png) |
| bupu | colorbrewer | sequential | ![bupu](./docs/images/bupu.png) |
| cividis | matplotlib | sequential | ![cividis](./docs/images/cividis.png) |
| cork | crameri | diverging | ![cork](./docs/images/cork.png) |
| corko | crameri | cyclic | ![corko](./docs/images/corko.png) |
| crest | seaborne | sequential | ![crest](./docs/images/crest.png) |
| dark2 | colorbrewer | qualitative | ![dark2](./docs/images/dark2.png) |
| davos | crameri | sequential | ![davos](./docs/images/davos.png) |
| devon | crameri | sequential | ![devon](./docs/images/devon.png) |
| flare | seaborne | sequential | ![flare](./docs/images/flare.png) |
| gnbu | colorbrewer | sequential | ![gnbu](./docs/images/gnbu.png) |
| grayc | crameri | sequential | ![grayc](./docs/images/grayc.png) |
| greens | colorbrewer | sequential | ![greens](./docs/images/greens.png) |
| greys | colorbrewer | sequential | ![greys](./docs/images/greys.png) |
| hawaii | crameri | sequential | ![hawaii](./docs/images/hawaii.png) |
| icefire | seaborne | diverging | ![icefire](./docs/images/icefire.png) |
| imola | crameri | sequential | ![imola](./docs/images/imola.png) |
| inferno | matplotlib | sequential | ![inferno](./docs/images/inferno.png) |
| lajolla | crameri | sequential | ![lajolla](./docs/images/lajolla.png) |
| lapaz | crameri | sequential | ![lapaz](./docs/images/lapaz.png) |
| lisbon | crameri | diverging | ![lisbon](./docs/images/lisbon.png) |
| magma | matplotlib | sequential | ![magma](./docs/images/magma.png) |
| mako | seaborne | sequential | ![mako](./docs/images/mako.png) |
| nuuk | crameri | sequential | ![nuuk](./docs/images/nuuk.png) |
| oranges | colorbrewer | sequential | ![oranges](./docs/images/oranges.png) |
| orrd | colorbrewer | sequential | ![orrd](./docs/images/orrd.png) |
| oslo | crameri | sequential | ![oslo](./docs/images/oslo.png) |
| paired | colorbrewer | qualitative | ![paired](./docs/images/paired.png) |
| pastel1 | colorbrewer | qualitative | ![pastel1](./docs/images/pastel1.png) |
| pastel2 | colorbrewer | qualitative | ![pastel2](./docs/images/pastel2.png) |
| piyg | colorbrewer | diverging | ![piyg](./docs/images/piyg.png) |
| plasma | matplotlib | sequential | ![plasma](./docs/images/plasma.png) |
| prgn | colorbrewer | diverging | ![prgn](./docs/images/prgn.png) |
| pubu | colorbrewer | sequential | ![pubu](./docs/images/pubu.png) |
| pubugn | colorbrewer | sequential | ![pubugn](./docs/images/pubugn.png) |
| puor | colorbrewer | diverging | ![puor](./docs/images/puor.png) |
| purd | colorbrewer | sequential | ![purd](./docs/images/purd.png) |
| purples | colorbrewer | sequential | ![purples](./docs/images/purples.png) |
| rdbu | colorbrewer | diverging | ![rdbu](./docs/images/rdbu.png) |
| rdgy | colorbrewer | diverging | ![rdgy](./docs/images/rdgy.png) |
| rdpu | colorbrewer | sequential | ![rdpu](./docs/images/rdpu.png) |
| rdylbu | colorbrewer | diverging | ![rdylbu](./docs/images/rdylbu.png) |
| rdylgn | colorbrewer | diverging | ![rdylgn](./docs/images/rdylgn.png) |
| reds | colorbrewer | sequential | ![reds](./docs/images/reds.png) |
| rocket | seaborne | sequential | ![rocket](./docs/images/rocket.png) |
| roma | crameri | diverging | ![roma](./docs/images/roma.png) |
| romao | crameri | cyclic | ![romao](./docs/images/romao.png) |
| set1 | colorbrewer | qualitative | ![set1](./docs/images/set1.png) |
| set2 | colorbrewer | qualitative | ![set2](./docs/images/set2.png) |
| set3 | colorbrewer | qualitative | ![set3](./docs/images/set3.png) |
| spectral | colorbrewer | diverging | ![spectral](./docs/images/spectral.png) |
| tab10 | matplotlib | qualitative | ![tab10](./docs/images/tab10.png) |
| tab20 | matplotlib | qualitative | ![tab20](./docs/images/tab20.png) |
| tab20b | matplotlib | qualitative | ![tab20b](./docs/images/tab20b.png) |
| tab20c | matplotlib | qualitative | ![tab20c](./docs/images/tab20c.png) |
| tofino | crameri | diverging | ![tofino](./docs/images/tofino.png) |
| tokyo | crameri | sequential | ![tokyo](./docs/images/tokyo.png) |
| turku | crameri | sequential | ![turku](./docs/images/turku.png) |
| twilight | matplotlib | cyclic | ![twilight](./docs/images/twilight.png) |
| twilight_shifted | matplotlib | cyclic | ![twilight_shifted](./docs/images/twilight_shifted.png) |
| vanimo | crameri | diverging | ![vanimo](./docs/images/vanimo.png) |
| vik | crameri | diverging | ![vik](./docs/images/vik.png) |
| viko | crameri | cyclic | ![viko](./docs/images/viko.png) |
| viridis | matplotlib | sequential | ![viridis](./docs/images/viridis.png) |
| vlag | seaborne | diverging | ![vlag](./docs/images/vlag.png) |
| ylgn | colorbrewer | sequential | ![ylgn](./docs/images/ylgn.png) |
| ylgnbu | colorbrewer | sequential | ![ylgnbu](./docs/images/ylgnbu.png) |
| ylorbr | colorbrewer | sequential | ![ylorbr](./docs/images/ylorbr.png) |
| ylorrd | colorbrewer | sequential | ![ylorrd](./docs/images/ylorrd.png) |



