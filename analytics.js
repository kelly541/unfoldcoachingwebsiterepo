// Vercel Web Analytics initialization
// This script initializes Vercel Web Analytics for the UnFold Coaching website
// Using the official @vercel/analytics package v2.0.1

import { inject } from '@vercel/analytics';

// Initialize Vercel Web Analytics
// The inject function handles:
// - Loading the analytics script from the correct source (/_vercel/insights/script.js in production)
// - Setting up the tracking queue (window.va and window.vaq)
// - Automatic page view tracking
// - Development vs production environment detection
inject({
  mode: 'auto' // Automatically detects development vs production
});
