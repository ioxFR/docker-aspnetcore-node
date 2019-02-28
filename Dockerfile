FROM microsoft/dotnet:2.2-aspnetcore-runtime

#Install node
ENV NODE_VERSION 9.1.0
ENV NODE_DOWNLOAD_SHA 5a05b32e677c6d5c2e85df30663aa1898aa8fe45ac6b797554069c97b9a5d228

RUN curl -SL "https://nodejs.org/dist/v${NODE_VERSION}/node-v${NODE_VERSION}-linux-x64.tar.gz" --output nodejs.tar.gz \
    && echo "$NODE_DOWNLOAD_SHA nodejs.tar.gz" | sha256sum -c - \
    && tar -xzf "nodejs.tar.gz" -C /usr/local --strip-components=1 \
    && rm nodejs.tar.gz \
    && ln -s /usr/local/bin/node /usr/local/bin/nodejs \
    && node -v

#Install libs
RUN apt-get update -y && \
     apt-get install -y sqlite3 libsqlite3-dev build-essential libssl-dev libffi-dev python-dev ssh sshpass
RUN apt-get purge -y --auto-remove 
