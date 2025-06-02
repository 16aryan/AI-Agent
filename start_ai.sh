uvicorn main:app --reload &
SERVER_PID=$!
sleep 3  # Wait for server to start

while true; do
  read -p "Ask something (type 'exit' to quit): " USER_QUERY
  if [[ "$USER_QUERY" == "exit" ]]; then
    kill $SERVER_PID
    echo "Server stopped. Goodbye!"
    break
  fi

  curl -s -X POST http://127.0.0.1:8000/chat \
    -H "Content-Type: application/json" \
    -d "{\"query\": \"$USER_QUERY\"}"
    
  echo -e "\n---"
done