# Gmail Billing Email Collector

Search Gmail for billing emails from known services since $SINCE_DATE and output a JSON array.

## Step 1: Search Gmail

Search for billing emails using this query:
```
from:(invoice+statements@mail.anthropic.com OR payments-noreply@google.com OR support@rapidapi.com OR billing@vercel.com OR billing@supabase.com OR billing@github.com OR billing@cloudflare.com OR billing@perplexity.ai OR billing@mistral.ai OR billing@jina.ai OR support@signnow.com) after:$SINCE_DATE_GMAIL -subject:unsuccessful -subject:"wasn't able" -subject:"not able"
```

## Step 2: Read each message body

For each message found, read the full body using gmail_read_message.

## Step 3: Output JSON ONLY

Write ONLY a JSON array to stdout — no prose, no explanation, no markdown. Format:

```json
[
  {
    "messageId": "...",
    "fromAddress": "full from address",
    "subject": "...",
    "body": "relevant body text containing the amount and currency",
    "date": "YYYY-MM-DD"
  }
]
```

Rules:
- Skip failed-payment emails (subject contains "unsuccessful", "wasn't able", "failed")
- date = the email date (YYYY-MM-DD)  
- body = include only the text containing the amount (e.g. "Amount paid $54.50" or "Your payment of SGD 132.71")
- If no billing emails found, output: []
- Output ONLY the JSON array. No other text.
