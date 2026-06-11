# Task 2: Basic Firewall Configuration with UFW

## 📌 Objective

The objective of this task is to install and configure **UFW (Uncomplicated Firewall)** on a Linux system to enforce security policies by selectively allowing critical administration traffic (**SSH**) while blocking non-essential services (**HTTP**).

---

## 🛠️ Security Policy & Rules Applied

A secure firewall follows the principle of **Least Privilege**. The firewall was configured using the following specifications:

| Service / Port       | Action  | Purpose / Security Posture                                               |
| -------------------- | ------- | ------------------------------------------------------------------------ |
| **Default Incoming** | `DENY`  | Hardens the host by dropping all unauthorized inbound packets.           |
| **Default Outgoing** | `ALLOW` | Permits system updates, patch management, and external queries.          |
| **SSH (Port 22)**    | `ALLOW` | Preserves secure remote management access for administrative tasks.      |
| **HTTP (Port 80)**   | `DENY`  | Explicitly drops unencrypted web traffic to prevent unauthorized access. |

---

## 🔧 Commands Used

```bash
# Install UFW
sudo apt update
sudo apt install ufw -y

# Set default policies
sudo ufw default deny incoming
sudo ufw default allow outgoing

# Allow SSH
sudo ufw allow 22/tcp

# Deny HTTP
sudo ufw deny 80/tcp

# Enable firewall
sudo ufw enable

# Verify configuration
sudo ufw status verbose
```

---

## 🔍 Verification & Rules Status

After running the configuration commands, executing:

```bash
sudo ufw status verbose
```

produces the following output:

```text
Status: active
Logging: on (low)
Default: deny (incoming), allow (outgoing), disabled (routed)
New profiles: skip

To                         Action      From
--                         ------      ----
22/tcp                     ALLOW IN    Anywhere
80/tcp                     DENY IN     Anywhere
22/tcp (v6)                ALLOW IN    Anywhere (v6)
80/tcp (v6)                DENY IN     Anywhere (v6)
```

This confirms that:

* ✅ Incoming connections are denied by default.
* ✅ Outgoing connections are allowed by default.
* ✅ SSH access on Port 22 is permitted.
* ✅ HTTP traffic on Port 80 is blocked.
* ✅ IPv4 and IPv6 rules are enforced consistently.

---

## 🎥 Practical Demonstration Video

You can watch the full step-by-step video demonstration of the UFW firewall configuration here:

👉 **UFW Firewall Demo Video Walkthrough**
https://drive.google.com/file/d/1PguGxg8Ub_VcKn4dqgd4yFsnhciSo7w1/view?usp=sharing

---

## 📚 Conclusion

The firewall was successfully configured using **UFW** to implement a basic host-based security policy. By denying all incoming traffic by default, allowing only SSH access, and blocking HTTP traffic, the system follows the principle of least privilege and reduces its attack surface while maintaining secure administrative access.
