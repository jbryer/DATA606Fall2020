if(!require(blogdown)) {
	devtools::install_github('rstudio/blogdown')
	library(blogdown)
}

devtools::install_github("gadenbuie/ggweekly")


# Setup (run only once per class)
# blogdown::install_hugo()
# blogdown::new_site()
# blogdown::install_theme(theme = 'vjeantet/hugo-theme-docdock')
# brew uninstall --force hugo
blogdown::install_hugo(version = '0.49.2', force=TRUE, use_brew=FALSE)
blogdown::hugo_version()

blogdown::build_site()

# Serve site
blogdown::serve_site()
blogdown::stop_server()


# Build site for Github pages
# build_mysite <- function(...) {
# 	blogdown::build_site()
# 	tocopy <- c(list.files("public", full.names = TRUE), list.dirs("public", full.names = TRUE))
# 	copied <- file.copy(tocopy, 'docs', recursive = TRUE, overwrite = TRUE, copy.date = TRUE)
# 	if(!all(copied)) {
# 		warning(paste0("The following files or directories were not copied: ",
# 					   paste0(tocopy[!copied], collapse = ', ')))
# 	}
# 	unlink('public', recursive = TRUE)
# }
#
# build_mysite()

# Sometimes the file.copy doesn't work, then try this (it will replace the entire directory)
# unlink("docs", recursive=TRUE); file.rename('public', 'docs')

