# color

A lightweight JavaScript library for color manipulation and conversion.

## Features

- Convert between different color formats (RGB, HEX, HSL, HSV)
- Color manipulation (lighten, darken, saturate, desaturate)
- Color palette generation
- Accessibility utilities (contrast ratio calculation)
- Zero dependencies

## Installation

```bash
npm install @dffm-maker/color
```

Or using yarn:

```bash
yarn add @dffm-maker/color
```

## Usage

### Basic Usage

```javascript
import Color from '@dffm-maker/color';

// Create a color from hex
const color = new Color('#ff5733');

// Convert to different formats
console.log(color.toRGB());   // { r: 255, g: 87, b: 51 }
console.log(color.toHSL());   // { h: 11, s: 100, l: 60 }
console.log(color.toHex());   // '#ff5733'
```

### Color Manipulation

```javascript
import Color from '@dffm-maker/color';

const color = new Color('#3498db');

// Lighten the color by 20%
const lighter = color.lighten(20);

// Darken the color by 30%
const darker = color.darken(30);

// Increase saturation
const saturated = color.saturate(15);

// Decrease saturation
const desaturated = color.desaturate(15);

// Adjust opacity
const transparent = color.alpha(0.5);
```

### Color Palette Generation

```javascript
import Color from '@dffm-maker/color';

const baseColor = new Color('#3498db');

// Generate complementary color
const complementary = baseColor.complement();

// Generate triadic colors
const triadic = baseColor.triadic();

// Generate analogous colors
const analogous = baseColor.analogous();

// Generate monochromatic palette
const monochromatic = baseColor.monochromatic(5);
```

### Accessibility

```javascript
import Color from '@dffm-maker/color';

const background = new Color('#ffffff');
const text = new Color('#000000');

// Calculate contrast ratio
const contrast = background.contrast(text);
console.log(contrast); // 21

// Check WCAG compliance
const isAccessible = background.isAccessible(text, 'AA'); // true
```

## API Reference

### Constructor

#### `new Color(input)`

Creates a new Color instance.

**Parameters:**
- `input` (string | object): Color value in hex, rgb, hsl, or object format

**Examples:**
```javascript
new Color('#ff5733')
new Color('rgb(255, 87, 51)')
new Color('hsl(11, 100%, 60%)')
new Color({ r: 255, g: 87, b: 51 })
```

### Conversion Methods

#### `toHex()`
Returns the color as a hexadecimal string.

**Returns:** `string`

#### `toRGB()`
Returns the color as an RGB object.

**Returns:** `{ r: number, g: number, b: number }`

#### `toHSL()`
Returns the color as an HSL object.

**Returns:** `{ h: number, s: number, l: number }`

#### `toHSV()`
Returns the color as an HSV object.

**Returns:** `{ h: number, s: number, v: number }`

### Manipulation Methods

#### `lighten(amount)`
Lightens the color by the specified percentage.

**Parameters:**
- `amount` (number): Percentage to lighten (0-100)

**Returns:** `Color`

#### `darken(amount)`
Darkens the color by the specified percentage.

**Parameters:**
- `amount` (number): Percentage to darken (0-100)

**Returns:** `Color`

#### `saturate(amount)`
Increases the saturation by the specified percentage.

**Parameters:**
- `amount` (number): Percentage to saturate (0-100)

**Returns:** `Color`

#### `desaturate(amount)`
Decreases the saturation by the specified percentage.

**Parameters:**
- `amount` (number): Percentage to desaturate (0-100)

**Returns:** `Color`

#### `alpha(value)`
Sets the alpha (opacity) value.

**Parameters:**
- `value` (number): Alpha value (0-1)

**Returns:** `Color`

### Palette Methods

#### `complement()`
Returns the complementary color.

**Returns:** `Color`

#### `triadic()`
Returns an array of triadic colors.

**Returns:** `Color[]`

#### `analogous(count?)`
Returns an array of analogous colors.

**Parameters:**
- `count` (number, optional): Number of analogous colors (default: 3)

**Returns:** `Color[]`

#### `monochromatic(count?)`
Returns an array of monochromatic colors.

**Parameters:**
- `count` (number, optional): Number of shades (default: 5)

**Returns:** `Color[]`

### Accessibility Methods

#### `contrast(color)`
Calculates the contrast ratio with another color.

**Parameters:**
- `color` (Color): Color to compare against

**Returns:** `number` - Contrast ratio (1-21)

#### `isAccessible(color, level?)`
Checks if the color combination meets WCAG standards.

**Parameters:**
- `color` (Color): Color to compare against
- `level` (string, optional): WCAG level ('AA' or 'AAA', default: 'AA')

**Returns:** `boolean`

## Browser Support

This library supports all modern browsers:
- Chrome (latest)
- Firefox (latest)
- Safari (latest)
- Edge (latest)

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

MIT © DFFM-maker

## Changelog

### 1.0.0
- Initial release with core color conversion and manipulation features