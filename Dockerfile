FROM frolvlad/alpine-glibc as build
WORKDIR /home/app
RUN set -eux
RUN apk add --no-cache --update-cache --virtual .czu \
    curl zip unzip
RUN curl -fsSL https://deno.land/x/install/install.sh | sh
RUN apk del --purge .czu
RUN apk add --no-cache libstdc++
ENV DENO_INSTALL=/root/.deno
ENV PATH=$DENO_INSTALL/bin:$PATH
ENTRYPOINT ["deno", "run"]
CMD ["https://deno.land/std/examples/welcome.ts"]