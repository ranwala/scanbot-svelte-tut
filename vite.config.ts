import { defineConfig } from 'vite'
import { svelte } from '@sveltejs/vite-plugin-svelte'

// https://vite.dev/config/
export default defineConfig({
  plugins: [svelte()],
  server: {
    allowedHosts: [
      'apparently-hopeful-spider.ngrok-free.app',  // Add the specific ngrok domain
      '5173',  // Optional: If you also want to allow your local network IP address
      'localhost',      // Optional: Allow localhost as well
    ]
  }
})
