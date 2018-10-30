node{
    stage('get source code'){
        
        git 'https://github.com/Dasharathgoswami/test.com'
    }
    
    stage('Build docker image'){
      /* This builds the actual image; synonymous to
         * docker build on the command line */

    app = docker.build("427413154210.dkr.ecr.us-east-1.amazonaws.com/my-web-app:latest")
    }

    stage('Push image') {
        /* Finally, we'll push the image with two tags:
         * First, the incremental build number from Jenkins
         * Second, the 'latest' tag.
         * Pushing multiple tags is cheap, as all the layers are reused. */
        
        docker.withRegistry('https://427413154210.dkr.ecr.us-east-1.amazonaws.com/my-web-app','ecr:us-east-1:aws-ecr'){
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
        }
    }
    stage('mail notification'){
        mail bcc: '', body: '''Hello Developer this is mail from Jenkins.

    Build is succeed..!   ''', cc: '', from: '', replyTo: '', subject: 'Jenkins Build Success  ', to: 'dashrath@zaptechsolutions.com'

    }
}



