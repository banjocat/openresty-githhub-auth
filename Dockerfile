FROM openresty/openresty:alpine-fat

RUN luarocks install lua-resty-http
RUN luarocks install lua-resty-session
RUN mkdir -p /opt/github-oauth/logs

WORKDIR /opt/github-oauth

COPY conf conf
COPY lua lua
ENTRYPOINT []
CMD /usr/local/openresty/bin/openresty -p $(pwd) -c conf/nginx.conf


