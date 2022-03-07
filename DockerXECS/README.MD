> Objective: To deploy a docker app to Amazon ECS

Prerequisites:

1. [Set-up AWS CLI](https://docs.aws.amazon.com/polly/latest/dg/setup-aws-cli.html)
2. Set up Docker Desktop

Steps:

1. Setting up the code: The application that we are deploying is made using Express, so make an index.js file with some sample code. Make sure that you have installed express using `npm install express`

2. Dockerizing the application: Steps have been specified in the comments of the Dockerfile
    - After making the dockerfile, go to your terminal and write the command `docker build -t express-app .`. This will build the docker file in the directory
    - run `docker images` and see the output, it should look something like this:

    ![](2022-03-07-15-15-17.png) 

    - Note down yout Image ID which will look something like "b7fe7e253a5d"
    - To run the container, run `docker run -p 6565:5000 <IMAGE ID>` (this will run the container on port 6565 on our local machine. You can set the port on your own)
    
    E.g., I will run `docker run -p 6565:5000 b7fe7e253a5d`

    Output on default endpoint:

    ![](2022-03-07-15-22-01.png)

    Output on /about endpoint:

    ![](2022-03-07-15-23-21.png)

    > With that, the application is now running on our local machine

3. Creating a repository with Elasic Container Registry (ECR)
    #### The task now is to get our image into AWS
    - Go to AWS Management Console, search for and go to ECS (Elastic Container Service)
    - Go to Amazom ECR by clicking on "Repositories". This is where we register our images. Click on 'Create Repository' button
        - Set Visibility to 'Public' for this tutorial. This is so that we can avoid setting IAM rules for now.
        - Give your repository a name of your choice
        - Leave the rest of the settings as they are and click on "Create repository"

        ![](2022-03-07-15-49-59.png)

    - Now, we need to build our Docker image and push it into the "express-app" repository
        - Click on your repository, click on "View push commands"
        - You will see a set of commands, run them one by one.
        - After the last command is done running, you should be able to see the Image in your AWS Console.

        ![](2022-03-07-17-07-48.png)

        > Now, our image has been pushed to the repo, very similar to how we do it on Docker Hub.
