#!/bin/bash
# Display message for setting up Docker's Apt repository
cat << EOF
==========================================================
||     Set up Docker's Apt repository ...............   ||
==========================================================
EOF

# Set up Docker's Apt repository
# Add Docker's official GPG key
sudo apt-get update -y
sudo apt-get install ca-certificates curl gnupg -y
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Add the repository to Apt sources
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update -y

# Display completion message
cat << EOF
==========================================================
||   Docker's Apt repository setup completed.........    ||
==========================================================
EOF

# Display message for Docker installation
cat << EOF
==========================================================
||   Install the Docker packages....................    ||
==========================================================
EOF

# Install Docker packages
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

# Display installation completion message
cat << EOF
==========================================================
||   Installation is completed....................       ||
==========================================================
EOF

# Check Docker status and version
dockerStatus=$(systemctl status docker | awk '/Active/ {print $3}' | tr -d "[()]")
dockerVersion=$(docker -v | awk '{print $3}' | tr -d ",")

echo "The Docker status is $dockerStatus"
echo "The Docker version is $dockerVersion"
