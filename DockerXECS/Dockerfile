#Specify the base image
FROM node:alpine

#Specify the working directory: The directory in which all of our files are going to be and run inside the container
WORKDIR /app

#Copy package.json (notice that package.json is in the same directory Dockerfile, hence the ".")
COPY package.json . 

#Install all dependencies
RUN npm install

#There might be some other files and folders inside of the application that is not inside the image, such as index.js
#So, copy everything in this directory (first ".") to the app directory (second ".")
#Doing this instead of copying everything in line 8 itself because Docker works on layers.
#Anytime we make a change to a file (say index.js) that does not affect package.json, we do not want to run "npm run install" again and again because caching will not take place in line 8 then

COPY . .

#Expose the port
EXPOSE 5000

#Command to start the file
CMD ["node","index.js"]