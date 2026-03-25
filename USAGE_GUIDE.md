## 🎯 Cách Sử Dụng Prompt Tự Động Tạo Workflow

### 📋 **Files Đã Tạo:**

1. **`FINAL_PROMPT.md`** → 📝 **Copy ngay để dùng**
2. **`interactive-examples.md`** → 📚 **Xem ví dụ chi tiết**
3. **`simple-workflow-prompt.md`** → 🚀 **Prompt đơn giản**
4. **`n8n-auto-workflow-prompt.md`** → 📖 **Hướng dẫn đầy đủ**

### 🔥 **Cách Sử Dụng:**

#### **Bước 1: Copy Prompt**
```bash
# Mở file và copy nội dung
cat FINAL_PROMPT.md
```

#### **Bước 2: Dán vào AI Assistant có n8n-MCP**
- **Claude Desktop** (nếu đã config n8n-MCP)
- **ChatGPT với plugin**
- **Hoặc AI khác có access n8n-MCP**

#### **Bước 3: Nói Workflow Bạn Muốn**
```
Ví dụ:
"Tôi muốn tự động gửi email báo cáo doanh thu hàng tuần"
"Tự động post tin tức lên Facebook khi có bài blog mới"
"Backup database lên Google Drive mỗi đêm"
```

#### **Bước 4: AI Sẽ:**
✅ **Phân tích** yêu cầu của bạn
✅ **Tìm kiếm** nodes phù hợp trong n8n
✅ **Thiết kế** workflow layout
✅ **Tạo thực tế** workflow trong n8n
✅ **Hỏi thông tin** bổ sung nếu cần (API keys, etc.)

### 💡 **Tips Để Có Kết Quả Tốt:**

#### **✅ Mô Tả Rõ Ràng:**
```
❌ Không tốt: "Tôi muốn automation"
✅ Tốt: "Khi có order mới trong Shopify, gửi notification vào Slack"
```

#### **✅ Cung Cấp Context:**
```
❌ Không đủ: "Gửi email báo cáo"
✅ Đầy đủ: "Gửi email báo cáo doanh thu hàng tuần vào thứ 2 lúc 9h sáng"
```

#### **✅ Nói Rõ Nguồn & Đích:**
```
❌ Không rõ: "Sync data"
✅ Rõ ràng: "Sync customer data từ CRM sang Google Sheets"
```

### 🛠️ **Khi AI Hỏi Thêm Thông Tin:**

AI chỉ hỏi khi **thực sự cần thiết:**

#### **🔑 Credentials:**
```
AI: "Cần API key của Slack để kết nối. Bạn có thể tạo tại slack.com/apps"
Bạn: "Đây là key: xoxb-xxxxx" hoặc "Tôi sẽ setup sau"
```

#### **⏰ Timing:**
```
AI: "Bạn muốn chạy lúc nào? (hàng giờ/ngày/tuần)"
Bạn: "Mỗi ngày lúc 8h sáng"
```

#### **📊 Data Format:**
```
AI: "Bạn muốn output dạng nào? (JSON/CSV/Email format)"
Bạn: "Gửi email với table HTML"
```

### 📈 **Workflow AI Có Thể Tao:**

#### **🔄 Data Sync:**
- CRM ↔ Accounting software
- Database ↔ Google Sheets
- API ↔ Local files

#### **📢 Notifications:**
- Order alerts → Slack/Email
- System monitoring → SMS
- Price changes → Telegram

#### **🤖 AI Processing:**
- Text summarization
- Image generation
- Content translation
- Sentiment analysis

#### **📅 Scheduling:**
- Report generation
- Data backups
- Social media posts
- Inventory checks

#### **🌐 Web Automation:**
- Form submissions → Database
- Website monitoring
- Content scraping
- API integrations

### 🎯 **Ví Dụ Hoàn Chỉnh:**

**Bạn nói:**
```
"Tôi có website bán hàng. Muốn khi có khách đặt hàng thì tự động:
1. Gửi email xác nhận cho khách
2. Thông báo qua Telegram cho tôi
3. Cập nhật vào Google Sheets để theo dõi"
```

**AI sẽ:**
```
🎯 ANALYSIS:
Trigger: Website webhook
Process: Extract order data, format messages
Output: Email + Telegram + Google Sheets

🔍 SEARCHING:
[Uses search_nodes() to find webhook, email, telegram, sheets nodes]

🏗️ DESIGN:
[Webhook] → [Extract Data] → [Send Email]
                          → [Send Telegram]
                          → [Update Sheets]

⚙️ IMPLEMENTATION:
[Creates complete workflow with all configs]

❓ NEED:
- Gmail credentials
- Telegram bot token
- Google Sheets access

✅ CREATED:
- Webhook URL: https://your-n8n.com/webhook/new-order
- Test instructions
- Monitoring dashboard
```

### 🚀 **Kết Quả:**

Sau 5-10 phút, bạn có **workflow hoàn chỉnh, tested, và ready to use**!

---

**Ready? Copy `FINAL_PROMPT.md` và bắt đầu tạo workflows! 🎊**