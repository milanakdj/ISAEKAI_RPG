# Isaekai RPG ⚔️

An immersive fantasy RPG adventure built with Godot Engine featuring rich storytelling, character progression, and classic RPG mechanics. Embark on an epic journey through mystical lands, battle fierce monsters, and uncover the secrets of the Isaekai realm!

![Godot Version](https://img.shields.io/badge/Godot-4.2+-blue)
![Platform](https://img.shields.io/badge/Platform-Windows%20%7C%20Linux%20%7C%20macOS%20%7C%20Android-blue)
![Genre](https://img.shields.io/badge/Genre-Fantasy%20RPG-purple)
![License](https://img.shields.io/badge/License-MIT-green)

## 🎮 Game Features

### Core RPG Mechanics
- **Character Progression**: Level up your hero with customizable stats and abilities
- **Turn-Based Combat**: Strategic battles against diverse monsters and bosses
- **Inventory Management**: Collect, craft, and equip weapons, armor, and magical items
- **Quest System**: Engaging storylines with branching dialogue and multiple endings

### Rich Game World
- **Pixel Art Graphics**: Beautiful 2D sprites and environments in classic RPG style
- **Multiple Biomes**: Explore forests, dungeons, towns, and mystical realms
- **Interactive NPCs**: Meet memorable characters with unique personalities
- **Inn System**: Rest and recover at inns scattered throughout the world

### Story & Dialogue
- **Dialogic Integration**: Fully-featured dialogue system with character portraits
- **Branching Narratives**: Your choices shape the story and world around you
- **Character Development**: Deep character backstories and relationship building
- **Multiple Languages**: Localized content for global accessibility

### Mobile Support
- **Android Build**: Optimized for mobile devices with touch controls
- **Cross-Platform**: Play on desktop or mobile with synchronized progress
- **On-Screen Controls**: Intuitive touch interface for mobile gameplay

## 🛠 Technical Stack

- **Engine**: Godot 4.2+ 
- **Dialogue System**: Dialogic addon for advanced conversations
- **Graphics**: Custom pixel art assets and sprite animations
- **Audio**: Dynamic music and sound effects system
- **Platforms**: Windows, macOS, Linux, Android
- **Version Control**: Git with shader cache optimization

## System Requirements

### Desktop (Windows/macOS/Linux)

**Minimum:**
- OS: Windows 10, macOS 10.15, or Ubuntu 18.04+
- Processor: Intel i3 or AMD equivalent (2.0 GHz)
- Memory: 2 GB RAM
- Graphics: OpenGL 3.3 compatible
- Storage: 500 MB available space

**Recommended:**
- OS: Windows 11, macOS 12+, or Ubuntu 20.04+
- Processor: Intel i5 or AMD Ryzen 5 (2.5 GHz+)
- Memory: 4 GB RAM
- Graphics: Dedicated GPU with OpenGL 3.3+
- Storage: 1 GB available space (SSD recommended)

### Mobile (Android)

**Minimum:**
- OS: Android 6.0 (API level 23)
- RAM: 2 GB
- Storage: 200 MB available space
- OpenGL ES 3.0 support

**Recommended:**
- OS: Android 8.0+ (API level 26)
- RAM: 3+ GB
- Storage: 500 MB available space
- OpenGL ES 3.2 support

## Installation & Setup

### For Players

#### Desktop Release
1. Download the latest release from [Releases](https://github.com/yourorg/isaekai-rpg/releases)
2. Extract the game files to your desired location
3. Run the executable:
   - **Windows**: `IsaekaiRPG.exe`
   - **macOS**: `IsaekaiRPG.app`
   - **Linux**: `IsaekaiRPG.x86_64`

#### Android APK
1. Download the APK from the releases page
2. Enable "Install from Unknown Sources" in Android settings
3. Install the APK file
4. Launch "Isaekai RPG" from your app drawer

### For Developers

#### Prerequisites
- **Godot 4.2+** - Download from [godotengine.org](https://godotengine.org)
- **Git** for version control
- **Android Studio** (for Android builds)
- **Code Editor** (VS Code recommended with Godot extension)

#### Development Setup

1. **Clone the repository:**
```bash
git clone https://github.com/yourorg/isaekai-rpg.git
cd isaekai-rpg
```

2. **Open in Godot:**
   - Launch Godot Engine
   - Click "Import" and select the project folder
   - Godot will automatically import all assets and dependencies

3. **Install Dialogic addon:**
   - The Dialogic addon is already included in `addons/dialogic/`
   - Enable it in Project Settings > Plugins > Dialogic

4. **Configure Android export** (optional):
   - Install Android SDK and NDK
   - Configure export templates in Project Settings > Export
   - Set up debug keystore for development builds

5. **Run the game:**
   - Press F5 or click the Play button in Godot
   - Select the main scene when prompted

## How to Play

### Basic Controls

#### Desktop Controls
- **Movement**: `WASD` or `Arrow Keys`
- **Interact**: `Space` or `Enter` - Talk to NPCs, open chests, examine objects
- **Menu**: `Tab` or `I` - Open inventory and character stats
- **Cancel/Back**: `Escape` - Close menus, cancel actions
- **Quick Save**: `F5` - Save your progress anywhere
- **Quick Load**: `F9` - Load your most recent save

#### Mobile Controls (Android)
- **Movement**: Virtual D-pad or drag to move
- **Interact**: Tap on objects, NPCs, or interaction prompts
- **Menu**: Tap the menu button in the UI
- **Inventory**: Swipe up or tap the backpack icon
- **Auto-Save**: Progress is automatically saved at key points

### Game Systems

#### Character Progression
- **Experience Points**: Gain XP by defeating enemies and completing quests
- **Level Up**: Increase stats and unlock new abilities
- **Skill Trees**: Choose specializations (Warrior, Mage, Rogue)
- **Equipment**: Find and equip better weapons and armor

#### Combat System
- **Turn-Based**: Strategic combat with action point system
- **Elemental Magic**: Fire, ice, lightning, and earth spells
- **Status Effects**: Poison, paralysis, buffs, and debuffs
- **Critical Hits**: Timing-based attacks for extra damage

#### Inventory & Items
- **Equipment Slots**: Weapon, armor, accessories, and consumables
- **Item Rarity**: Common, rare, epic, and legendary items
- **Crafting**: Combine materials to create powerful equipment
- **Shop System**: Buy and sell items at various merchants

#### Quest & Story
- **Main Questline**: Follow the epic story of the Isaekai realm
- **Side Quests**: Optional missions with unique rewards
- **Dialogue Choices**: Shape the story with your decisions
- **Multiple Endings**: Your actions determine the fate of the world

## Project Structure

```
isaekai-rpg/
├── .godot/                           # Godot engine cache and settings
│   ├── editor/                       # Editor configuration
│   ├── imported/                     # Imported asset cache
│   └── shader_cache/                 # Compiled shaders
├── addons/
│   └── dialogic/                     # Dialogue system addon
│       ├── Editor/                   # Dialogic editor tools
│       ├── Example Assets/           # Sample dialogue assets
│       ├── Images/                   # UI icons and graphics
│       └── Nodes/                    # Dialogue runtime nodes
├── android/                          # Android build configuration
│   └── build/                        # Android build artifacts
├── Assets/                           # Game art and audio assets
│   ├── Buildings/                    # Structure sprites and tiles
│   ├── Character Sprites/            # Player and NPC animations
│   │   └── Mobs/                     # Enemy creature sprites
│   ├── Effects/                      # Visual effect animations
│   ├── Inn/                          # Inn and rest area assets
│   ├── Items/                        # Equipment and item sprites
│   ├── Music and Sounds/             # Audio files
│   ├── Nature/                       # Environment and landscape art
│   ├── rpg-pack/                     # RPG asset collection
│   │   ├── chars/                    # Character sprite sets
│   │   ├── mobs/                     # Monster sprites
│   │   ├── props n decorations/      # Environmental objects
│   │   ├── tiles/                    # Tileset graphics
│   │   └── UI/                       # User interface elements
│   ├── Shaders/                      # Custom shader effects
│   ├── Shadows/                      # Shadow and lighting effects
│   ├── static/                       # Static background elements
│   └── UI/                           # Interface graphics
├── dialogic/                         # Dialogue content
│   ├── characters/                   # Character definitions
│   ├── themes/                       # Dialogue visual themes
│   └── timelines/                    # Story and conversation scripts
├── Data/                             # Game data and configuration
├── Effects/                          # Particle and visual effects
├── Inventory/                        # Inventory system scripts
├── MainCharacter/                    # Player character logic
├── Mobs/                             # Enemy AI and behavior
├── NPC/                              # Non-player character scripts
├── Scene/                            # Game scenes and levels
├── Scripts/                          # Core game logic scripts
├── Static/                           # Static world elements
├── UI/                               # User interface scenes
└── resources/                        # Godot resource files
```

## 🎨 Art & Audio

### Visual Style
- **Pixel Art**: Hand-crafted 16-bit inspired sprites and animations
- **Color Palette**: Rich, vibrant colors that evoke classic RPG atmosphere
- **Character Design**: Diverse cast with unique visual personalities
- **Environment Art**: Detailed backgrounds with parallax scrolling effects

### Audio Design
- **Dynamic Music**: Orchestral soundtrack that adapts to gameplay situations
- **Sound Effects**: Immersive audio for combat, magic, and environmental interactions
- **Voice Acting**: Character voices for important dialogue (planned feature)
- **Ambient Audio**: Environmental sounds that bring the world to life

## 🔧 Development Tools

### Godot Engine Features Used
- **Scene System**: Modular game architecture with reusable scenes
- **GDScript**: Primary scripting language for game logic
- **AnimationPlayer**: Complex character and effect animations
- **TileMap**: Efficient world building with collision detection
- **Area2D/RigidBody2D**: Physics-based interactions and combat

### Third-Party Addons
- **Dialogic**: Professional dialogue system with visual editor
- **Custom Shaders**: GLSL shaders for special visual effects
- **Inventory System**: Custom-built item management framework

### Development Workflow
```bash
# Daily development routine
1. Open Godot and load the project
2. Work on specific systems (combat, dialogue, etc.)
3. Test in both desktop and mobile modes
4. Commit changes with meaningful messages
5. Build and test on target platforms
```

## Multiplayer & Social Features

### Planned Features (Future Updates)
- **Co-op Mode**: Play through the story with friends
- **Trading System**: Exchange items with other players
- **Guild System**: Join forces with other adventurers
- **Leaderboards**: Compare progress and achievements

### Current Social Elements
- **Save Sharing**: Export and share save files with friends
- **Screenshot Mode**: Capture and share your adventures
- **Achievement System**: Unlock and display gaming accomplishments

## Configuration & Settings

### Game Settings
Accessible through the in-game options menu:

```
Graphics Settings:
- Resolution: 1920x1080, 1280x720, 1024x768
- Fullscreen/Windowed mode
- VSync: On/Off
- Pixel Perfect: On/Off (crisp pixel art rendering)

Audio Settings:
- Master Volume: 0-100%
- Music Volume: 0-100% 
- SFX Volume: 0-100%
- Voice Volume: 0-100%

Gameplay Settings:
- Text Speed: Slow/Normal/Fast
- Auto-Save: On/Off
- Battle Animations: On/Off/Fast
- Difficulty: Easy/Normal/Hard

Controls:
- Key Remapping (Desktop)
- Touch Controls Configuration (Mobile)
```

### Advanced Configuration
For developers, additional settings are available in `project.godot`:

```ini
[application]
config/name="Isaekai RPG"
config/version="1.0.0"
run/main_scene="res://Scene/MainMenu.tscn"

[display]
window/size/viewport_width=1920
window/size/viewport_height=1080
window/stretch/mode="viewport"

[input_devices]
pointing/emulate_touch_from_mouse=true
pointing/emulate_mouse_from_touch=true

[rendering]
textures/canvas_textures/default_texture_filter=0
renderer/rendering_method="gl_compatibility"
```

## Android Development

### Building for Android

1. **Setup Android SDK:**
```bash
# Install Android Studio and SDK
# Set ANDROID_SDK_ROOT environment variable
export ANDROID_SDK_ROOT=/path/to/android/sdk
```

2. **Configure Godot Export:**
   - Project Settings > Export
   - Add Android export preset
   - Configure keystore and permissions

3. **Build APK:**
   - Export > Android
   - Select debug or release build
   - Click "Export Project"

### Android-Specific Features
- **Touch Controls**: Optimized UI for touch input
- **Performance Scaling**: Automatic quality adjustment based on device
- **Battery Optimization**: Efficient rendering to preserve battery life
- **Google Play Services**: Achievement and cloud save integration (planned)

## Testing & Quality Assurance

### Testing Procedures

#### Manual Testing
```bash
# Core gameplay testing checklist
□ Character movement and animation
□ Combat system functionality
□ Dialogue system and story progression
□ Inventory and item management
□ Save/load system reliability
□ UI responsiveness across resolutions
```

#### Platform Testing
```bash
# Desktop platforms
□ Windows 10/11 compatibility
□ macOS compatibility (Intel/Apple Silicon)
□ Linux compatibility (Ubuntu/Debian)

# Mobile testing
□ Android device compatibility (various screen sizes)
□ Touch control responsiveness
□ Performance on low-end devices
```

### Debug Tools
- **Godot Debugger**: Real-time variable monitoring and scene inspection
- **Performance Profiler**: Frame rate and memory usage analysis
- **Remote Debug**: Test on mobile devices while debugging on desktop

## Build & Distribution

### Desktop Builds

#### Export Templates
```bash
# Download official Godot export templates
1. Editor Settings > Export Templates
2. Download and install for Godot 4.2+
3. Configure per-platform settings
```

#### Building Process
```bash
# Windows build
1. Project > Export
2. Select "Windows Desktop" preset
3. Configure executable name and icon
4. Export as .exe with data folder

# macOS build  
1. Select "macOS" preset
2. Configure bundle identifier and signing
3. Export as .app bundle

# Linux build
1. Select "Linux/X11" preset  
2. Export as executable
3. Package with dependencies
```

### Android Distribution

#### Google Play Store
```bash
# Production build process
1. Set up Google Play Console account
2. Generate signed APK with release keystore
3. Upload to Play Console for review
4. Configure store listing and screenshots
```

#### Alternative Distribution
- **Itch.io**: Indie game platform with built-in analytics
- **GitHub Releases**: Open source distribution
- **Direct APK**: Website downloads with installation instructions

## Troubleshooting

### Common Issues

#### Desktop Problems

**Game Won't Launch:**
```bash
# Check system compatibility
□ Verify OpenGL 3.3+ support
□ Update graphics drivers
□ Run as administrator (Windows)
□ Check antivirus software blocking execution
```

**Performance Issues:**
```bash
# Optimization steps
□ Lower graphics quality in settings
□ Close background applications
□ Ensure adequate RAM (2GB+ available)
□ Check CPU usage and cooling
```

**Save File Issues:**
```bash
# Save file locations
Windows: %APPDATA%/Godot/app_userdata/IsaekaiRPG/
macOS: ~/Library/Application Support/Godot/IsaekaiRPG/
Linux: ~/.local/share/godot/IsaekaiRPG/
```

#### Android Problems

**Installation Failed:**
```bash
# Common solutions
□ Enable "Install from Unknown Sources"
□ Ensure sufficient storage space (500MB+)
□ Try installing via ADB: adb install IsaekaiRPG.apk
□ Clear Google Play Store cache
```

**Touch Controls Unresponsive:**
```bash
# Debugging steps
□ Restart the application
□ Check device touch sensitivity settings
□ Verify screen is clean and not damaged
□ Test with different finger/stylus
```

### Debug Information

#### Enabling Debug Mode
```bash
# For developers
1. Build with "Export With Debug" enabled
2. Connect Android device via USB
3. Use adb logcat to view runtime logs
4. Monitor performance with Godot profiler
```

#### Log File Analysis
```bash
# Important log locations
Desktop: Check console output or log files in user data directory
Android: Use adb logcat | grep Godot
```

## Contributing

We welcome contributions from fellow developers and RPG enthusiasts!

### Development Guidelines

#### Code Standards
```gdscript
# GDScript style guide
extends Node2D
class_name Player

# Constants in UPPER_CASE
const MAX_HEALTH: int = 100
const MOVE_SPEED: float = 200.0

# Variables with type hints
@export var player_name: String = "Hero"
var current_health: int = MAX_HEALTH

# Function naming in snake_case
func take_damage(damage: int) -> void:
    current_health = max(0, current_health - damage)
    if current_health <= 0:
        handle_death()
```

#### Asset Guidelines
- **Sprites**: 16x16 or 32x32 pixel dimensions
- **Audio**: OGG format preferred for compression
- **Scenes**: Modular design with clear naming conventions
- **Scripts**: Comprehensive comments for complex logic

### Contributing Process
1. **Fork the repository** on GitHub
2. **Create feature branch**: `git checkout -b feature/new-spell-system`
3. **Make changes** following our coding standards
4. **Test thoroughly** on multiple platforms
5. **Submit pull request** with detailed description
6. **Address review feedback** promptly

### Areas for Contribution
- **New Content**: Additional quests, characters, and storylines
- **Game Balance**: Combat mechanics and difficulty tuning
- **Localization**: Translations for different languages
- **Bug Fixes**: Gameplay and performance improvements
- **Documentation**: Tutorials, guides, and code documentation

## Support & Community

### Getting Help
- **GitHub Issues**: [Bug reports and feature requests](https://github.com/yourorg/isaekai-rpg/issues)
- **Discord Server**: [Join our community](https://discord.gg/isaekairpg)
- **Reddit Community**: [r/IsaekaiRPG](https://reddit.com/r/isaekairpg)
- **Email Support**: support@isaekairpg.com

### Community Resources
- **Player Guide**: [Complete gameplay walkthrough](https://github.com/yourorg/isaekai-rpg/wiki/Player-Guide)
- **Modding Documentation**: [Create custom content](https://github.com/yourorg/isaekai-rpg/wiki/Modding)
- **Developer Blog**: [Development updates and behind-the-scenes](https://blog.isaekairpg.com)

### Social Media
- **Twitter**: [@IsaekaiRPG](https://twitter.com/isaekairpg) - Development updates
- **YouTube**: [Gameplay trailers and developer diaries](https://youtube.com/isaekairpg)
- **Instagram**: [@isaekairpg](https://instagram.com/isaekairpg) - Artwork and screenshots

## License & Legal

### Open Source License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

### Asset Credits
- **RPG Pack**: Custom pixel art created for this project
- **Dialogic**: MIT Licensed dialogue system addon
- **Music**: Original compositions by [Composer Name]
- **Sound Effects**: Various Creative Commons and original recordings

### Third-Party Acknowledgments
- **Godot Engine**: Juan Linietsky, Ariel Manzur, and contributors
- **Dialogic Plugin**: Emilio Coppola and the Dialogic team
- **Font**: [Font Name] under SIL Open Font License

## Roadmap & Future Plans

### Version 1.1 (Next Quarter)
- **New Region**: Explore the Crystal Caves with unique monsters
- **Multiplayer Co-op**: Play the story with a friend online
- **Character Classes**: Choose from Warrior, Mage, or Rogue specializations
- **Achievement System**: 50+ achievements to unlock

### Version 1.2 (6 Months)
- **Mobile UI Overhaul**: Redesigned interface optimized for touch
- **Voice Acting**: Professional voice work for main characters  
- **Mod Support**: Tools for community-created content
- **Steam Release**: Launch on Steam with trading cards and workshop

### Long-term Vision
- **Sequel Planning**: Expanding the Isaekai universe
- **Console Ports**: Nintendo Switch and Steam Deck optimization
- **Competitive Elements**: PvP battles and tournaments
- **VR Mode**: Experimental virtual reality experience

---

*Embark on your legendary adventure in the Isaekai realm! ⚔️✨*
Watch demo here :https://www.youtube.com/watch?v=hscFpTbjtPI