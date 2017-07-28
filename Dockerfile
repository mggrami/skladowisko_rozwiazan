FROM openanalytics/r-base

RUN R -e "install.packages(c('shiny', 'DT', 'ggplot2', 'plotly'), repos='https://cloud.r-project.org/')"

RUN mkdir /root/Aplikacja_02
COPY Aplikacja_02 /root/Aplikacja_02

COPY Rprofile.site /usr/lib/R/etc/

EXPOSE 3838

CMD ["R", "-e shiny::runApp('/root/aplikacja_02')"]
