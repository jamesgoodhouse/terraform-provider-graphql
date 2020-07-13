GO111MODULE=on
cd gql-server
(go get && go run server.go &)
cd ..
go test -i
go test

exit_status=$?

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

if [ $exit_status -ne 0 ]; then
  $exit_status=1
  echo -e $"\n${RED}SOME TESTS FAILED${NC}\n"
else
  echo -e $"\n${GREEN}ALL TESTS WERE SUCCESSFUL${NC}\n"
fi

echo "Stopping graphql test server"
kill $(lsof -t -i:8080)

exit $exit_status