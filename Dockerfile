FROM adoptopenjdk:15-jre-hotspot

RUN apt-get update \
    && apt-get install -y \
      unzip \
    && rm -rf /var/lib/apt/lists/*

RUN curl -SL https://oss.sonatype.org/content/repositories/snapshots/fr/pilato/elasticsearch/crawler/fscrawler-es7/2.7-SNAPSHOT/fscrawler-es7-2.7-20210505.084329-178.zip > /tmp/fscrawler.zip \
    && cd /opt/ \
    && unzip /tmp/fscrawler.zip \
    && ln -s /opt/fscrawler-es7-2.7-SNAPSHOT/bin/fscrawler /usr/local/bin/ \
    && rm -rf /tmp/*

COPY config/ /opt/fscrawler-es7-2.7-SNAPSHOT/config

CMD ["/opt/fscrawler-es7-2.7-SNAPSHOT/bin/fscrawler"]
