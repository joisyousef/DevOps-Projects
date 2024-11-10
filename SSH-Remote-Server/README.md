---

## **Project: Basic Linux Server Setup with SSH Key Authentication**

### **Objective**
Set up a remote Linux server, configure SSH key-based authentication, and enhance security with `fail2ban` as a stretch goal.

### **Requirements**

1. **Create a Remote Linux Server**
   - Register on a cloud provider (DigitalOcean, AWS, etc.).
   - Follow their instructions to set up a new Linux server. Take note of the server's IP address and your initial credentials.

2. **Generate SSH Key Pairs**
   - Generate two SSH key pairs on your local machine:
     ```bash
     ssh-keygen -t rsa -b 4096 -C "your_email@example.com" -f ~/.ssh/key1
     ssh-keygen -t rsa -b 4096 -C "your_email@example.com" -f ~/.ssh/key2
     ```
   - This will create two key pairs: `key1` and `key2`, each with a public (`key1.pub`, `key2.pub`) and private key.

3. **Add SSH Keys to Server**
   - Log in to your server using its initial credentials:
     ```bash
     ssh root@<server-ip>
     ```
   - Create an `authorized_keys` file for your SSH user:
     ```bash
     mkdir -p ~/.ssh
     touch ~/.ssh/authorized_keys
     chmod 700 ~/.ssh
     chmod 600 ~/.ssh/authorized_keys
     ```
   - Add the public keys (`key1.pub` and `key2.pub`) to `~/.ssh/authorized_keys`:
     ```bash
     cat ~/.ssh/key1.pub >> ~/.ssh/authorized_keys
     cat ~/.ssh/key2.pub >> ~/.ssh/authorized_keys
     ```
   - Ensure permissions are correctly set on your `~/.ssh` directory and `authorized_keys` file.

4. **Connect to Your Server Using SSH Keys**
   - Test the connection for each key:
     ```bash
     ssh -i ~/.ssh/key1 user@<server-ip>
     ssh -i ~/.ssh/key2 user@<server-ip>
     ```

5. **Configure SSH Alias in `~/.ssh/config`**
   - Set up an SSH alias to simplify the connection:
     ```bash
     nano ~/.ssh/config
     ```
   - Add the following lines to configure aliases for each key:
     ```bash
     Host server-key1
         HostName <server-ip>
         User user
         IdentityFile ~/.ssh/key1

     Host server-key2
         HostName <server-ip>
         User user
         IdentityFile ~/.ssh/key2
     ```
   - Now you can connect to the server using:
     ```bash
     ssh server-key1
     ssh server-key2
     ```

### **Stretch Goal: Install and Configure `fail2ban`**
1. **Install `fail2ban` on the Server**
   ```bash
   sudo apt update
   sudo apt install fail2ban -y
   ```

2. **Configure `fail2ban` for SSH**
   - Create a local configuration file:
     ```bash
     sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local
     ```
   - Edit the file to enable SSH protection:
     ```bash
     sudo nano /etc/fail2ban/jail.local
     ```
   - Update the `[sshd]` section:
     ```bash
     [sshd]
     enabled = true
     port = ssh
     maxretry = 5
     bantime = 1h
     ```

3. **Start and Enable `fail2ban`**
   ```bash
   sudo systemctl start fail2ban
   sudo systemctl enable fail2ban
   ```
   - Verify `fail2ban` is running:
     ```bash
     sudo fail2ban-client status
     sudo fail2ban-client status sshd
     ```

### **Security Reminder**
- Never share or push your private SSH keys to any repository.
- Keep your server and SSH keys secure.

---
