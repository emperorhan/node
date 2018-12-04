INIT_ACCOUNT="$( jq -r '.INIT_ACCOUNT' "00_CONFIG.conf" )"
INIT_PUB_KEY="$( jq -r '.INIT_PUB_KEY' "00_CONFIG.conf" )"
INIT_PRIV_KEY="$( jq -r '.INIT_PRIV_KEY' "00_CONFIG.conf" )"

./cleos.sh wallet import --private-key $INIT_PRIV_KEY

./cleos.sh system newaccount --stake-net "1000000.0000 CR" --stake-cpu "1000000.0000 CR" --buy-ram "100.0000 CR" eosio $INIT_ACCOUNT $INIT_PUB_KEY $INIT_PUB_KEY -p eosio

./cleos.sh system newaccount eosio —transfer $INIT_ACCOUNT $INIT_PUB_KEY --stake-net "1000000.0000 CR" --stake-cpu "1000000.0000 CR" --buy-ram "100.0000 CR"
./cleos.sh transfer eosio $INIT_ACCOUNT "10000.0000 CR" "init"
./cleos.sh system delegatebw $INIT_ACCOUNT $INIT_ACCOUNT "1000.0000 CR" "1000.0000 CR"
./cleos.sh system regproducer $INIT_ACCOUNT $INIT_PUB_KEY https://ibct.io/
./cleos.sh system voteproducer prods $INIT_ACCOUNT $INIT_ACCOUNT
./cleos.sh system listproducers
