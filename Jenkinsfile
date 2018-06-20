node() {
    	sudo docker.withRegistry('http://127.0.0.1:4243', 'node') {
    
        git url: "https://github.com/vikramsv/docker-sv-demo.git", credentialsId: 'Github'
    
        sh "git rev-parse HEAD > .git/commit-id"
        def commit_id = readFile('.git/commit-id').trim()
        println got commit_id 
     
        stage "build"
        def app = sudo docker.build "docker-sv-demo"
    
        stage "publish"
        app.push 'master'
        app.push "${commit_id}"
    }
}
