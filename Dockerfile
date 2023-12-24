FROM node:14

WORKDIR /app

RUN git clone -b getResults https://github.com/djtoler/Build-and-Deploy-NodeJS-MicroService-App-On-AWS_EKS.git .

RUN npm install --force

EXPOSE 8011

CMD ["npm", "start"]
