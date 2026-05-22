# SKILL: Daily Tech Brief and Quiz Generation

## GOAL
Your goal is to generate a high-quality, personalized daily tech brief for a user and send it via Telegram. The brief must contain exactly 5 interview questions and 3-5 technical tidbits tailored to the user's stored preferences.

## CONTEXT
This skill is triggered automatically by a cron job every evening at 9 PM in the user's local timezone. You will be provided with the user's ID.

## GENERATION WORKFLOW
1.  **Retrieve User Profile:** Use the `memory_store` (or `memory`) tool to fetch the user's profile using their ID (e.g., key `user_profile_{{user.id}}`). All subsequent steps must be tailored to this profile.
2.  **Conduct Web Search:** Perform a `web_search` for each of the user's specified `domains`. The search query should be focused on recent news, tutorials, or deep-dive articles. For example: `"latest Go programming language performance tips"` or `"distributed systems design patterns 2024"`. Use a freshness parameter to prioritize recent, high-quality, and fresh content.
3.  **Synthesize Tidbits:** Based on the search results, synthesize 3 to 5 interesting technical tidbits. A tidbit is a short, insightful fact, pattern, or piece of news. They should be genuinely useful, fresh, and not just generic definitions.
4.  **Generate Interview Questions:** Generate exactly 5 interview questions. The questions must adhere to the following criteria:
    *   **Relevance:** They must relate to the user's `domains`.
    *   **Difficulty:** They must be appropriate for the user's `level` (e.g., no complex system design questions for a junior, and challenging conceptual/architecture questions for a senior).
    *   **Variety:** Include a mix of question types: conceptual, coding/algorithmic, system design, and behavioral.
    *   **Novelty:** Do not ask the same questions every day. Use memory if available to check previously generated questions to ensure variety.
5.  **Format the Message:** Assemble the final message using Telegram's Markdown formatting. The message must follow this exact structure:

    ```
    🦞 *Your Daily Tech Brief* — [Date]

    ━━━━━━━━━━━━━━━━━━━━
    🧠 *Interview Questions*
    ━━━━━━━━━━━━━━━━━━━━

    *Q1 [Type — Domain]*
    [Question 1 Text]

    *Q2 [Type — Domain]*
    [Question 2 Text]

    *Q3 [Type — Domain]*
    [Question 3 Text]

    *Q4 [Type — Domain]*
    [Question 4 Text]

    *Q5 [Type — Domain]*
    [Question 5 Text]

    ━━━━━━━━━━━━━━━━━━━━
    💡 *Today's Tidbits*
    ━━━━━━━━━━━━━━━━━━━━

    • [Tidbit 1]

    • [Tidbit 2]

    • [Tidbit 3]

    ━━━━━━━━━━━━━━━━━━━━
    Reply *answers* to get feedback, or *more* for extra questions.
    ```

## CONSTRAINTS
- The quality of the questions and tidbits is paramount. They must be accurate, relevant, and insightful.
- The message must be formatted correctly for readability on a mobile device.
- You must output exactly 5 questions and between 3 to 5 tidbits.
- The entire process must be autonomous. Do not ask for clarification.
