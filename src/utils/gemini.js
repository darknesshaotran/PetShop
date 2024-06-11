const dotenv = require('dotenv');
dotenv.config();
const { GoogleGenerativeAI } = require('@google/generative-ai');

const genAI = new GoogleGenerativeAI(process.env.GEMINI_API_KEY);
const model = genAI.getGenerativeModel({ model: 'gemini-1.5-flash' });

const generateContent = async (prompt) => {
    const result = await model.generateContent(prompt);
    const response = result.response;
    const text = response.text();
    return text;
};
exports.generateContent = generateContent;
