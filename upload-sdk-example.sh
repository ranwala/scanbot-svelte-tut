DIR=$1
if [ -z "$DIR" ]
    then
        echo "Please specify the project folder!"
        exit 1
elif [ ! -d "$DIR" ]
    then
        echo "Project folder does not exist!"
        exit 1
fi

TARGET=$2

if [ -z "$TARGET" ]
    then
        aws s3 sync $DIR s3://scanbotsdk-qa-4 --delete

        echo published to: https://scanbotsdk-qa-4.s3-eu-west-1.amazonaws.com/index.html
elif [ "$TARGET" = "private_demo" ]
    then
        aws s3 sync $DIR s3://scanbotsdk-websdk-demo-internal/ --delete
        aws cloudfront create-invalidation --distribution-id E32K4Y2GB6FVA2 --paths '/*'

        echo published to: https://websdk-demo-internal.scanbot.io/
fi
