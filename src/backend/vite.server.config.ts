import { defineConfig } from 'vite'
import path from 'path'

export default defineConfig({
  build: {
    outDir: 'dist',
    emptyOutDir: true,
    minify: false,
    sourcemap: false,
    rollupOptions: {
      input: path.resolve(__dirname, 'src/backend/index.ts'),
      output: {
        entryFileNames: 'server.js',
      },
    },
  },
})