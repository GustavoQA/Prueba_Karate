pipeline {
    agent any

    tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven "maven_3.8.5"
    }

  parameters {
       string defaultValue: '@SPY', description: 'Tags para pruebas ejemplos : @Regresion_01 @Certificacion', name: 'name'
     }

    stages {
        stage('Checkout from GitHub'){
        steps{
         println('********Checking out from GitHub repository********')
        checkout scm
         println('********Checking out from GitHub repository COMPLETED ********')
     // Get some code from a GitHub repository
       // git branch: 'master',
       // credentialsId: 'GustavoQA',
       // url: 'https://github.com/GustavoQA/restAssuredToken.git'
         }


    }
    stage('Fase: Realizando el Build'){
    steps{
         bat 'mvn clean package -DskipTests'
    }
   }
    stage('Fase: Compilar codigo'){
           steps{
                bat 'mvn clean compile'
           }
       }
        stage(' Fase: Ejecutar Pruebas Automatizadas Cucumber') {
            steps {

                // Run Maven on a Unix agent.
                //sh "mvn -Dmaven.test.failure.ignore=true clean package"

                // To run Maven on a Windows agent, use
                bat 'mvn clean test -Dkarate.env=cert "-Dkarate.options=--tags @SPY"'
            }
        }

             stage('Fase: Generar Reporte cucumber') {
                      steps {
                          cucumber buildStatus: "UNSTABLE",
                                  fileIncludePattern: '**/cucumber.json',
                                  jsonReportDirectory: 'target'
                      }

                      post {
                                      // If Maven was able to run the tests, even if some of the test
                                      // failed, record the test results and archive the jar file.
                                      success {
                                          junit '**/target/surefire-reports/TEST-*.xml'
                                          archiveArtifacts 'target/*.jar'
                                      }
                                  }
                  }
      }

  }