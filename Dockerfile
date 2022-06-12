FROM ossrs/srs:4

COPY srs.conf /usr/local/srs/conf/custom.conf

CMD [ "./objs/srs", "-c", "conf/custom.conf" ]