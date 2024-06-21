pipeline {
    agent any

    tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven "maven_3.8.5"
    }

    parameters {
      string defaultValue: '@API', description: 'Tags para pruebas ejemplos : @Regresion_01 @Certificacion', name: '@SPY'
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
                bat 'mvn clean test -Dkarate.env=cert "-Dkarate.options=--tags ${name}"'
            }
        }

           stage('Fase: Generar Reporte cucumber') {
                cucumber buildStatus: 'UNSTABLE',
                                reportTitle: 'My report',
                                fileIncludePattern: '**/examples.02-Get.albumSpotify.json',
                                trendsLimit: 10,
                                classifications: [
                                    [
                                        'key': 'Browser',
                                        'value': 'Firefox'
                                    ]
                                ]

                    post {
                                  always {
                                          cucumber buildStatus: 'UNSTABLE',
                                                  failedFeaturesNumber: 1,
                                                  failedScenariosNumber: 1,
                                                  skippedStepsNumber: 1,
                                                  failedStepsNumber: 1,
                                                  classifications: [
                                                          [key: 'Commit', value: '<a href="${GERRIT_CHANGE_URL}">${GERRIT_PATCHSET_REVISION}</a>'],
                                                          [key: 'Submitter', value: '${GERRIT_PATCHSET_UPLOADER_NAME}']
                                                  ],
                                                  reportTitle: 'My report',
                                                  fileIncludePattern: '**/*examples.02-Get.albumSpotify.json',
                                                  sortingMethod: 'ALPHABETICAL',
                                                  trendsLimit: 100
                                      }
                                }

                }

    }

}