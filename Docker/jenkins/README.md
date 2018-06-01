# Jenkins
## Cosas a instalar

Plugins:
- Recommendados
- Theme [Tema](http://afonsof.com/jenkins-material-theme/)
- Blue Ocean
- Docker Pipeline [Doc de jenkins](https://jenkins.io/doc/book/pipeline/docker/)

## Como instalar plugins rapido

[Link](https://github.com/jenkinsci/docker/blob/master/plugins.sh)

[Link2](http://container-solutions.com/running-docker-in-jenkins-in-docker/)
>>>>>>> cfa1a5c385813e2ab0bba814f8097e9558ca69b9

## Pruebas
`docker run --rm -u root -p 8080:8080 -v jenkins-data-test:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock jenkinsci/blueocean`