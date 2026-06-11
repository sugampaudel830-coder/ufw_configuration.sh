#!/bin/bash

# ==============================================================================
# Task: Basic Firewall Configuration with UFW
# Objective: Install UFW, configure default rules, allow SSH, deny HTTP, and verify
# ==============================================================================

echo "============ Starting UFW Configuration Script ============"

# 1. Update package list and install UFW
echo -e "\n[*] Updating package repository and installing UFW..."
sudo apt update && sudo apt install ufw -y

# 2. Set Default Firewall Policies
# It is a security best practice to block all incoming traffic and allow outgoing traffic by default.
echo -e "\n[*] Setting default firewall policies (Deny Incoming / Allow Outgoing)..."
sudo ufw default deny incoming
sudo ufw default allow outgoing

# 3. Configure Network Traffic Rules
echo -e "\n[*] Configuring custom traffic rules..."

# Rule A: Allow SSH (Port 22) so we don't lock ourselves out of remote management
sudo ufw allow ssh

# Rule B: Explicitly Deny HTTP (Port 80) traffic as per task objectives
sudo ufw deny http

# 4. Enable the Firewall
# 'echo "y"' automatically answers "yes" to the terminal prompt warning about disrupting SSH connections
echo -e "\n[*] Enabling UFW..."
echo "y" | sudo ufw enable

# 5. Verify Firewall Rules and Operational Status
echo -e "\n============ [Verification] Current UFW Status & Rules ============"
sudo ufw status verbose

echo -e "\n============ Configuration Completed Successfully ============"