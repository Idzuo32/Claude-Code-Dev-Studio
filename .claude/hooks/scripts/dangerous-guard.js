#!/usr/bin/env node
/**
 * PreToolUse hook: blocks dangerous shell commands
 * Reads tool info from stdin, blocks if dangerous
 */
let data = '';
process.stdin.on('data', chunk => data += chunk);
process.stdin.on('end', () => {
  try {
    const input = JSON.parse(data);
    if (input.tool_name !== 'Bash') {
      process.stdout.write(data);
      return;
    }

    const cmd = input.tool_input?.command || '';

    const DANGEROUS_PATTERNS = [
      /rm\s+-rf\s+\/(?!\w)/,        // rm -rf / (root)
      /rm\s+-rf\s+~\s*$/,           // rm -rf ~
      /:\s*\(\)\s*\{\s*:\|\:&\}/,   // fork bomb
      />\s*\/dev\/sd[a-z]/,         // writing to disk device
      /dd\s+.*of=\/dev\/(?!null)/,  // dd to device
      /curl[^|]*\|\s*(ba)?sh/,      // curl | sh
      /wget[^|]*\|\s*(ba)?sh/,      // wget | sh
      /chmod\s+777\s+\//,           // chmod 777 /
      /sudo\s+rm\s+-rf/,            // sudo rm -rf
    ];

    const isDangerous = DANGEROUS_PATTERNS.some(p => p.test(cmd));

    if (isDangerous) {
      console.error(`[STUDIO GUARD] 🚨 Blocked potentially dangerous command:\n  ${cmd}`);
      console.error('[STUDIO GUARD] If you need this, confirm with the Studio Director first.');
      process.exit(2); // exit 2 = block the tool call
    }

    process.stdout.write(data);
  } catch (e) {
    process.stdout.write(data); // on parse error, allow through
  }
});
