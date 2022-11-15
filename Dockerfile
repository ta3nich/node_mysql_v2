FROM node:16


# Install required packages ko4
#RUN apt-get update
#RUN DEBIAN_FRONTEND=noninteractive apt-get -y install python
#RUN DEBIAN_FRONTEND=noninteractive apt-get -y install mysql-server

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

RUN npm install
# If you are building your code for production
# RUN npm ci --only=production

# Bundle app source .
COPY . .

EXPOSE 3000 3306 10000


CMD [ "node", "server.js" ]

#CMD ["/run.sh"]
#CMD [ "/usr/bin/supervisord", "-n" ]


