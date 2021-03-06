FROM frolvlad/alpine-glibc
WORKDIR /home/app
RUN set -eux \
    && apk add --no-cache --update-cache --virtual .czu curl zip unzip \
    && curl -fsSL https://deno.land/x/install/install.sh | sh \
    && apk del --purge .czu \
    && apk add --no-cache libstdc++
ENV DENO_INSTALL=/root/.deno
ENV PATH=$DENO_INSTALL/bin:$PATH
ENTRYPOINT ["deno", "run"]
CMD ["https://deno.land/std/examples/welcome.ts"]