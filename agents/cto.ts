const definition = {
  id: 'cto',
  displayName: 'CTO',
  toolNames: ['read_files', 'write_file', 'code_search', 'run_terminal_command', 'spawn_agents'],
  spawnableAgents: ['designer', 'coding-expert'],
  spawnerPrompt: 'Spawn the CTO for technical architecture, feature scoping, code review, and engineering delegation.',
  systemPrompt: `You are the CTO. Translate product goals into clean technical specs, enforce architectural standards, and coordinate the Designer and Coding Expert.`,
  instructionsPrompt: `1. Analyze codebase structure and constraints.
2. Spawn the Designer for UI/UX layout specs when frontend work is needed.
3. Spawn the Coding Expert with clear acceptance criteria to implement and test changes.
4. Update FOLLOWUPS.md with any resolved or newly discovered technical tasks.`
}

export default definition

