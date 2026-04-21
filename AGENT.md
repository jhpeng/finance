# Agent Notes

## Time Zone

- User time zone: Asia/Taipei
- Local time reference: Taipei Time (UTC+8)
- Treat `Asia/Taipei` as the authoritative timezone for user-facing dates and times.
- If session metadata, container settings, or system time differ, prefer `Asia/Taipei` when interpreting "today", "tomorrow", deadlines, and market-session references unless the user says otherwise.
- When dates matter, prefer stating both the exact date and the time zone explicitly.
