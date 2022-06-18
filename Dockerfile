FROM node:latest
WORKDIR /home/node/app
COPY package*.json ./
RUN apt-get update \
    && apt-get install -y wget gnupg \
    && wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' \
    && apt-get update \
    && apt-get install -y google-chrome-stable fonts-ipafont-gothic fonts-wqy-zenhei fonts-thai-tlwg fonts-kacst fonts-freefont-ttf libxss1 \
      --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*
RUN npm install
RUN npm install whatsapp-web
RUN npm install express
RUN npm install express-validator
RUN npm install socket.io
RUN npm install qrcode
RUN npm install http
RUN npm install fs
RUN npm install axios
RUN npm install mime-types
COPY --chown=node:node . .
EXPOSE 80
CMD ["npm","run","start"]