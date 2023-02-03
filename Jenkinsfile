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
        stage('SAST-Shiftleft') {
            steps {
                 sh 'export SHIFTLEFT_ACCESS_TOKEN=eyJhbGciOiJSUzUxMiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE2NjYwMzM2NDYsImlzcyI6IlNoaWZ0TGVmdCIsIm9yZ0lEIjoiY2FmMjc0MmMtMTZlZi00YTQzLWFlNDItYzM1OGRhZjE5ODNiIiwidXNlcklEIjoiZDFkMGZlZDctOGNjNy00ZTRkLTg5MjMtMzRlMmRmMWRkYWJlIiwic2NvcGVzIjpbInNlYXRzOndyaXRlIiwiZXh0ZW5kZWQiLCJhcGk6djIiLCJ1cGxvYWRzOndyaXRlIiwibG9nOndyaXRlIiwicGlwZWxpbmVzdGF0dXM6cmVhZCIsIm1ldHJpY3M6d3JpdGUiLCJwb2xpY2llczpjdXN0b21lciJdfQ.SfKdw2kimnP52_-VzJCrV_rXKRUctlpigbfCWv5vssMquRmi3PjNLfvIKF40Xn17KleyW4JGdtpz-8TJMmHKrzRVNLdyOIA-UvV7T9jCK3e9m9fNAAzjwSWbRxBEpkhF11Q7-Xm2xH3RPAFSdKZggwFD_P9BtvzTTSanYVQbu2uE4HVJtOoP7XJ_eF_Xkd3zk3pXmXe7SeaB5xYrcrxsid784pirbKx4w2oryB5WnpARZF3l4JD8gphcsAcL_FFz0FyxnqA0s-iv9tBUwoY5oNHvT_H2ailMMWokbRDA-d_zPrLxiCbphM4SjavOD0nkxhfSIJMdzFgCWvPiI5BcQg'
                 sh 'sl auth --org "caf2742c-16ef-4a43-ae42-c358daf1983b" --token "eyJhbGciOiJSUzUxMiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE2NjYwMzM2NDYsImlzcyI6IlNoaWZ0TGVmdCIsIm9yZ0lEIjoiY2FmMjc0MmMtMTZlZi00YTQzLWFlNDItYzM1OGRhZjE5ODNiIiwidXNlcklEIjoiZDFkMGZlZDctOGNjNy00ZTRkLTg5MjMtMzRlMmRmMWRkYWJlIiwic2NvcGVzIjpbInNlYXRzOndyaXRlIiwiZXh0ZW5kZWQiLCJhcGk6djIiLCJ1cGxvYWRzOndyaXRlIiwibG9nOndyaXRlIiwicGlwZWxpbmVzdGF0dXM6cmVhZCIsIm1ldHJpY3M6d3JpdGUiLCJwb2xpY2llczpjdXN0b21lciJdfQ.SfKdw2kimnP52_-VzJCrV_rXKRUctlpigbfCWv5vssMquRmi3PjNLfvIKF40Xn17KleyW4JGdtpz-8TJMmHKrzRVNLdyOIA-UvV7T9jCK3e9m9fNAAzjwSWbRxBEpkhF11Q7-Xm2xH3RPAFSdKZggwFD_P9BtvzTTSanYVQbu2uE4HVJtOoP7XJ_eF_Xkd3zk3pXmXe7SeaB5xYrcrxsid784pirbKx4w2oryB5WnpARZF3l4JD8gphcsAcL_FFz0FyxnqA0s-iv9tBUwoY5oNHvT_H2ailMMWokbRDA-d_zPrLxiCbphM4SjavOD0nkxhfSIJMdzFgCWvPiI5BcQg" --diagnostic'
                 sh '/usr/local/bin/sl analyze --app Student --java target/*.war'
            }    
	}  
        stage('Artifact-Backup') {
            steps {
                sh 'mvn deploy'
            }    
	}  		
    }
}
