Introduction

This project provisions a Linux CentOS 7 vagrant virtual machine, running on a VirtualBox virtualization layer, to deploy a Python-based web application using Flask, Gunicorn and Nginx.
The web application presents a table of the Jewish holidays for the next 3 months, through a secure web URL.


Installation & Usage

To set up and run this project locally, follow these steps:

		1. Install Vagrant and VirtualBox on your host machine.
		Vagrant- https://developer.hashicorp.com/vagrant/downloads?product_intent=vagrant
		VirtualBox- https://tecadmin.net/how-to-install-virtualbox-on-ubuntu-22-04/
		2. Clone the repository to your local machine.	
		3. Navigate to the project directory.
		4. Launch the Vagrant environment by running the command 'vagrant up'.
		5. Once the virtual machine is up, check the last message log to find the machine's IP address.
		6. Type the IP address in your web browser to access the application.
		7. SSH into the Vagrant virtual machine using 'vagrant ssh' in order to make changes or to find the machine's IP using the command 'ip addr show'.


Files

'Vagrantfile'
		The Vagrantfile provided in the repository provisions a CentOS 7 virtual machine, with a private network settings, while copying necessary files for the web application and running the script install.sh once the machine is created.

'application.py'
		The application.py file contains the Python program that acts as an HTTP server. It retrieves Jewish holiday data for the next three months using the Jewish calendar REST API. The retrieved data is formatted as a JSON structure and served as a response to incoming requests.

'install.sh'
		The install.sh script is executed as a shell provisioner during the Vagrant environment setup. It installs Python 3.10.2, additional dependencies (including Flask, gunicorn and requests libraries), and Nginx server.
		Additionally, the script creates a self-signed openssl certificates, places the relevant files in their location inside the virtual machine and runs the gunicorn.service file in order to start the application.

