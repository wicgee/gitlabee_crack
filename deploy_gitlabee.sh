docker build -t gitlab-ee:crack .
# export GITLAB_HOME=/gitlab
# mkdir -p $GITLAB_HOME
docker run --detach \
  --hostname gitlab.explorex-ai.com \
  --publish 443:443 --publish 80:80 --publish 2222:22 \
  --name gitlab \
  --restart always \
  --volume $GITLAB_HOME/config:/etc/gitlab \
  --volume $GITLAB_HOME/logs:/var/log/gitlab \
  --volume $GITLAB_HOME/data:/var/opt/gitlab \
  --shm-size 512m \
  gitlab-ee:crack
cat $GITLAB_HOME/config/initial_root_password
