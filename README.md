---

# Internship Task 2: Basic Firewall Configuration with UFW

## 📌 Objective
The objective of this task is to install and configure **UFW (Uncomplicated Firewall)** on a Linux system to enforce security policies by selectively allowing critical administration traffic (SSH) while blocking non-essential services (HTTP).

## 🛠️ Security Policy & Rules Applied
A secure firewall follows the principle of **Least Privilege**. We configured the firewall using these specifications:

| Service / Port | Action | Purpose / Security Posture |
| :--- | :--- | :--- |
| **Default Incoming** | `DENY` | Hardens the host by dropping all unauthorized inbound packets. |
| **Default Outgoing** | `ALLOW` | Permits system updates, patch management, and external queries. |
| **SSH (Port 22)** | `ALLOW` | Preserves secure remote management access for administrative tasks. |
| **HTTP (Port 80)** | `DENY` | Explicitly drops unencrypted web traffic to prevent unauthorized access. |

---

## 🔍 Verification & Rules Status

After running the automated bash script, executing `sudo ufw status verbose` displays the active security posture:

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


🎥 Practical Demonstration Video
You can watch the full step-by-step video demonstration of this UFW installation, rule configuration, and status verification here:
👉 [**Click Here to Watch the UFW Firewall Demo Video Walkthrough**](https://drive.google.com/file/d/1PguGxg8Ub_VcKn4dqgd4yFsnhciSo7w1/view?usp=sharing)