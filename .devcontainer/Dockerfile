FROM frolvlad/alpine-glibc
WORKDIR /home/app
RUN set -eux \
    && apk add --no-cache --update-cache --virtual .czu curl zip unzip zsh \
    && curl -fsSL https://deno.land/x/install/install.sh | sh \
    && apk del --purge .czu \
    && apk add --no-cache libstdc++
RUN PATH="$PATH:/usr/bin/zsh"
ENV DENO_INSTALL=/root/.deno
ENV PATH=$DENO_INSTALL/bin:$PATH