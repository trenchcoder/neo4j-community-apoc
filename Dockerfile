FROM neo4j:3.5

ENV APOC_VERSION 3.5.0.2
ENV APOC_URI https://github.com/neo4j-contrib/neo4j-apoc-procedures/releases/download/${APOC_VERSION}/apoc-${APOC_VERSION}-all.jar

RUN wget $APOC_URI && mv apoc-${APOC_VERSION}-all.jar plugins/apoc-${APOC_VERSION}-all.jar

ENV NEO4J_dbms_security_procedures_unrestricted=apoc.\\\*

ENV NEO4J_AUTH=none
ENV NEO4J_dbms_logs_http_enabled=true

EXPOSE 7474 7473 7687

CMD ["neo4j"]