# Deployment Documentation

## GitHub Pages & Releases Automation

This repository is configured for automatic deployment to GitHub Pages with accompanying GitHub releases.

### How It Works

Every push to the `main` branch automatically:

1. **Builds the Flutter web application**
   - Uses Flutter 3.24.5 stable channel
   - Builds with `--base-href=/portfolio/` for GitHub Pages
   - Outputs to `build/web` directory

2. **Deploys to GitHub Pages**
   - Uploads build artifacts to GitHub Pages
   - Deploys using the official GitHub Pages action
   - Available at: `https://brendansiow.github.io/portfolio/`

3. **Creates a GitHub Release**
   - Automatically tagged as `deploy-{run_number}` (e.g., deploy-1, deploy-2)
   - Includes the GitHub Pages URL in the release notes
   - Contains deployment details (commit, run ID, timestamp)
   - Generates automatic release notes from commits

### GitHub Pages Setup

To ensure GitHub Pages works correctly:

1. **Repository Settings**
   - Go to Settings → Pages
   - Source: GitHub Actions (not branch-based)
   - Custom domain: Optional

2. **Required Permissions**
   - The workflow has `pages: write` for deployment
   - The workflow has `contents: write` for creating releases
   - The workflow has `id-token: write` for OIDC authentication

### Workflow Configuration

The deployment workflow (`.github/workflows/deploy.yml`) includes:

- **Trigger**: Only on pushes to `main` branch
- **Concurrency**: Prevents overlapping deployments
- **Environment**: Uses `github-pages` environment for deployment tracking
- **Release Creation**: Automatic with deployment URLs

### Troubleshooting

**If deployment is skipped:**
1. Check that pushes are going to the `main` branch
2. Verify GitHub Pages is enabled in repository settings
3. Ensure the `github-pages` environment is configured
4. Check workflow permissions in repository settings

**If releases aren't created:**
1. Verify `contents: write` permission is granted
2. Check that the workflow runs completely (deployment must succeed first)
3. Review the workflow logs for any errors in the release step

**For build failures:**
1. Check Flutter version compatibility
2. Verify `pubspec.yaml` dependencies
3. Ensure `web/index.html` exists and is properly configured

### Manual Deployment

If needed, you can manually deploy:

```bash
# Build the web app
flutter build web --release --base-href=/portfolio/

# The build output will be in build/web/
# Upload these files to your web server or GitHub Pages
```

### Monitoring

- **Deployment Status**: Check the Actions tab for workflow runs
- **GitHub Pages Status**: Check Settings → Pages for deployment status
- **Live Site**: Visit `https://brendansiow.github.io/portfolio/`
- **Releases**: Check the Releases section for deployment history

### Future Enhancements

Consider adding:
- Custom domain configuration
- Build caching for faster deployments
- Deployment notifications (Slack, email, etc.)
- Staging deployments for feature branches
- Performance monitoring and lighthouse scores