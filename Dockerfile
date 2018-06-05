#FROM docker.elastic.co/elasticsearch/elasticsearch:5.2.2
FROM elasticsearch:5.2.2
ADD elasticsearch.yml /usr/share/elasticsearch/config/
USER root
RUN chown elasticsearch:elasticsearch config/elasticsearch.yml

RUN elasticsearch-plugin install https://github.com/NLPchina/elasticsearch-analysis-ansj/releases/download/v5.2.2/elasticsearch-analysis-ansj-5.2.2.0-release.zip
RUN mkdir -pv /usr/share/elasticsearch/plugins/elasticsearch-analysis-ik-5.2.2/ && curl -L https://github.com/medcl/elasticsearch-analysis-ik/releases/download/v5.2.2/elasticsearch-analysis-ik-5.2.2.zip -o /tmp/ik.zip && unzip -uo /tmp/ik.zip -d /usr/share/elasticsearch/plugins/elasticsearch-analysis-ik-5.2.2/ && rm -f /tmp/ik.zip



USER elasticsearch

EXPOSE 9200 9300

