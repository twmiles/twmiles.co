docker build . --file resume/Dockerfile --tag latexBuild
docker run --rm -v $(pwd)/resume:/input -v $(pwd)/resume/build:/output latexBuild