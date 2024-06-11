const { Router } = require('express');
const { wrapController } = require('../utils/handle');
const { generateContent } = require('../utils/gemini');

const router = Router();
router.post(
    '/',
    wrapController(async (req, res, next) => {
        const prompt = req.body.prompt;
        const text = await generateContent(prompt);
        res.json({
            success: true,
            result: text,
        });
    }),
);
module.exports = router;
