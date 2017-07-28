FROM openanalytics/r-base

RUN R -e "install.packages(c('shiny', 'DT', 'ggplot2', 'plotly'), repos='https://cloud.r-project.org/')"

RUN mkdir /root/aplikacja_02
COPY aplikacja_02 /root/aplikacja_02

COPY Rprofile.site /usr/lib/R/etc/

EXPOSE 3838

CMD ["R", "-e shiny::runApp('/root/aplikacja_02')"]
