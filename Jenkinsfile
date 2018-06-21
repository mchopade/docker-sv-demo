import jenkins.model.*
jenkins = Jenkins.instance
node {
    	docker.withRegistry('http://127.0.0.1:5001', 'jenkins') {
    
        git url: "https://github.com/vikramsv/docker-sv-demo.git", credentialsId: 'Github'
    
        sh "git rev-parse HEAD > .git/commit-id"
        def commit_id = readFile('.git/commit-id').trim()
        echo "I said, Hello Mr. ${commit_id}"
    } 
}
