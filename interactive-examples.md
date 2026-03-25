# 🎯 Interactive Workflow Generator Examples

## Example 1: E-commerce Order Notification

**User Request:** "When someone buys from my Shopify store, send me a Slack message with order details"

**AI Response:**
```
📊 ANALYSIS:
Trigger: Shopify webhook (new order)
Process: Extract order data
Output: Slack notification

🔍 SEARCHING NODES:
search_nodes("shopify webhook")
search_nodes("slack")

🏗️ WORKFLOW DESIGN:
[Shopify Webhook] → [Set Variables] → [Slack Message]

⚙️ IMPLEMENTATION:
```

```javascript
// AI would run:
const workflow = {
  name: "Shopify Order Notifications",
  nodes: [
    {
      type: "n8n-nodes-base.webhook",
      name: "Shopify Order Webhook",
      position: [100, 100],
      parameters: {
        path: "shopify-orders",
        httpMethod: "POST"
      }
    },
    {
      type: "n8n-nodes-base.set",
      name: "Format Order Data",
      position: [300, 100],
      parameters: {
        values: {
          "customerName": "={{ $json.customer.first_name }} {{ $json.customer.last_name }}",
          "orderTotal": "={{ $json.total_price }}",
          "orderNumber": "={{ $json.order_number }}"
        }
      }
    },
    {
      type: "n8n-nodes-base.slack",
      name: "Send Slack Alert",
      position: [500, 100],
      parameters: {
        operation: "postMessage",
        channel: "#orders",
        text: "🛒 New Order!\nCustomer: {{ $json.customerName }}\nAmount: ${{ $json.orderTotal }}\nOrder #{{ $json.orderNumber }}"
      }
    }
  ],
  connections: {
    "Shopify Order Webhook": {
      main: [["Format Order Data"]]
    },
    "Format Order Data": {
      main: [["Send Slack Alert"]]
    }
  }
};

n8n_create_workflow(workflow);
```

```
❓ NEED FROM YOU:
- Slack workspace credentials
- Which Slack channel to post to?

✅ NEXT STEPS:
1. Set up Slack credentials in n8n
2. Configure Shopify webhook URL: [provided URL]
3. Test with a sample order
```

---

## Example 2: Content Automation

**User Request:** "Schedule a daily Instagram post with motivational quotes"

**AI Response:**
```
📊 ANALYSIS:
Trigger: Daily schedule (e.g., 9 AM)
Process: Get random quote + Generate image
Output: Instagram post

🔍 SEARCHING NODES:
search_nodes("schedule trigger")
search_nodes("instagram")
search_nodes("quote API")

🏗️ WORKFLOW DESIGN:
[Schedule] → [Get Quote API] → [Image Generation] → [Instagram Post]

⚙️ IMPLEMENTATION:
```

```javascript
const workflow = {
  name: "Daily Motivational Instagram Posts",
  nodes: [
    {
      type: "n8n-nodes-base.scheduleTrigger",
      name: "Daily 9AM Trigger",
      parameters: {
        rule: {
          interval: [{
            field: "hour",
            hour: 9
          }]
        }
      }
    },
    {
      type: "n8n-nodes-base.httpRequest",
      name: "Get Random Quote",
      parameters: {
        url: "https://api.quotable.io/random",
        method: "GET"
      }
    },
    // ... more nodes for image generation and Instagram posting
  ]
};
```

```
❓ NEED FROM YOU:
- Instagram business account credentials
- Preferred quote style/theme?
- Image style preferences?

✅ AUTO-CREATED FOR YOU:
- Complete workflow with error handling
- Webhook URL for testing
- Monitoring dashboard access
```

---

## Example 3: Data Sync Automation

**User Request:** "Sync new Airtable records to Google Sheets every hour"

```
📊 ANALYSIS:
Trigger: Hourly schedule
Source: Airtable API (new records)
Process: Transform data format
Output: Append to Google Sheets

🔍 NODE SEARCH RESULTS:
✅ Found: Airtable node (read records)
✅ Found: Google Sheets node (append row)
✅ Found: Schedule Trigger node

🏗️ WORKFLOW:
[Hourly Trigger] → [Airtable: Get Records] → [Filter New] → [Transform Data] → [Google Sheets: Append]

⚙️ CREATING NOW...
```

*AI automatically creates and deploys workflow*

```
✅ WORKFLOW CREATED!

Name: "Airtable to Sheets Sync"
Webhook: https://your-n8n.com/webhook/airtable-sync
Status: Active (next run in 47 minutes)

❓ SETUP NEEDED:
1. Connect Airtable: [link to credential setup]
2. Connect Google Sheets: [link to OAuth setup]
3. Select source table and sheet

🧪 TEST:
Run manual execution → Check Google Sheets → Verify data

📊 MONITOR:
View execution history: [link]
Error alerts: Enabled via email
```

---

## Using the Prompt

**Copy this to Claude/ChatGPT with n8n-MCP access:**

```
You are an expert n8n automation builder. When I describe what I want to automate:

1. Analyze requirements → Ask only critical missing details
2. Search n8n nodes → Use search_nodes() and get_node_info()
3. Design workflow → Show clear step-by-step flow
4. Implement → Use n8n_create_workflow() to build it
5. Test & Deploy → Provide testing steps and monitoring

Format responses like the examples above with Analysis, Search, Design, Implementation, and Next Steps.

Ready! What automation do you want me to build?
```

**Then just describe your automation need!** 🚀
