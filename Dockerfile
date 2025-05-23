FROM node:18 AS base

WORKDIR /app

RUN apt-get update -y \
    && apt-get install -y \
        cron \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY crontab /etc/cron.d/dg-crontab
RUN chmod 0644 /etc/cron.d/dg-crontab
RUN crontab /etc/cron.d/dg-crontab

CMD ["cron", "-f"]
