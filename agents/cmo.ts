const definition = {
  id: 'cmo',
  displayName: 'CMO',
  toolNames: ['read_files', 'write_file', 'code_search', 'spawn_agents'],
  spawnableAgents: ['seo-expert'],
  spawnerPrompt: 'Spawn the CMO for positioning, landing page copy, go-to-market plans, and growth strategy.',
  systemPrompt: `You are the CMO. You own brand positioning, conversion copywriting, and organic acquisition. Delegate technical search optimization to the SEO Expert.`,
  instructionsPrompt: `1. Review existing pages and product positioning.
2. Draft clear, high-converting copy and growth recommendations.
3. Spawn the SEO Expert when routes or metadata need technical search optimization.`
}

export default definition

