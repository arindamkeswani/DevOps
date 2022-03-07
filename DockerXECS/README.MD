> Objective: To deploy a docker app to Amazon ECS

1. Setting up the code: The application that we are deploying is made using Express, so make an index.js file with some sample code. Make sure that you have installed express using `npm install express`

2. Dockerizing the application: Steps have been specified in the comments of the Dockerfile
    - After making the dockerfile, go to your terminal and write the command `docker build -t express-app .`. This will build the docker file in the directory
    - run `docker images` and see the output, it should look something like this:

    ![](2022-03-07-15-15-17.png) 

    - Note down yout Image ID which will look something like "8a63cd43ca6f"
    - To run the container, run `docker run -p 6565:5000 <IMAGE ID>` (this will run the container on port 6565 on our local machine. You can set the port on your own)
    
    E.g., I will run `docker run -p 6565:5000 8a63cd43ca6f`

    Output on default endpoint:

    ![](2022-03-07-15-22-01.png)

    Output on /about endpoint:

    ![](2022-03-07-15-23-21.png)

    > With that, the application is now running on our local machine