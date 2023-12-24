FROM node:14

WORKDIR /app

RUN git clone -b logout https://github.com/djtoler/Build-and-Deploy-NodeJS-MicroService-App-On-AWS_EKS.git .

RUN npm install --force

EXPOSE 8013

CMD ["npm", "start"]
