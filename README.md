# islami_app

IslamiGuide is a comprehensive Islamic app designed to help users connect with their faith. It
features the Quran, Ahadith (Hadith), Sebha (Tasbih), and Islamic Radio, all in one place. The app
supports 2 languages (English and Arabic) and offers 2 themes (light and dark) for a personalized
experience. Built with Flutter, the app uses Shared Preferences for local storage, Provider for
state management, and Localization for multilingual support.

## Features

1. Quran
Full Quran text with Surah and Ayah navigation.
Bookmark verses for easy access.
Search functionality to find specific Surahs or verses.
Audio playback with recitation by famous Qaris.

2. Ahadith (Hadith)
Authentic Hadiths from Sahih Bukhari, Sahih Muslim, and more.
Categorized by topics (e.g., Prayer, Fasting, Charity).
Search functionality to find specific Hadiths.

3. Sebha (Tasbih)
Digital Tasbih counter for Dhikr.
Customizable Dhikr phrases (e.g., Subhan Allah, Alhamdulillah, Allahu Akbar).
Vibration and sound feedback on each count.

4. Islamic Radio 
Stream live Islamic radio stations.
Background playback support.

5. Settings
Switch between 2 languages (English and Arabic).
Toggle between light and dark themes.

### Technical Implementation
1. Shared Preferences
   Used to save and retrieve user settings (e.g., theme, language, font size).

2. State Management (Provider)
   Efficiently manage app state (e.g., theme, language, audio playback) using the Provider package.

3. Localization
   Support for 2 languages (English and Arabic) using the flutter_localizations package.

4. Themes
   Light and dark themes for a customizable user experience.
