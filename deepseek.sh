#!/bin/bash

# DeepSeek API Key
API_KEY="sk-6414315861f140939369f2b335c69d16"
API_URL="https://api.deepseek.com/chat/completions"

# Function to make API call
deepseek_ask() {
    local query="$1"
    curl -s "$API_URL" \
        -H "Content-Type: application/json" \
        -H "Authorization: Bearer $API_KEY" \
        -d "{
            \"model\": \"deepseek-chat\",
            \"messages\": [
                {\"role\": \"system\", \"content\": \"You are a helpful assistant.\"},
                {\"role\": \"user\", \"content\": \"$query\"}
            ],
            \"stream\": false
        }" | jq -r '.choices[0].message.content'
}

# Function for search-like behavior with more detailed response
deepseek_search() {
    local query="$1"
    curl -s "$API_URL" \
        -H "Content-Type: application/json" \
        -H "Authorization: Bearer $API_KEY" \
        -d "{
            \"model\": \"deepseek-chat\",
            \"messages\": [
                {\"role\": \"system\", \"content\": \"You are a search assistant. Provide detailed information and sources if possible.\"},
                {\"role\": \"user\", \"content\": \"$query\"}
            ],
            \"stream\": false
        }" | jq -r '.choices[0].message.content'
}

# Check if jq is installed
if ! command -v jq &> /dev/null; then
    echo "Error: jq is required. Please install it using 'brew install jq'"
    exit 1
fi

# Command handling
case "$1" in
    "ask")
        if [ -z "$2" ]; then
            echo "Usage: deepseek ask \"your question\""
            exit 1
        fi
        deepseek_ask "$2"
        ;;
    "search")
        if [ -z "$2" ]; then
            echo "Usage: deepseek search \"your search query\""
            exit 1
        fi
        deepseek_search "$2"
        ;;
    *)
        echo "Usage: deepseek [ask|search] \"query\""
        echo "Examples:"
        echo "  deepseek ask \"What is the weather like today?\""
        echo "  deepseek search \"History of artificial intelligence\""
        exit 1
        ;;
esac
