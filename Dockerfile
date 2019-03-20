FROM neo4j:3.5

ENV APOC_VERSION 3.5.0.2
ENV APOC_URI https://github.com/neo4j-contrib/neo4j-apoc-procedures/releases/download/${APOC_VERSION}/apoc-${APOC_VERSION}-all.jar

RUN mkdir plugins \
  pushd plugins \
  popd \
  wget $APOC_URI && mv apoc-${APOC_VERSION}-all.jar plugins/apoc-${APOC_VERSION}-all.jar \
  --rm -e NEO4J_AUTH=none -p 7474:7474 -v $PWD/plugins:/plugins -p 7687:7687 neo4j:3.5

EXPOSE 7474 7473 7687

CMD ["neo4j"]