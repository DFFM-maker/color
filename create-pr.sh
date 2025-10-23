#!/bin/bash

# Script to create Pull Request from feat/colori-resine-sport to main
# This script documents the command needed to create the PR
#
# Prerequisites:
# - gh CLI installed and authenticated
# - Appropriate repository access permissions

set -e

REPO="DFFM-maker/color"
BASE_BRANCH="main"
HEAD_BRANCH="feat/colori-resine-sport"
PR_TITLE="Add sports resin flooring color palette with RAL approximations and visual swatches"

# Read the PR description from the markdown file
PR_BODY=$(cat << 'EOF'
## What this PR contains

This pull request adds a new Markdown file (`colori-resine-impianti-sportivi.md`) that provides a comprehensive, visually-enhanced color palette specifically designed for sports resin flooring applications.

### File Contents

The file includes:

- **RAL color approximations**: A curated selection of 17 RAL colors commonly used in sports flooring installations
- **Visual sRGB swatches**: Image-based color samples (24x24 pixels) for immediate visual reference  
- **HEX values**: Approximate hexadecimal color codes for each RAL color in sRGB color space
- **Typical use cases**: Detailed descriptions of where each color is typically applied, including:
  - Tennis courts (signal blue, reseda green)
  - Basketball courts (signal blue, traffic blue)
  - Volleyball courts (light blue, signal blue)
  - Padel courts (moss green, signal blue)
  - Multi-purpose facilities (various options)
  - Athletic tracks (oxide red)
  - Safety and marking zones (traffic red, traffic yellow)

### Color Categories

The palette covers:
- **Blues**: Signal blue (RAL 5005), Light blue (RAL 5012), Sky blue (RAL 5015), Traffic blue (RAL 5017)
- **Greens**: Moss green (RAL 6005), Reseda green (RAL 6011), Signal green (RAL 6032)
- **Reds/Browns**: Terracotta/copper (RAL 8004), Oxide red (RAL 3009), Brown red (RAL 3011), Traffic red (RAL 3020)
- **Grays**: Light gray (RAL 7035), Traffic gray A (RAL 7042)
- **Neutrals**: Light ivory (RAL 1015), Traffic yellow (RAL 1023), Traffic white (RAL 9016), Intense black (RAL 9005)

## Notes about color approximation and verification

⚠️ **Important Color Accuracy Information**:

The colors displayed in this document are **sRGB approximations** shown on digital screens and should be considered **indicative only**. 

### Why colors may appear different:

1. **Screen calibration**: Different monitors and devices display colors differently
2. **Surface finish**: Final appearance depends on matte, satin, or glossy finish
3. **Anti-slip granulometry**: Texture and grain size affect color perception
4. **Layer thickness**: Thicker applications may appear more saturated
5. **Lighting conditions**: Natural vs. artificial light significantly impacts appearance
6. **Viewing angle**: Color perception changes based on viewing angle

### Always verify colors with:

- **Physical RAL color charts** (mazzette RAL) - the authoritative standard
- **Applied samples** (campioni applicati) on actual substrate material
- **Sample installations** under similar lighting conditions to the final installation
- **Manufacturer color samples** from the specific resin system being used

### Technical recommendations included:

- **Outdoor installations**: Use aliphatic polyurethane topcoat for UV stability and color retention
- **Heat considerations**: Lighter colors absorb less heat, important for outdoor sports surfaces
- **Specifications**: Always specify complete details in project documentation:
  - RAL code
  - Finish type and gloss level
  - Anti-slip classification (R-value or similar)
  - Complete resin system specification
  - Application thickness

## Suggestions for future improvement

To enhance reliability and eliminate external dependencies:

### Optional enhancement: Generate local PNG swatches

Instead of relying on external image hosting (singlecolorimage.com), consider:

1. **Create a `swatches/` folder** in the repository
2. **Generate local 24x24 pixel PNG files** for each color
3. **Update image references** from external URLs to relative paths:
   - From: `https://singlecolorimage.com/get/{HEX}/24x24`
   - To: `swatches/RAL-{code}.png`

### Benefits of local swatches:

- ✅ No dependency on external image hosting services
- ✅ Ensures long-term availability of color swatches
- ✅ Faster loading times (no external HTTP requests)
- ✅ Full control over swatch appearance and format
- ✅ Works offline or in restricted network environments
- ✅ Can add borders or other styling if desired

### Simple implementation:

```bash
# Create directory
mkdir -p swatches/

# Generate PNGs using ImageMagick (example for a few colors)
convert -size 24x24 xc:"#154889" swatches/RAL-5005.png  # Signal blue
convert -size 24x24 xc:"#84C3EB" swatches/RAL-5012.png  # Light blue
convert -size 24x24 xc:"#0077B3" swatches/RAL-5015.png  # Sky blue
# ... repeat for all 17 colors

# Update markdown to use: ![#HEX](swatches/RAL-CODE.png)
```

## Value Proposition

This addition provides a practical, immediately useful reference tool for:

- **Architects & Designers**: Quick color selection during design phase
- **Contractors & Installers**: Color verification and material ordering
- **Facility Managers**: Maintenance and repair color matching
- **Sports Facility Planners**: Understanding standard colors and typical applications
- **Project Specifiers**: Creating accurate specifications

The visual presentation with swatches makes it much easier to browse and select appropriate colors compared to text-only RAL codes.

---

**No code changes, no functional changes** - this is a pure documentation addition providing valuable reference information for sports flooring projects.
EOF
)

echo "Creating Pull Request..."
echo "Repository: $REPO"
echo "From: $HEAD_BRANCH"
echo "To: $BASE_BRANCH"
echo ""

# Create the PR using gh CLI
gh pr create \
  --repo "$REPO" \
  --base "$BASE_BRANCH" \
  --head "$HEAD_BRANCH" \
  --title "$PR_TITLE" \
  --body "$PR_BODY"

echo ""
echo "✅ Pull Request created successfully!"
echo ""
echo "To view the PR, run:"
echo "  gh pr view --repo $REPO"
