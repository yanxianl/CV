## Data-driven CV

This repository contains code and data to render my data-driven CV.

## File organization

Below is an overview of the file organization in this repository.

```
root
├── code
│   ├── 00_styles.css     # css style for rendering cv
│   ├── 01_plots.R        # plots inserted into cv
│   ├── 02_main.Rmd       # main part of the cv
│   └── 03_render.R       # render cv to html or pdf file
│
├── data
│   ├── positions.csv     # data for making the main part of the cv
│   ├── profile.json      # google scholar profile data
│   └── citation.json     # google scholar citation data
│
├── img
│   └── me.jpg            # profile picture
│
├── output
│   ├── citation.png      # citation plot
│   ├── coding_skills.png # coding skill bar plot
│   ├── cv.html           # cv in html format
│   └── cv.pdf            # cv in pdf format
│
├── LICENSE
├── cv.Rproj
└── README.md
```

## Acknowledgements

The code used for generating the CV was modified from [Dr. Yu's CV](https://github.com/GuangchuangYu/cv). The data-driven CV was generated using the R package [datadrivencv](https://github.com/nstrayer/datadrivencv), developed by Nick Strayer.
