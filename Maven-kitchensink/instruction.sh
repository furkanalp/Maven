# Deploying an Application with JBoss EAP and Apache Maven
# We have been tasked with setting up the deployment scanner for our standalone JBoss hosts to streamline the deploy process. We want to retain the ability to disable applications and want to employ some safeguards, so instead of utilizing auto-deployment, a simple deployment marker needs to be created for each deploy.

# Using the CLI, we will disable auto-deployment for XML and zipped files, then test our changes by deploying the kitchensink.war application found in the cloud_user's home directory. We will then check our changes using PUBLICIP:8080/kitchensink.

# Before We Begin
# Before we begin the lab, long into the server on your command line using the provided credentials.

# Install Apache Maven
# The first thing we need to do is install Apache Maven. To do so, use 
sudo yum install maven 
#and follow the prompts.

# Deploy the Application
# With Maven installed, we need to move over to the kitchensink directory using 
cd kitchensink
# Here, review the contents. It contains a pom.xml file for building and deploying the project in Maven.

# The project itself is stored in the src directory, along with tests. Use ls to list out all the information.

# Next, deploy the application using 
sudo mvn clean install wildfly:deploy 
# After it has finished deploying, we want to visit PUBLICIP:8080/kitchensink in our web browser to ensure that the application is working correctly. Remember that PUBLICIP must be your public IP address.

# Make a Change to the Application
# To make a change to our application, we need to undeploy it first. To do so, use the command 
sudo mvn wildfly:undeploy 
# Once undeployed, make a superficial change to the application using 
vim src/main/webapp/WEB-INF/templates/default.xhtml.

All we are going to do is update the title to "Add a change!":

```
<title>Add a change!</title>
```
Redeploy the Application
With our change in place, we need to deploy the application once more; notice how much faster it deploys this time:

```
sudo mvn clean install wildfly:deploy
```
To make sure that our change took place, visit the application and check to see that the title has changed to "Add a change!".