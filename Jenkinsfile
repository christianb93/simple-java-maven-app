pipeline {
	agent any
        environment {
                MY_TEST_ENV = "joe"
        }
	stages {
		stage("prep") {
			steps {
				sh "pwd ; ls -l"
                                sh "env"
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
        post {
                always {
                        build job: "Pipeline" wait: false
                }
        }
}
