FROM microsoft/dotnet:2.2-sdk

#Install node
ENV NODE_VERSION 10.15.3
ENV NODE_DOWNLOAD_SHA 6c35b85a7cd4188ab7578354277b2b2ca43eacc864a2a16b3669753ec2369d52

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

#Install TypeScript
RUN npm install -g typescript

ENV NODE_PATH "/usr/lib/node_modules/"
