pipeline {
    agent any

    tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven "maven_3.8.5"
    }

  parameters {
   choice(
             name: 'Ambiente',
             choices: ['cert', 'dev'],
             description: 'Seleccione el Ambiente de entono para realizar las pruebas'
          )
          string(
              name: 'karateTags',
              defaultValue: '',  // Optional default tag
              description: 'para ejecutar multiples tags ejemplo: @smoke,@regression)',
              trim: true
          )
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
               script{
               bat """mvn clean test -Dkarate.env=${params.Ambiente} "-Dkarate.options=--tags ${params.karateTags}" """

               }
                // To run Maven on a Windows agent, use
               // bat 'mvn clean test -Dkarate.env=cert "-Dkarate.options=--tags @SPY"'
            }
        }

             stage('Fase: Generar Reporte cucumber') {
                      steps {
                           cucumber buildStatus: "UNSTABLE",
                                          fileIncludePattern: "**/*.json",
                                          jsonReportDirectory: "target/karate-reports"
                      }


                  }
      }

  }