FROM node:14

WORKDIR /app

RUN git clone -b getQuestions https://github.com/djtoler/Build-and-Deploy-NodeJS-MicroService-App-On-AWS_EKS.git .

RUN npm install --force

EXPOSE 8009

CMD ["npm", "start"]
