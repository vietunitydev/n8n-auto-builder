// Parse RSS và tạo AI summary
const xml2js = require('xml2js');
const parser = new xml2js.Parser();

// Get RSS data from previous node
const rssData = $input.first().json.body;

// Parse XML
const result = await parser.parseStringPromise(rssData);
const items = result.rss.channel[0].item || [];

// Extract top 5 news
const topNews = items.slice(0, 5).map(item => ({
  title: item.title[0],
  description: item.description[0].replace(/<[^>]*>/g, ''), // Remove HTML tags
  link: item.link[0],
  pubDate: item.pubDate[0]
}));

// Create summary for AI
const newsText = topNews.map((news, index) =>
  `${index + 1}. ${news.title}\n   ${news.description}\n   Link: ${news.link}\n`
).join('\n');

// Prepare AI prompt
const aiPrompt = `
Hãy tóm tắt những tin tức công nghệ sau đây thành một bản tin ngắn gọn, dễ hiểu bằng tiếng Việt:

${newsText}

Yêu cầu:
- Tóm tắt thành 3-5 điểm chính
- Mỗi điểm 1-2 câu
- Tone friendly và informative
- Kết thúc với "Chúc bạn ngày mới tốt lành! 🚀"
`;

return [{
  json: {
    newsData: topNews,
    aiPrompt: aiPrompt,
    newsText: newsText
  }
}];