FROM node:14

WORKDIR /app

RUN git clone -b getAttemptQuizes https://github.com/djtoler/Build-and-Deploy-NodeJS-MicroService-App-On-AWS_EKS.git .

RUN npm install --force

EXPOSE 8006

CMD ["npm", "start"]
