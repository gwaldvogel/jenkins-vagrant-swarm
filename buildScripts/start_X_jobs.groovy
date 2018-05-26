// this job starts a given job x amount of times
node('linux') {
    stage('Init x jobs') {
        start_jobs('test_output', 40) // adapt this line to your needs
    }
}

def start_jobs(j, x) {
    for (int i = 0; i < x; i++) {
        build job: j,
            wait: false,
            parameters: [
                [
                    $class: 'StringParameterValue',
                    name: '_foo',
                    value: String.valueOf(i)
                ]
            ]
    }
}