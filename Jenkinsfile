node() {
    docker.withRegistry('https://hub.docker.com/r/vmahto/docker-sv-demo/', 'docker-hub-cred') {
    
        git url: "https://github.com/vikramsv/docker-sv-demo.git", credentialsId: 'Github'
    
        sh "git rev-parse HEAD > .git/commit-id"
        def commit_id = readFile('.git/commit-id').trim()
        println commit_id
    
        stage "build"
        def app = docker.build "docker-sv-demo"
    
        stage "publish"
        app.push 'master'
        app.push "${commit_id}"
    }
}
