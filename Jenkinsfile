node {
    def app

    stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace */

        checkout scm
    }
	stage ('Java Build') {
    	// build .war package
    	sh 'mvn clean package -U'
  	}
    stage('Build image') {
        /* This builds the actual image; synonymous to
         * docker build on the command line ok*/
		docker.withRegistry('http://127.0.0.1:5001', 'jenkins') {
        	app = docker.build("docker-sv-demo")
        }
    }

    stage('Test image') {
       
        app.inside {
            sh 'echo "Tests passed"+app.id'
        }
    }

    stage('Push image') {
        /* Finally, we'll push the image with two tags:
         * First, the incremental build number from Jenkins
         * Second, the 'latest' tag.
         * Pushing multiple tags is cheap, as all the layers are reused. */
        docker.withRegistry('http://127.0.0.1:5001', 'jenkins') {
             app.push("v3")
        }
        
    stage('Start Container') {
    	/* Post Build Action */
    	sh 'sh Dockerscript.sh $app.id'
    }
  }
}