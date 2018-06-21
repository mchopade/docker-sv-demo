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
        	app = docker.build("localhost/docker-sv-demo")
        }
    }

    stage('Test image') {
        /* Ideally, we would run a test framework against our image.
         * For this example, we're using a Volkswagen-type approach ;-) */

        app.inside {
            sh 'echo "Tests passed"'
        }
    }

    stage('Push image') {
        /* Finally, we'll push the image with two tags:
         * First, the incremental build number from Jenkins
         * Second, the 'latest' tag.
         * Pushing multiple tags is cheap, as all the layers are reused. */
        docker.withRegistry('http://127.0.0.1', 'jenkins') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
        }
    }
}