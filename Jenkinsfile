pipeline {
    agent any
    stages { 
	    stage('clone') {
            steps {
                git credentialsId: '698b071f-f3db-482d-9f24-2f3f13e94558', url: 'https://github.com/gopichandperugu/student.git'
            }    
	}
	stage('secrets-scan') {
            steps {
                sh 'docker ps -aq'
		  sh 'docker run gesellix/trufflehog --json https://github.com/gopichandperugu/Studentapp.git'
            }    
	}
        stage('mvn-clean') {
            steps {
               sh 'mvn clean'
            }    
	}  
        stage('compile') {
            steps {
              sh 'mvn compile' 
            }    
	} 
       /* stage('sonar(unit-test(code-coverage,code-security))') {
            steps {
                sh 'mvn sonar:sonar -Dsonar.java.source=11 -Dsonar.projectKey=student -Dsonar.host.url=http://13.231.120.140:9000 -Dsonar.login=f3846fe925d361b5e79283cc85875c821f305dd5'
            } 
	}*/
        stage('mvn-package') {
            steps {
                 sh 'mvn package'
            }    
	}
	stage('SAST-SemGrep') {
            steps {
                 sh 'semgrep ci'
            }    
	} 
        /*stage('SAST-Snyk') {
            steps {
                 snykSecurity (snykInstallation: 'Snyk@latest', snykTokenId: 'Snyk-jenkins')
            }    
	}*/  
        stage('Artifact-Backup') {
            steps {
                sh 'mvn deploy'
            }    
	}
        /*stage('Tomcat-Deployment') {
            steps {
                 deploy adapters: [tomcat8(credentialsId: '5bb48bde-ea2e-4ba6-9305-889c968c247f', path: '', url: 'http://20.245.110.131:8080/')], contextPath: 'Tomcat', war: '***.war' 
	    }
	}*/  
    }
}
