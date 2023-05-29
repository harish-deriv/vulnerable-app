FROM perl:latest

WORKDIR /app

COPY cpanfile* ./
RUN cpanm --installdeps .

COPY lib/ ./lib
COPY script/ ./script

CMD ["script/myapp", "daemon", "-m", "production"]
