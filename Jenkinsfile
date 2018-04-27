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
				sh "mvn -DskipTests clean package"
			}
		}
		stage("test") {
			steps {
				sh "mvn test"
			}
			post {
				always {
					junit 'target/surefire-reports/*.xml'
					archiveArtifacts '**/target/*.jar'
				}
			}
		}	
	}
}
