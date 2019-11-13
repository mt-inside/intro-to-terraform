declare -r here="$(dirname "$(pwd -P)/${BASH_SOURCE[0]}")"
roots="../deployments/intro-to-terraform"

for d in $roots
do
    pushd $d

    terraform validate .

    tflint .
    echo "tflint: $?"

    #conftest test . -p $here/policy

    popd
done
