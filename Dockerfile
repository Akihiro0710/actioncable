FROM rails

RUN \
  unlink /etc/localtime ;\
  ln -s /usr/share/zoneinfo/Japan /etc/localtime ;\
  sed -i -e 's@http://archive@http://jp.archive@' /etc/apt/sources.list ;\
  apt-get update -qq ;\
  apt-get install -y -qq locales ImageMagick ImageMagick-devel ;\
  locale-gen ja_JP.UTF-8 ;\
  apt-get clean
#----------------------------------------------------
WORKDIR .
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install

ADD . /app
WORKDIR /app

VOLUME /app
EXPOSE 3000
