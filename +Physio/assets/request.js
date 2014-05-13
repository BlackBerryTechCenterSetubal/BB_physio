 function sendRequest() {
                console.log("DEBUG: sending request");
                var request = new XMLHttpRequest();
                request.onreadystatechange = function() {
                    // Need to wait for the DONE state or you'll get errors
                    if (request.readyState === XMLHttpRequest.DONE) {
                        if (request.status === 200) {
                            // if response is JSON you can parse it
                            var response = JSON.parse(request.responseText);

                                theDataModel.append({
                                    "offer_id": response.result.offer_id,
                                    "member_id": response.result.member_id,
                                    "offer_type": response.result.offer_type
                                });
                            }

                    } else {
                            // Error
                            console.log("DEBUG: Status: " + request.status + ", Status Text: " + request.statusText);                       
                    }
                }
                // POST/GET request
                request.open("GET", "http://www.example.com/json.php", true); 
                request.setRequestHeader("Accept", "application/json");
                request.send();
            }