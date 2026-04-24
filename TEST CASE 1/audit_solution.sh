#!/bin/bash

# Test Case 1 Solution — Linux System Audit & User Management
# Scenario: Linux system administrator onboarding Pranay, Ritu, and Karan.

echo "--- 1. Checking Identity ---"
whoami
echo ""

echo "--- 2. Logged-in Users ---"
w
echo ""

echo "--- 3. Login History ---"
last -n 5
echo ""

echo "--- 4. System Information ---"
echo "Hostname: $(hostname)"
echo "Uptime: $(uptime)"
uname -a
echo ""

echo "--- 5. Group Management ---"
sudo groupadd developers 2>/dev/null || echo "Group 'developers' already exists"
sudo groupadd qa 2>/dev/null || echo "Group 'qa' already exists"
echo "Groups list:"
cut -d: -f1 /etc/group | grep -E "developers|qa"
echo ""

echo "--- 6. User Creation ---"
# Creating Pranay (replacing Aman), Ritu, and Karan
users=("pranay" "ritu" "karan")
groups=("developers" "developers" "qa")

for i in "${!users[@]}"; do
    user="${users[$i]}"
    group="${groups[$i]}"
    if id "$user" &>/dev/null; then
        echo "User '$user' already exists."
    else
        sudo useradd -m -g "$group" "$user"
        echo "Created user '$user' in group '$group'."
    fi
done
echo ""

echo "--- 7. User Resignation (Ritu) ---"
echo "Ensuring no active sessions for 'ritu'..."
sudo pkill -u ritu || echo "No active sessions for ritu."

echo "Deleting 'ritu' and her home directory..."
sudo userdel -r ritu

echo "Verifying 'ritu' no longer exists:"
id ritu || echo "Success: ritu returns 'no such user'."

echo ""
echo "--- Verification ---"
echo "Checking Pranay:"
id pranay
echo "Checking Karan:"
id karan
