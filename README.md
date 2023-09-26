# Code Challenge - Read this first.

Thanks for taking the time to go through the code challenge task with AIgnostics.

In this repository we propose 2 tasks and both must be completed

Once you are done, you must deliver your answers via Pull Request. You can propose two Pull Requests, one per task, or just one with all the code. Reviewers will be automatically assigned.

# 1-Terraform

Create a **draft** for a terraform project under [1-terraform](1-terraform) that:

- Create a Kubernetes Cluster
- Create a database instance and create a database per application based on a list of apps provided.
  - products database application
  - documents database application
- The code should serve to deploy these services in 3 different environments (dev/stage/prod).

:warning: Your code does not need to be `terraform apply`-able , we'll ONLY read the code, not execute it, so pick your own cloud(there is no need to run the code in the cloud but the code must be for an specific cloud provider of your choosing) and don't worry about syntax being 100% correct. Please do not send production code you've used in a real project, and instead try to keep things as simple as possible.

# 2-Kubernetes

This is a simple application deployment in kubernetes, it's configured to work locally with minikube and helm.

Please find the base code under [2-kubernetes](2-kubernetes)

You'll need those to verify your code deploying in minikube (of course k3s or microk8s are also perfectly ok).

You can deploy the current code and your changes with:

```
helm upgrade --install --kube-context minikube --values 2-kubernetes/helm/values.yaml kubernetes-task 2-kubernetes/helm/
```

## Questions

1. This application is currently not working properly, can you figure out why, so you can at least access the service with a port-forward?
2. Deploy 3 times the same service+deployment (3 services + 3 deployments) but each of them should show a different string:
   - Hello Freund
   - Hello Amigo
   - Hello Friend
3. Add the necessary code to expose this service to outside of the cluster. Also, when querying different endpoints it should show each of the different services you created on the previous step:
   - `http://<address>/de` should show "Hello Freund"
   - `http://<address>/es` should show "Hello Amigo"
   - `http://<address>/en` should show "Hello Friend"

> NOTE: Each of these questions are necessary to complete the next one

You can propose all your changes on a single request.

# Presentation

We will schedule a meeting to give you the chance to explain your solution. Please be prepared to share your screen and to go through your solution with us. Keep in mind, there is never only one solution. We would like to understand how you approached the problem and why you chose a specific way.

Just as a hint, if you use Google Chrome for the presentation, you will be able to use the "picture-in-picture" mode within the call. This way you can share your screen and see all call attendees at the same time in a second window.
