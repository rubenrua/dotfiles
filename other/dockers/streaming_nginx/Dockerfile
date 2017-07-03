FROM ubuntu

RUN apt-get update && \
    apt-get install -y curl emacs-nox git monit && \
    apt-get install -y libgd3 libgeoip1 libxslt1.1 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*


COPY etc/nginx/ /etc/galicasterpro/sys/streaming
COPY etc/restartStreaming /opt/teltek/galicasterpro/restartStreaming
COPY etc/monitrc /etc/monit/conf.d/streaming
COPY debs /root/debs

RUN dpkg -i /root/debs/nginx-common_1.10.0-0ubuntu0.16.04.2_all.deb  /root/debs/nginx-full_1.10.0-0ubuntu0.16.04.2_amd64.deb

RUN mkdir -p /var/log/galicasterpro/streaming/ && mkdir -p /var/run/galicasterpro/

RUN addgroup galicaster
RUN useradd galicaster -g galicaster

CMD monit -I start all