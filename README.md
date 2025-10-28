# Coffee Bar Tidbyt Apps ☕

A collection of custom Tidbyt apps designed for a coffee bar display, built with Pixlet.

## About

This project contains 9 custom apps that rotate on a Tidbyt display, providing coffee-themed animations, information, and motivation for your coffee bar.

## Apps

### 1. Coffee Counter ([coffee_counter.star](apps/coffee_counter.star))
Cycles through 8 motivational coffee messages with an animated ASCII coffee cup and beans.

**Messages:**
- COFFEE TIME!
- FUEL UP!
- BREW CREW
- CAFE VIBES
- ESPRESSO!
- DAILY GRIND
- SIP HAPPENS
- GRIND & SHINE

**Rotation:** 3 seconds per message

### 2. Coffee Quotes ([coffee_quotes.star](apps/coffee_quotes.star))
Displays scrolling coffee wisdom and humor.

**Features:**
- 10 different quotes
- Marquee scrolling text
- Rotation: 10 seconds per quote

### 3. Brew Timer ([brew_timer.star](apps/brew_timer.star))
4-minute French Press countdown timer with color-changing progress bar.

**Features:**
- Live countdown display
- Color changes: Green → Orange → Red
- Visual progress bar
- Status indicators: BREWING, ALMOST, READY!

### 4. Drink Rotator ([drink_rotator.star](apps/drink_rotator.star))
Showcases 12 different coffee drinks with custom color themes.

**Drinks:**
- Espresso, Cappuccino, Latte, Americano, Macchiato, Mocha
- Flat White, Cortado, Espresso Martini
- Freddo Espresso, Cold Brew, Nitro Cold

**Rotation:** 5 seconds per drink

### 5. Caffeine Meter ([caffeine_meter.star](apps/caffeine_meter.star))
Visual caffeine level bar that depletes over the hour.

**Features:**
- 10-bar meter display
- Auto-resets every hour
- Status: WIRED → FADING → LOW!
- Color changes based on level

### 6. Bean Origins ([bean_origins.star](apps/bean_origins.star))
Educational display of coffee-growing regions with flavor profiles.

**Regions:**
- Ethiopia, Colombia, Brazil, Kenya, Guatemala
- Sumatra, Costa Rica, Yemen, Jamaica, Hawaii

**Rotation:** 5 seconds per region

### 7. Coffee Facts ([coffee_facts.star](apps/coffee_facts.star))
Displays 15 interesting coffee trivia facts with scrolling text.

**Rotation:** 8 seconds per fact

### 8. Steaming Cup ([steaming_cup.star](apps/steaming_cup.star))
Aesthetic animated coffee cup with rising steam effect.

**Features:**
- Animated steam patterns
- "FRESH BREWED" label
- Warm color palette

### 9. Coffee Fixes Everything ([coffee_fixes.star](apps/coffee_fixes.star))
Motivational message with pulsing borders and rotating emojis.

**Features:**
- Pulsing gold/orange borders
- Rotating emojis: ☕ ✨ 💛 🌟
- 3-line stacked message

## Installation

### Prerequisites
- [Pixlet](https://github.com/tidbyt/pixlet) installed
- Tidbyt device
- Tidbyt API token

### Setup

1. Clone this repository:
```bash
git clone <your-repo-url>
cd "TIDBYT DEVICE"
```

2. Install Pixlet (macOS):
```bash
brew install tidbyt/tidbyt/pixlet
```

3. Get your Tidbyt API credentials from the mobile app:
   - Settings → General → Get API Key

### Pushing Apps

To push an app to your Tidbyt:

```bash
cd apps
pixlet render <app-name>.star
pixlet push --api-token=<YOUR_API_TOKEN> --installation-id=<app-id> <YOUR_DEVICE_ID> <app-name>.webp
```

Example:
```bash
pixlet render coffee_counter.star
pixlet push --api-token=YOUR_TOKEN --installation-id=coffeecounter YOUR_DEVICE_ID coffee_counter.webp
```

## Customization

All apps are highly customizable! Edit the `.star` files to modify:

- **Messages/Text:** Change quotes, messages, drink names, etc.
- **Timing:** Adjust rotation speeds and animation delays
- **Colors:** Customize color schemes and themes
- **Fonts:** Choose from available Tidbyt fonts
- **Layout:** Modify spacing, alignment, and positioning

### Color Palette

Apps use a warm coffee-themed palette:
- `#2d1b00` - Dark coffee brown (backgrounds)
- `#8B4513` - Saddle brown (borders)
- `#FFDEAD` - Navajowhite/tan (text)
- `#FFD700` - Gold (highlights)
- `#5C4033` - Dark brown (accents)

## Project Structure

```
TIDBYT DEVICE/
├── apps/
│   ├── coffee_counter.star
│   ├── coffee_quotes.star
│   ├── brew_timer.star
│   ├── drink_rotator.star
│   ├── caffeine_meter.star
│   ├── bean_origins.star
│   ├── coffee_facts.star
│   ├── steaming_cup.star
│   └── coffee_fixes.star
├── .gitignore
└── README.md
```

## Technologies

- **Pixlet** - Tidbyt app runtime and framework
- **Starlark** - Python-like language for Tidbyt apps
- **Tidbyt API** - For pushing apps to device

## Development

### Local Testing

Preview apps locally in your browser:

```bash
pixlet serve apps/<app-name>.star --watch
```

Then open `http://localhost:8080`

### Tips

- Use `--watch` flag for live reload during development
- Test animations locally before pushing to device
- Apps pushed via API refresh based on timing logic built into each app

## License

This project is open source and available for personal use.

## Credits

Built with Claude Code for a coffee bar Tidbyt display.

---

**Enjoy your coffee-themed Tidbyt display!** ☕✨
