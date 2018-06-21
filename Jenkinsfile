import jenkins.model.*
jenkins = Jenkins.instance

node {
    checkout scm
    def customImage = docker.build("ubuntu")
    customImage.push()

    customImage.push('latest')
}
}
