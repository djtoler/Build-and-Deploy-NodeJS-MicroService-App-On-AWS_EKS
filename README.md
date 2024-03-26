<p align="left">
<img src="https://github.com/djtoler/Build-and-Deploy-NodeJS-MicroService-App-On-AWS_EKS/blob/main/1microservice.png">
</p>

##### The repository with the refactored code can be found below... [here](https://github.com/QuizAppMicroservices)

### Purpose
##### The purpose of this code refactoring and restructuring is to turn the Quiz Network application found [here](https://github.com/yashksaini/quiz-network-server/tree/main) from its current monolithic architecture to a microservices architecture. I will do this by converting the individual routes into services that can run in a Kubernetes cluster. 

> ##### Feature: This will make the application easier to efficiently scale because not all of the individual routes/services within the application have the same scaling requirements. For example, the `updateQuestion` service/route will get significantly less traffic than the `login` service/route, and decoupling and deploying them to a Kubernetes cluster will allow for the `login` service/route to be horizontally scaled without having to unnecessarily scale other services/routes.

> ##### Benefit: This strategy has the potential to significantly reduce the cost when running this application at scale because of how precise we can get with our resource allocation.


### Diagram
#### Monolith Architecture
<p align="left">
<img src="https://github.com/djtoler/Build-and-Deploy-NodeJS-MicroService-App-On-AWS_EKS/blob/main/monilithdiagram.png">
</p>



