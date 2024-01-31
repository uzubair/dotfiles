# functions

# Let's login
function au() {
    AWS_PROFILE=default aws sso login
}

# Sets the AWS_PROFILE and K8s current context
function st () {
    if [[ $(aws configure --profile $1 list) && $? -eq 0 ]]; then
        echo "\e[92mAssuming AWS profile \"$1\"."
    else
        echo "\e[91mAWS profile \"$1\" does not exist. Exiting."
        return 1
    fi
    AWS_PROFILE=$1 && export AWS_PROFILE

    if [[ "$1" == "qap-dev" ]]; then
        kubectl config use-context legacy-dev
    elif [[ "$1" == "coreip-dev" ]]; then
        kubectl config use-context coreip-dev-2
    elif [[ "$1" == "mio-master" ]]; then
    else
        kubectl config use-context $1
        kubectl config set-context --current --namespace=coresystems
    fi
}

# Resets the following env:
# - AWS Profile
# - K8S current config
function st-() {
    if [[ $(kubectl config unset current-context) && $? -eq 0 ]]; then
        unset AWS_PROFILE
    else
        echo "\e[91mUnable to reset the env. Exiting."
    fi
}

# function kgetall {
#   for i in $(kubectl api-resources --verbs=list --namespaced -o name | grep -v "events.events.k8s.io" | grep -v "events" | sort | uniq); do
#     echo "Resource:" $i
#
#     if [ -z "$1" ]
#     then
#         kubectl get --ignore-not-found ${i}
#     else
#         kubectl -n ${1} get --ignore-not-found ${i}
#     fi
#   done
# }
