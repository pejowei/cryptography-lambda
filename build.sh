CRYPTOGRAPHY_VERSION=2.6.1
DEST_PY36=python-3.6/cryptography

indent() { sed 's/^/    /'; }


rm -rf $DEST_PY36
mkdir -p $DEST_PY36

docker build --tag=cryptography-py36 \
             --build-arg cryptography_version=$CRYPTOGRAPHY_VERSION \
             --no-cache \
             -f Dockerfile-py36 . | indent

# Get py36 versions
id=$(docker create cryptography-py36)

docker cp $id:/app/cryptography-py36/cryptography/. $DEST_PY36 | indent
# docker cp $id:/app/cryptography-py36/lib/. $DEST_PY36 | indent

docker rm -v $id | indent