pipeline {
	agent {
		docker {
			image 'maven:3-alpine'
			args '-v /var/lib/jenkins/.m2:/root/.m2'
		}
	}
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
				sh "mvn cobertura:cobertura"
			}
			post {
				always {
					junit 'target/surefire-reports/*.xml'
					cobertura coberturaReportFile: 'target/site/cobertura/coverage.xml'
					archiveArtifacts '**/target/*.jar'
				}
			}
		}	
	}
        post {
                always {
                        build job: "Pipeline2", wait: false
                }
        }
}
