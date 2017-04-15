node('docker-slave-04') {
   def mvnHome
   stage('Preparation') { // for display purposes
     git 'https://github.com/inuq/e2e-test.git'
     sh "Xvfb :1 -screen 0 1200x1920x24 &"
     sh "/bin/bash ./preparation.sh 3"
   }
   stage('test') {
     sh returnStatus: true, script: 'export DISPLAY=:1; nightwatch --config ./conf/nightwatch.json --env chrome'  
   }
   stage('Results') {
      junit 'reports/**/CHROME_*.xml'
   }   
}
