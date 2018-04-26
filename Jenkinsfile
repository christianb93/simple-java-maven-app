pipeline {
	agent any
	stages {
		stage("prep") {
			steps {
				sh "pwd ; ls -l"
			}
		}
		stage("build") {
			steps {
				sh "mvn clean package"
			}
		}
	}
	post {
		always {
			junit 'target/surefire-reports/*.xml'
		}	
	}
}
