#  Readme

## Generate your token

curl -X POST "https://accounts.spotify.com/api/token" -H "Content-Type: application/x-www-form-urlencoded" -d "grant_type=client_credentials&client_id=client_id&client_secret=client_secret"

## Update the Authorization Token

Replace {{API_KEY}} with your API Key.

Modify the SpotifyService.swift with your Authorization token

