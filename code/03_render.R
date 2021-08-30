# Knit the HTML version
rmarkdown::render(
  here::here("code/02_main.Rmd"),
  params = list(pdf_mode = FALSE),
  output_file = here::here("output/cv.html")
  )

# Knit the PDF version to temporary html location
tmp_html_cv_loc <- fs::file_temp(ext = ".html")
rmarkdown::render(
  here::here("code/02_main.Rmd"),
  params = list(pdf_mode = TRUE),
  output_file = tmp_html_cv_loc
  )

# Convert to PDF using Pagedown
pagedown::chrome_print(
  input = tmp_html_cv_loc,
  output = here::here("output/cv.pdf")
  )
