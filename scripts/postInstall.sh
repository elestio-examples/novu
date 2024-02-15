#set env vars
set -o allexport; source .env; set +o allexport;

#wait until the server is ready
echo "Waiting for software to be ready ..."
sleep 120s;

target=$(docker-compose port api 3000)


curl http://${target}/v1/auth/register \
  -H 'accept: application/json, text/plain, */*' \
  -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7,he;q=0.6' \
  -H 'cache-control: no-cache' \
  -H 'content-type: application/json' \
  -H 'pragma: no-cache' \
  -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36' \
  --data-raw '{"firstName":"admin","lastName":"admin","email":"'${ADMIN_EMAIL}'","password":"'${ADMIN_PASSWORD}'"}' \
  --compressed

docker-compose exec -T localstack bash -c "awslocal s3api create-bucket --bucket novu"



# curl 'https://novusdswf-u353.vm.elestio.app:6443/v1/auth/register' \
#   -H 'authority: novusdswf-u353.vm.elestio.app:6443' \
#   -H 'accept: application/json, text/plain, */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7,he;q=0.6,zh-CN;q=0.5,zh;q=0.4,ja;q=0.3' \
#   -H 'cache-control: no-cache' \
#   -H 'content-type: application/json' \
#   -H 'origin: https://novusdswf-u353.vm.elestio.app' \
#   -H 'pragma: no-cache' \
#   -H 'referer: https://novusdswf-u353.vm.elestio.app/' \
#   -H 'sec-ch-ua: "Not A(Brand";v="99", "Google Chrome";v="121", "Chromium";v="121"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-site' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36' \
#   --data-raw '{"firstName":"jojo","lastName":"jojo","email":"amsellem.joseph@gmail.com","password":"sCmQuhWC-fN0O-71q2j1Uq"}' \
#   --compressed