pipeline {
	agent any
        environment {
                MY_TEST_ENV = "joe"
        }
	stages {
		stage("prep") {
			steps {
				sh "pwd ; ls -la"
                                sh "env"
				sh "mount"			
			}
		}
		stage("build") {
                        agent {
                                docker {
                                        image 'maven:3-alpine'
                                }
                        }
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
		stage("deploy") {
                        steps {
                                sh "cp Dockerfile target/ ; /usr/bin/docker build -t myapp target/"
                              }
                }
                stage("run") {
                         steps {
                                sh "/usr/bin/docker run -it --rm myapp"
                               }
                }	
	}
        post {
                always {
                        build job: "Pipeline2", wait: false
                }
        }
}
