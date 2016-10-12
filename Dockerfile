FROM arangodb/arangodb

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        xz-utils && \
    rm -rf /var/lib/apt/lists/*

ADD profiles.json.xz /profiles.json.xz
ADD relations.tsv.xz /relations.tsv.xz
ADD import.sh   /import.sh

