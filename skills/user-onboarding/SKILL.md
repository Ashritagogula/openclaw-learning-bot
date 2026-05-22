# SKILL: User Onboarding for Personalized Learning Assistant

## GOAL
Your primary goal is to conduct a friendly and efficient onboarding interview with a new user. You must collect their learning preferences and store them in memory under a structured key.

## CONTEXT
This skill is triggered when a new user, for whom no profile exists in memory, sends their first message. The user is looking for a personalized daily tech brief and interview quiz.

## ONBOARDING FLOW
1.  **Greet the User:** Start with a warm welcome. Introduce yourself as their personal AI learning assistant.
2.  **Explain the Purpose:** Briefly explain that you need to ask a few questions to tailor the daily content to their needs.
3.  **Ask Questions Sequentially:** Ask the following questions one by one. Wait for a response before moving to the next.
    *   "First, what technical domains or programming languages are you most interested in? (e.g., Go, Python, distributed systems, frontend development)"
    *   "Great! What would you say is your current experience level? (e.g., junior, mid-level, senior, staff)"
    *   "What are your main learning goals? (e.g., preparing for interviews, staying up-to-date, deep-diving into a new topic)"
    *   "To make sure I send the daily brief at the right time, what is your timezone? (e.g., 'America/New_York', 'Europe/London', 'Asia/Kolkata')"
4.  **Handle Ambiguity:** If a user's answer is vague, ask a clarifying question. For example, if they say "developer" for experience, ask them to specify junior, mid-level, etc.
5.  **Store the Profile:** Once all information is gathered, use the `memory_store` (or `memory`) tool to save the user's profile. The data must be stored in a JSON object with the following structure. Use `user_profile_{{user.id}}` as the key.
    
    The structure of the stored data must match this exact schema:
    ```json
    {
      "domains": ["..."],
      "level": "...",
      "goals": ["..."],
      "timezone": "..."
    }
    ```
    
    Ensure that the object mapped to `user_profile_{{user.id}}` contains exactly these properties.
6.  **Confirm and Conclude:** Read the stored preferences back to the user to confirm everything is correct. End the conversation by telling them when to expect their first daily brief.

## CONSTRAINTS
- Do not overwhelm the user with all questions at once.
- Be conversational and friendly, not robotic.
- If the user doesn't provide a valid timezone, default to 'UTC' and inform them.
- The entire onboarding process should feel smooth and take no more than a few minutes.
