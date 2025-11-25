FROM python:3.12-slim

ENV DEBIAN_FRONTEND=noninteractive
ENV CHECKSUM_KEY="readme"
EXPOSE 3000
EXPOSE 3001
EXPOSE 3005
EXPOSE 5000

RUN apt-get update && \
    apt-get install -y curl ca-certificates gnupg && \
    curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    mkdir -p /usr/share/keyrings && \
    curl -fsSL https://dl.yarnpkg.com/debian/pubkey.gpg | gpg --dearmor -o /usr/share/keyrings/yarn.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/yarn.gpg] https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list && \
    apt-get update && \
    apt-get install -y nodejs yarn git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app
RUN git clone https://github.com/Skeli789/Unbound-Cloud.git repo

WORKDIR /app/repo
RUN yarn install
RUN pip install -r requirements.txt
WORKDIR /app/repo/server
RUN yarn install
RUN echo 'CHECKSUM_KEY="readme"' > .env
WORKDIR /app/repo
RUN sed -i 's/const ACCOUNT_SYSTEM = true;/const ACCOUNT_SYSTEM = false;/' src/MainPage.js

WORKDIR /app
RUN cat << EOF > start.sh
#!/bin/sh

# Start backend
cd /app/repo/server
yarn start &

# Start frontend
cd /app/repo
yarn start
EOF
RUN chmod +x start.sh

CMD ["./start.sh"]
