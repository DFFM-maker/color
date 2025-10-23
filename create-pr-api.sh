#!/bin/bash

# Create Pull Request using GitHub REST API
# This script demonstrates how to create the PR using curl and the GitHub API
#
# Prerequisites:
# - GITHUB_TOKEN environment variable set with appropriate permissions
# - curl installed

set -e

# Configuration
REPO_OWNER="DFFM-maker"
REPO_NAME="color"
BASE_BRANCH="main"
HEAD_BRANCH="feat/colori-resine-sport"

# Check for GitHub token
if [ -z "$GITHUB_TOKEN" ]; then
    echo "Error: GITHUB_TOKEN environment variable is not set"
    echo "Please set it with: export GITHUB_TOKEN='your_token_here'"
    exit 1
fi

# PR Title
PR_TITLE="Add sports resin flooring color palette with RAL approximations and visual swatches"

# PR Body (description)
read -r -d '' PR_BODY << 'EOF' || true
## What this PR contains

This pull request adds a new Markdown file (`colori-resine-impianti-sportivi.md`) that provides a comprehensive, visually-enhanced color palette specifically designed for sports resin flooring applications.

### File Contents

The file includes:

- **RAL color approximations**: A curated selection of 17 RAL colors commonly used in sports flooring installations
- **Visual sRGB swatches**: Image-based color samples (24x24 pixels) for immediate visual reference using singlecolorimage.com
- **HEX values**: Approximate hexadecimal color codes for each RAL color in sRGB color space
- **Typical use cases**: Detailed descriptions of where each color is typically applied (tennis, basketball, volleyball, padel, etc.)

### Color Categories

- Blues (signal, light, sky, traffic)
- Greens (moss, reseda, signal)
- Reds/Browns (terracotta, oxide, brown, traffic)
- Grays (light, traffic)
- Neutrals (ivory, yellow, white, black)

## Notes about color approximation and verification

⚠️ **Important Color Accuracy Information**

The colors displayed are **sRGB approximations** shown on digital screens and should be considered **indicative only**. 

Actual color rendering will vary due to:
- Screen calibration differences
- Surface finish (matte/satin/glossy)
- Anti-slip granulometry
- Layer thickness
- Lighting conditions
- Viewing angle

### Always verify colors with:

- **Physical RAL color charts** (mazzette RAL) - the authoritative standard
- **Applied samples** (campioni applicati) on actual substrate  
- **Sample installations** under similar lighting to final installation
- **Manufacturer color samples** from the specific resin system

### Technical recommendations:

- **Outdoor**: Use aliphatic polyurethane topcoat for UV stability
- **Heat management**: Lighter colors absorb less heat outdoors
- **Specifications**: Always specify RAL code, finish, anti-slip class, and complete resin system

## Suggestions for future improvement

To enhance reliability and eliminate external dependencies:

### Optional: Generate local PNG swatches

Instead of relying on external hosting (singlecolorimage.com):

1. Create a `swatches/` folder in the repository
2. Generate local 24x24px PNG files for each color
3. Update image references to relative paths: `swatches/RAL-{code}.png`

### Benefits:

- ✅ No external service dependency
- ✅ Long-term availability guaranteed
- ✅ Faster loading (no external HTTP)
- ✅ Full control over appearance
- ✅ Works offline
- ✅ Can add borders or styling

### Simple implementation:

```bash
mkdir -p swatches/
# Using ImageMagick:
convert -size 24x24 xc:"#154889" swatches/RAL-5005.png
# Repeat for all 17 colors
```

## Value

This provides a practical reference tool for:
- Architects & designers (quick color selection)
- Contractors (verification & ordering)
- Facility managers (maintenance & matching)
- Sports facility planners (standard options)
- Project specifiers (accurate specifications)

---

**Pure documentation addition** - no code changes, no functional modifications.
EOF

# Create JSON payload
JSON_PAYLOAD=$(jq -n \
  --arg title "$PR_TITLE" \
  --arg body "$PR_BODY" \
  --arg head "$HEAD_BRANCH" \
  --arg base "$BASE_BRANCH" \
  '{
    title: $title,
    body: $body,
    head: $head,
    base: $base
  }')

echo "Creating Pull Request..."
echo "Repository: $REPO_OWNER/$REPO_NAME"
echo "From: $HEAD_BRANCH"
echo "To: $BASE_BRANCH"
echo ""

# Make API call to create PR
RESPONSE=$(curl -s -X POST \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer $GITHUB_TOKEN" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  "https://api.github.com/repos/$REPO_OWNER/$REPO_NAME/pulls" \
  -d "$JSON_PAYLOAD")

# Check if PR was created successfully
PR_URL=$(echo "$RESPONSE" | jq -r '.html_url // empty')

if [ -n "$PR_URL" ]; then
    echo "✅ Pull Request created successfully!"
    echo ""
    echo "PR URL: $PR_URL"
    echo "PR Number: $(echo "$RESPONSE" | jq -r '.number')"
else
    echo "❌ Failed to create Pull Request"
    echo ""
    echo "Response:"
    echo "$RESPONSE" | jq '.'
    exit 1
fi
