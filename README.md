## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![](https://github.com/rconorpower/Project-1-Repository/blob/main/Images/Network%20Diagram.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the YAML playbook file may be used to install only certain pieces of it, such as Filebeat.

[my-playbook.yml](Ansible/my-playbook.yml)

```YAML
---
- name: My first playbook
  hosts: webservers
  become: true
  tasks:

  - name: Install apache httpd (state=present is optional)
    apt:
      name: apache2
      state: absent

  - name: docker.io
    apt:
      update_cache: yes
      name: docker.io
      state: present

  - name: Install pip3
    apt:
      name: python3-pip
      state: present

  - name: Install Python Docker Module
    pip:
      name: docker
      state: present

  - name: download and launch a docker web container
    community.docker.docker_container:
      name: dvwa
      image: cyberxsecurity/dvwa
      state: started
      restart_policy: always
      published_ports: 80:80

  - name: docker service
    systemd:
      name: docker
      enabled: yes
```
This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting traffic to the network.
- Load balancers protect the availability of a system by distributing the network traffic load across a group of backend resources or servers. The advantage of a jump box is it creates another level of protection between the internal and external networks. It also allows further network segregation, increased security, and better access control.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the data and system logs.
- What does Filebeat watch for? Filebeat monitors specified log files and information about the file system, including which files have changed and when.
- What does Metricbeat record? Metricbeat collects metrics from the system and services running on the server.

The configuration details of each machine may be found below.

| Name      | Function      | IP Address   | Operating System |
|-----------|:-------------:|:------------:|:-----------------|
| Jump Box  | Gateway       | 10.0.0.4     | Linux            |
| Web-1     | Webserver     | 10.0.0.5     | Linux            |
| Web-2     | Webserver     | 10.0.0.6     | Linux            |
| ELK-Master| ELK monitoring| 10.1.0.4     | Linux            |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jump Box Provisioner machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- IP Address of Local Machine

Machines within the network can only be accessed by SSH.
- The only machine allowed to access the ELK-Master VM is the Jump Box Provisioner (IP Address: 10.0.0.4) through SSH.

A summary of the access policies in place can be found in the table below.

| Name      | Publicly Accessible | Allowed IP Addresses |
|---------- |:-------------------:|:--------------------:|
| Jump Box  | Yes                 | Personal IP Address  |
| Web-1     | No                  | 10.0.0.4             |
| Web-2     | No                  | 10.0.0.4             |
| ELK-Master| No                  | 20.65.8.186          |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because it ensures that the provisioning scripts run identically everywhere, eliminating variability between configurations.

The playbook implements the following tasks:
- Installs docker.io on the elk machine
- Installs Python software (pip3)
- Installs docker python pip module
- Increases the virtual memory of the Elk machine
- Downloads and launches the docker Elk container while exposing ports 5601, 9200, and 5044
- Enables the docker service on boot

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![](https://github.com/rconorpower/Project-1-Repository/blob/main/Images/docker_ps_output.png)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- Web-1: 10.0.0.5
- Web-2: 10.0.0.6

We have installed the following Beats on these machines:
- Filebeat
- Metricbeat

These Beats allow us to collect the following information from each machine:
- Filebeat collects data about the file systemmy monitoring logs.
- Metricbeat collects machine metrics from the system and services running on the server.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the [install-elk.yml](Ansible/install-elk.yml) file to /etc/ansible/.
- Update the `hosts` file to include the Elk group and Elk machine ID
```
[elk]
10.1.0.4 ansible_python_interpreter=/usr/bin/python3
```
- Run the playbook, and navigate to Kibana [http://20.65.8.186:5601/app/kibana] to check that the installation worked as expected.

_As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc._
