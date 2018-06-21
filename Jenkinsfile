import jenkins.model.*
jenkins = Jenkins.instance

node {
   
    docker.withRegistry('http://127.0.0.1:5001', 'jenkins') {
    
        git url: "https://github.com/vikramsv/docker-sv-demo.git", credentialsId: 'Github'
         
        echo "git clone done"
        
        def customImage = docker.build("ubuntu")
    	customImage.push()
   		customImage.push('latest')
    } 
}
