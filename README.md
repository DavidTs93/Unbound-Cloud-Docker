# Unbound-Cloud-Docker
Run a private Unbound-Cloud via Docker

This runs on your local machine at http://localhost:3000 and uses the ports 3000-3001, 3005, 5000

### Setup
- Install Docker
  - Windows: https://docs.docker.com/desktop/setup/install/windows-install/
  - Linux: https://docs.docker.com/engine/install/
- Install Docker compose
  - Windows: comes with Docker Desktop
  - Linux: https://docs.docker.com/compose/install/linux/#install-using-the-repository
- Open your terminal and run `docker compose version` to make sure everything is ready
- Download the 2 files in this repo and place them together (important!) in some folder, or clone the repo

### How to run
- In your terminal, run the command `docker compose -f <path_to_compose_file> up -d --build`  
Replace "<path_to_compose_file>" with the path to the "docker-compose.yml" file
- Wait about a minute for it to kick up
- That's it! Access your local Unbound-Cloud at http://localhost:3000

### How to turn off
- In your terminal, run the command `docker compose -f <path_to_compose_file> down`
Replace "<path_to_compose_file>" with the path to the "docker-compose.yml" file
