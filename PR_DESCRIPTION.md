# Pull Request: Add sports resin flooring color palette

## PR Details
- **From branch**: `feat/colori-resine-sport`
- **To branch**: `main`
- **Type**: Feature addition
- **Files added**: `colori-resine-impianti-sportivi.md`

## Title
Add sports resin flooring color palette with RAL approximations and visual swatches

## Description

### What this PR contains

This pull request adds a new Markdown file (`colori-resine-impianti-sportivi.md`) that provides a comprehensive, visually-enhanced color palette specifically designed for sports resin flooring applications.

The file includes:

- **RAL color approximations**: A curated selection of 17 RAL colors commonly used in sports flooring installations
- **Visual sRGB swatches**: Image-based color samples (24x24 pixels) for immediate visual reference using singlecolorimage.com
- **HEX values**: Approximate hexadecimal color codes for each RAL color in sRGB color space
- **Typical use cases**: Detailed descriptions of where each color is typically applied, including:
  - Tennis courts
  - Basketball courts
  - Volleyball courts
  - Padel courts
  - Multi-purpose sports facilities
  - Athletic tracks
  - Safety/marking zones

- **Color categories covered**:
  - Blues (signal blue, light blue, sky blue, traffic blue)
  - Greens (moss green, reseda green, signal green)
  - Reds/browns (terracotta/copper, oxide red, brown red, traffic red)
  - Grays (light gray, traffic gray A)
  - Neutrals (light ivory, traffic yellow, traffic white, intense black)

### Notes about color approximation and verification

⚠️ **Important Color Accuracy Information**:

The colors displayed in this document are sRGB approximations shown on digital screens and should be considered **indicative only**. Actual color rendering will vary due to:

1. **Screen calibration**: Different monitors display colors differently
2. **Surface finish**: The final appearance depends on whether the finish is matte, satin, or glossy
3. **Anti-slip granulometry**: The texture and grain size of anti-slip additives affects color perception
4. **Layer thickness**: Thicker applications may appear more saturated
5. **Lighting conditions**: Natural vs. artificial light significantly impacts color appearance

**Always verify colors with:**
- Physical RAL color charts (mazzette RAL)
- Applied samples (campioni applicati) on actual substrate material
- Sample installations under similar lighting conditions to the final installation

### Technical recommendations included

The file also provides practical guidance:
- **Outdoor installations**: Recommends aliphatic polyurethane topcoat for UV stability
- **Heat considerations**: Notes that lighter colors absorb less heat in outdoor environments
- **Specification requirements**: Reminds users to specify RAL code, finish (gloss level), anti-slip classification, and complete resin system details in project specifications

### Suggestions for future improvement

To enhance reliability and eliminate external dependencies:

**Optional enhancement**: Generate local PNG swatches
- Create a `swatches/` folder in the repository
- Generate local 24x24 pixel PNG files for each color
- Update image references from `https://singlecolorimage.com/get/{HEX}/24x24` to relative paths like `swatches/RAL-{code}.png`

**Benefits of this approach**:
- No dependency on external image hosting services
- Ensures long-term availability of color swatches
- Faster loading times
- Full control over swatch appearance and format
- Works offline or in restricted network environments

**Implementation would be simple**:
```bash
mkdir -p swatches/
# Generate PNGs for each color using ImageMagick or similar
convert -size 24x24 xc:"#154889" swatches/RAL-5005.png
# ... (repeat for each color)
```

## Value Proposition

This addition provides a practical, immediately useful reference tool for:
- **Architects**: Quick color selection and specification during design phase
- **Contractors**: Color verification and ordering reference
- **Facility managers**: Maintenance and repair color matching
- **Sports facility planners**: Understanding standard color options and typical applications

The visual presentation makes it much easier to browse and select appropriate colors compared to text-only RAL codes.

## Testing/Verification

No automated testing required for this documentation addition. Manual verification:
- ✅ Markdown renders correctly
- ✅ Image swatches display properly
- ✅ Table formatting is clean and readable
- ✅ RAL codes and HEX values are accurate approximations
- ✅ Use case descriptions are practical and relevant

## Checklist

- [x] File added: `colori-resine-impianti-sportivi.md`
- [x] Visual color swatches included (via external service)
- [x] RAL codes specified for all colors
- [x] Approximate HEX values provided
- [x] Typical use cases documented
- [x] Color approximation warnings included
- [x] Technical recommendations provided
- [x] Future improvement suggestions documented

