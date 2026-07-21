SELECT count(*) FROM LlmChatCompletionMessage 
WHERE role = 'user' 
AND (content LIKE '%ignore all previous instructions%' 
  OR content LIKE '%system prompt%' 
  OR content LIKE '%jailbreak%')