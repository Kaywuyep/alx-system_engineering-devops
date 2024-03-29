## DESCRIPTION

###Infrastructure Overview:
This project aims to create a scalable and resilient web infrastructure for hosting the website www.foobar.com. The key components include an Application Server, a Web Server, a Load Balancer, and a Database, distributed across multiple servers for improved performance and fault tolerance.
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
1. SPOF (Single Point Of Failure):
once there is a problem it goes off hence the need for a backup server.
2. during maintainance this infrastructure has to be temporarily down which could be an issue, to address this we still need a back up servers to minimize the downtime.
3. Scaling: the issue here is it can't handle high traffic (crowd) effectively, hence the need for load balancers.

### Task 1
- a brief explaination.

just like we did in task 0, the major difference here is adding a load balancer and using two servers.
the load balancer(HAproxy) uses a Round Robin distribution algorithm, sending each request to the next server in the list. This helps distribute the load evenly among the web servers, futher more it has this features:
1. the Active -Passive setup: this helps both servers actively handle requests, this implies while one server is actively handling requests the other would be on standby.
2. database primary-replica cluster: in this set up it could also be called the master-slave  setup. The Primary node is where all writes and updates occur, and these changes are then replicated to the Replica node(s). This ensures data consistency and high availability. the main differnce here is The Primary node is responsible for handling write operations and updates. The Replica node(s) replicate the data from the Primary node and can handle read operations. This setup enhances performance and provides fault tolerance.

- issues with this infrastructure
1. SPOF: if any critical component fails eg the load balancer, could lead to service disruption
2. Security issues:
Lack of firewall: Without a firewall, the servers are more susceptible to unauthorized access. Implementing a firewall is crucial for securing the infrastructure.
No HTTPS: Transmitting data over HTTP is insecure. Adding HTTPS ensures secure communication between clients and servers.
3. Without monitoring, there's no proactive identification of issues. Implementing monitoring tools can help detect performance issues, security breaches, and other problems before they impact the user experience

###Task 2&3
- Web Server (1 server):
The Web Server is responsible for handling static content, serving as the first point of contact for incoming user requests. Nginx is chosen for its efficiency and speed in serving static files.
- Application Server (1 server):
The Application Server hosts the dynamic components of the website, handling user interactions and processing application logic. This separation from the Web Server allows for better resource utilization and scalability.
- Load Balancer (HAproxy configured as a cluster):
The Load Balancer, implemented with HAproxy, distributes incoming traffic across multiple Web Servers for load balancing. Configuring HAproxy as a cluster with redundancy ensures high availability and fault tolerance. In case one load balancer fails, the other can seamlessly take over.
- Database Server (1 server):
The Database Server, running MySQL, stores and manages the website's data. Separating the database onto its server allows for dedicated resources and improved database performance.
**Why These Components?**
1. Web Server:
Dedicated web servers enhance the separation of concerns, allowing efficient handling of static content, and facilitating easy scalability by adding more web servers as needed.
2. Application Server:
Separating the application logic onto a dedicated server improves overall system performance. It allows for better resource management and makes it easier to scale the application independently of the web server.
3. Load Balancer:
The Load Balancer ensures even distribution of incoming requests, preventing any single server from being overwhelmed. Configuring it as a cluster provides redundancy, reducing the risk of downtime due to load balancer failure.
4. Database Server:
Isolating the database onto its server improves data security, allows for dedicated resource allocation, and facilitates better optimization of database performance.
**Specifics:**
- Load Balancer Configuration:
HAproxy is configured as a cluster, ensuring that if one load balancer fails, the other seamlessly takes over. This setup enhances fault tolerance and availability.
**Next Steps:**
- Security Measures:
Implement a firewall to restrict unauthorized access to servers, enhancing overall system security.
- SSL/TLS (HTTPS) Implementation:
Enable SSL/TLS to secure data transmission between clients and servers, protecting user privacy and preventing potential security threats.
- Monitoring Setup:
Implement monitoring tools to track system performance, detect anomalies, and ensure proactive issue resolution
