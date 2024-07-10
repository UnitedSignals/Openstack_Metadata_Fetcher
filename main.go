package main

import (
	"encoding/json"
	"fmt"
	"io/ioutil"
	"net/http"
	"os"
)

func main() {
	args := os.Args[1:]

	if len(args) == 0 {
		fmt.Println("Usage: meta <key>")
		return
	}

	if len(args) > 1 {
		fmt.Println("Error: Only one argument is allowed")
		return
	}

	key := args[0]
	url := "http://169.254.169.254/openstack/latest/meta_data.json"

	resp, err := http.Get(url)
	if err != nil {
		fmt.Println("Error fetching URL:", err)
		return
	}
	defer resp.Body.Close()

	if resp.StatusCode != http.StatusOK {
		fmt.Printf("Error: Received status code %d\n", resp.StatusCode)
		return
	}

	body, err := ioutil.ReadAll(resp.Body)
	if err != nil {
		fmt.Println("Error reading response body:", err)
		return
	}

	var data map[string]interface{}
	if err := json.Unmarshal(body, &data); err != nil {
		fmt.Println("Error parsing JSON:", err)
		return
	}

	meta, exists := data["meta"].(map[string]interface{})
	if !exists {
		fmt.Println("Key 'meta' not found in the JSON data")
		return
	}

	value, exists := meta[key]
	if !exists {
		fmt.Printf("Key '%s' not found in the 'meta' data\n", key)
		return
	}

	fmt.Printf("%v", value)
}
