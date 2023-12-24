FROM node:14

WORKDIR /app

RUN git clone -b auth https://Build-and-Deploy-NodeJS-MicroService-App-On-AWS_EKS.git .

RUN npm install --force

EXPOSE 8003

CMD ["npm", "start"]
