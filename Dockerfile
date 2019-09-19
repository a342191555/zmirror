FROM python:3

WORKDIR /zmirror
COPY . .
#python3 and flask requests cchardet fastcache dependencies installation
#cron可选安装。
RUN apt-get update && \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    chown -R www-data.www-data /zmirror && \
    pip install gunicorn gevent && \
    pip install -r /zmirror/requirements.txt

ENV PYTHONPATH=/zmirror

RUN chmod a+x /zmirror/entrypoint.sh

# PORTS
EXPOSE 80

ENTRYPOINT ["/zmirror/entrypoint.sh"]
