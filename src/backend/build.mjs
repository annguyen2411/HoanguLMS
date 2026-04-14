import * as esbuild from 'esbuild'

await esbuild.build({
  entryPoints: ['src/backend/index.ts'],
  bundle: true,
  platform: 'node',
  target: 'node18',
  outfile: 'dist/server.js',
  external: ['express', 'cors', 'helmet', 'morgan', 'dotenv', 'pg', 'jsonwebtoken', 'bcryptjs', 'uuid', 'socket.io'],
  format: 'esm',
  sourcemap: false,
  minify: false,
})

console.log('Build complete: dist/server.js')