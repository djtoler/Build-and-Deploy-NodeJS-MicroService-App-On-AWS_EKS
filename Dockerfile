FROM node:14

WORKDIR /app

RUN git clone -b getProfile https://github.com/djtoler/Build-and-Deploy-NodeJS-MicroService-App-On-AWS_EKS.git .

RUN npm install --force

EXPOSE 8008

CMD ["npm", "start"]
