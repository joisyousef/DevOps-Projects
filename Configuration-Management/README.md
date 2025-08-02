# Ansible Configuration Management Project

This project demonstrates how to use **Ansible** for configuration management on a Linux server. The playbook automates the setup of a web server, installs and configures **Nginx**, and uploads a static HTML website.

## Table of Contents

- [Ansible Configuration Management Project](#ansible-configuration-management-project)
  - [Table of Contents](#table-of-contents)
  - [Project Setup](#project-setup)
    - [Prerequisites](#prerequisites)
    - [Steps to Set Up](#steps-to-set-up)
  - [Roles](#roles)
    - [Base Role](#base-role)
    - [Nginx Role](#nginx-role)
    - [App Role](#app-role)
    - [SSH Role](#ssh-role)
  - [Running the Playbook](#running-the-playbook)
    - [Running Specific Roles](#running-specific-roles)

## Project Setup

### Prerequisites

Before you begin, ensure the following are set up:

1. **Ansible Installed**: Follow [this guide](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html) to install Ansible on your local machine.
2. **A Remote Linux Server**: You need a server running Linux, either on a cloud provider like AWS, DigitalOcean, or a local VM or physical server.
3. **SSH Access**: Ensure that you can SSH into the server using the specified username.
4. **Website Tarball**: You must have a tarball (`website.tar.gz`) containing your static HTML website to upload.

### Steps to Set Up

1. **Clone the repository**:

   ```bash
   git clone https://github.com/joisyousef/Configuration-Management.git
   cd Configuration-Management
   ```

2. **Create the Inventory File**:
   Define the target host in an `inventory.ini` file:

```ini
   [webserver]
   192.168.1.3 ansible_user=yousef
```

3. **Prepare the Tarball**:
   Place your `website.tar.gz` file in the root of this project or specify its location in the playbook.

4. **Ensure SSH Keys**:
   Make sure your SSH key is properly set up for Ansible to connect to the target machine.

---

## Roles

### Base Role

The **Base Role** performs basic server configuration tasks:

- Installs utilities like `vim`, `git`, and `curl`.
- Updates system packages.
- Installs **Fail2ban** for security.
- Starts the firewall (`firewalld`).

**Tasks**:

- Update all packages.
- Install essential utilities.
- Enable and start the firewall.

### Nginx Role

The **Nginx Role** installs and configures **Nginx** to serve your static website.

**Tasks**:

- Install Nginx.
- Start and enable Nginx service.
- Copy the custom Nginx configuration file.

**Note**: You will need to ensure that you have a proper Nginx config file (`nginx.conf.j2`) for this role to work.

### App Role

The **App Role** is responsible for uploading your static website tarball to the server and unzipping it.

**Tasks**:

- Upload `website.tar.gz` to the server.
- Extract the tarball to the `/var/www/html` directory.

**Note**: Make sure to update the path to your `website.tar.gz` file in the `tasks/main.yml` file.

### SSH Role

The **SSH Role** adds a public key to the server's `authorized_keys` file to enable password-less SSH login.

---

## Running the Playbook

To execute the playbook, run the following command:

```bash
ansible-playbook -i inventory.ini setup.yml --ask-become-pass
```

This will run the **base**, **nginx**, **app**, and **ssh** roles in sequence. The `--ask-become-pass` flag prompts you for a password to execute tasks with sudo privileges.

### Running Specific Roles

If you want to run only specific roles, you can use the `--tags` option. For example, to run only the **app** role:

```bash
ansible-playbook -i inventory.ini setup.yml --tags "app"
```

---
