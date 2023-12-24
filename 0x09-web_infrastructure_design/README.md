## DESCRIPTION

this project is aimed at understanding the basics and functionality of a web infrastructure. the projec is also designed to give a direct whiteboarded  explaination without beign verbose.

in this project we'd use strictly diagrams to explain concepts.

### Task 0
- a brief explaination.
1. Server (8.8.8.8):
A physical or virtual machine responsible for hosting the web infrastructure.
2. Domain Name (www.foobar.com):
Registered and managed through a domain registrar, associating the domain with the server's IP address (8.8.8.8) using DNS records.
3. DNS Record (www):
A CNAME record pointing www.foobar.com to the server's IP address.
4. Web Server (Nginx):
Nginx serves as the web server, handling HTTP requests, and serving static content. It acts as the entry point for incoming traffic.
5. Application Server:
The application server runs your code base. For example, if it's a Python application, you might use Gunicorn or uWSGI to serve the application.
6. Application Files:
this simple the code base which contains all instruction for building for building the website
7. Database (MySQL):
MySQL is the chosen relational database management system to store and retrieve data for the application.
- the issues with this infrastructure are:
1. SPOF (Single Point Of entry):
once there is a problem it goes off hence the need for a backup server.
2. during maintainance this infrastructure has to be temporarily down which could be an issue, to address this we still need a back up servers to minimize the downtime.
3. Scaling: the issue here is it can't handle high traffic (crowd) effectively, hence the need for load balancers.
