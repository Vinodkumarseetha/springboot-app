                    output=$(aws ecr describe-repositories --repository-names sample-repo-3 2>&1) 
                    if [ $? -ne 0 ]; then
                      if echo ${output} | grep -q RepositoryNotFoundException; then
                        aws ecr create-repository --repository-name sample-repo-3
                      else
                        >&2 echo ${output}
                      fi
                    fi
