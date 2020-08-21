pipeline {
agent {
    kubernetes {
        defaultContainer 'dind-ubuntu'
      yaml """
apiVersion: v1
kind: Pod
spec:
  containers:
    - name: dind
      image: docker:18.05-dind
      resources:
        limits:
          cpu: 2
        requests:
          cpu: 0.5
          memory: "2000Mi"
      securityContext:
        privileged: true
      volumeMounts:
        - name: dind-storage
          mountPath: /var/lib/docker

    - name: dind-ubuntu
      image: fsedano/dind-ubuntu:3
      resources:
        limits:
          cpu: 2
        requests:
          cpu: 0.5
          memory: "2000Mi"
      env:
      - name: DOCKER_HOST
        value: tcp://localhost:2375
      volumeMounts:
        - name: registrypassword
          mountPath: /root/registrypassword
          readOnly: true
        - name: gitkeys
          mountPath: /root/gitkeys
          readOnly: true
      command: ["/bin/bash", "-c", "sleep 99999"]
  volumes:
    - name: dind-storage
      emptyDir: {}
    - name: registrypassword
      secret:
        secretName: registrypassword
        defaultMode: 256
    - name: gitkeys
      secret:
        secretName: gitkeys
        defaultMode: 256

"""
    }
}


    stages {
        stage('Build') {
            steps {
                sh 'GIT_SSH_COMMAND="ssh -i /root/gitkeys/id_rsa -o IdentitiesOnly=yes -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no"   git clone git@<repo>'
                sh 'cd <repo> && docker build -t <img> .'
                sh 'cat /root/registrypassword/password.txt | docker login registry --username fsedano --password-stdin'
                sh 'docker push <img>'
            }
        }
    }
}
