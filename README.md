# Test-deployment
## Deployment with different port
  By default the application will run on port 8080. 
  
  To run it on your recommended port go to service config --> target port: $(change it to your recommended port)

**Reference**: Pdf file D0280 Page- 379 384

Need 2 projects. One for Jenkin pipeline and one for main application\
`oc new-project ${jenkin-project-name}`
`oc new-project ${application-project-name}`

**Jenkin project configuration:**

Change to jenkin project 
`oc project ${jenkin-project-name}`

From developer section deploy a jenkin application from catalog \

Configure the jenkin application \

Go to Manage Jenkins --> Configure System --> OpenShift Jenkins Sync \
In the "Namespace" section put the jenkin project name and the application project name with space between them \
Click "apply" and then "save" button 



  
Main application project configuration:

Oc project application-project-name
Create a build config file

Edit jenkin role
`oc policy add-role-to-user edit system:serviceaccount:jenkin-project-name:jenkins -n application-project-name`
  
  
  
