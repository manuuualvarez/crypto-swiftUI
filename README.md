# 📱 MannyCrypto - iOS Cryptocurrency Portfolio Tracker

<div align="center">

![Swift](https://img.shields.io/badge/Swift-5.0-orange.svg)
![iOS](https://img.shields.io/badge/iOS-15.0+-blue.svg)
![SwiftUI](https://img.shields.io/badge/SwiftUI-Framework-green.svg)
![Core Data](https://img.shields.io/badge/Core%20Data-Persistence-red.svg)
![Combine](https://img.shields.io/badge/Combine-Reactive-purple.svg)

*A modern, feature-rich cryptocurrency portfolio tracking application built with SwiftUI*

</div>

## 🚀 Overview

MannyCrypto is a sophisticated iOS application that provides cryptocurrency market data and portfolio management capabilities. This project demonstrates advanced iOS development skills using modern frameworks and architectural patterns.

**🎯 Built to showcase professional iOS development capabilities for potential employers.**

## ✨ Key Features

### 🔥 Real-Time Market Data
- **Live cryptocurrency prices** from CoinGecko Free API (with limitations)
- **250+ cryptocurrencies** with comprehensive market data
- **Global market statistics** including market cap and 24h volume
- **Pull-to-refresh functionality** with smart rate limiting
- **Price sparkline charts** for visual market trends

### 💼 Portfolio Management
- **Personal portfolio tracking** with Core Data persistence
- **Add/edit holdings** with intuitive interface
- **Portfolio value calculation** with 24h change indicators
- **Portfolio vs. market performance** comparison
- **Persistent data storage** across app sessions

### 🔍 Advanced Search & Filtering
- **Real-time search** with debounced input (500ms)
- **Filter by name or symbol** with instant results
- **Sort options**: Rank, Holdings, Price (ascending/descending)
- **Smart search optimization** to prevent API abuse

### 📊 Detailed Analytics
- **Individual coin detail pages** with comprehensive data
- **Interactive price charts** with sparkline visualization
- **Market statistics**: High/Low, Volume, Market Cap
- **Technical data**: Block time, Hashing algorithm
- **Historical data** with percentage change indicators

### 🎨 Modern UI/UX
- **Native SwiftUI interface** with smooth animations
- **Dark/Light mode support** with custom theming
- **Responsive design** for all iPhone sizes
- **Haptic feedback** for enhanced user experience
- **Custom color system** with brand consistency

## 🛠 Technical Architecture

### **Framework & Technologies**
```
• SwiftUI (iOS 15+)          • URLSession Networking
• Combine Framework          • Custom Networking Layer  
• Core Data                  • Local File Management
• MVVM Architecture          • Image Caching System
• Swift 5.0                  • Error Handling & Recovery
```

### **Project Structure**
```
MannyCrypto/
├── Core/
│   ├── Components/         # Reusable UI components
│   ├── Home/               # Main market view
│   ├── Detail/             # Coin detail pages
│   └── Settings/           # App settings
├── Services/               # API & Data services
├── Models/                 # Data models & Core Data
├── Extensions/             # Swift extensions
└── Utilities/              # Helper classes
```

### **Services Layer**
- **`CoinDataServices`** - Real-time market data from CoinGecko
- **`MarketDataService`** - Global market statistics
- **`PortfolioDataService`** - Core Data portfolio management
- **`CoinImageService`** - Efficient image caching
- **`NetworkingManager`** - Robust networking with error handling

### **Key Technical Implementations**

#### 🔄 Reactive Programming with Combine
```swift
$searchText
    .combineLatest(coinDataService.$allCoins, $sortOption)
    .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
    .map { [weak self] (text, coins, sort) in 
        self?.filterAndSortCoins(text: text, coins: coins, sort: sort) ?? [] 
    }
    .sink { [weak self] filteredCoins in
        self?.allCoins = filteredCoins
    }
```

#### 💾 Core Data Integration
- **Persistent portfolio storage**
- **Efficient data fetching** with NSFetchedResultsController
- **Automatic data synchronization** between API and local storage

#### 🌐 Smart API Management
- **Rate limiting protection** to prevent API quota exceeded
- **Error handling** with user-friendly messages  
- **Automatic retry mechanism** for failed requests
- **Request debouncing** for search optimization


## 🚀 Installation & Setup

### Prerequisites
- **Xcode 14.0+**
- **iOS 15.0+**
- **Swift 5.0+**

### Installation Steps

1. **Clone the repository**
```bash
git clone https://github.com/manuuualvarez/crypto-swiftUI.git
cd MannyCrypto
```

2. **Open in Xcode**
```bash
open MannyCrypto.xcodeproj
```

3. **Build and Run**
   - Select your target device or simulator
   - Press `Cmd + R` to build and run
   - No additional dependencies required!

### 🔧 Configuration
- **No API keys required** - Uses CoinGecko's free public API
- **No external dependencies** - Pure iOS frameworks only
- **Ready to run** - Zero configuration needed

## ⚠️ API Usage & Limitations

### 📡 CoinGecko Free API
This application uses **CoinGecko's free public API** with the following considerations:

- **Rate Limits**: 10-30 calls/minute depending on endpoint
- **Data Delays**: Prices may have slight delays during high traffic
- **Request Quotas**: Extended usage may hit daily limits
- **Best Effort Basis**: Free tier provides excellent data but with reasonable limits

### 🛡 Built-in Protections
- **Smart request spacing** to prevent rate limit violations
- **Graceful error handling** when limits are reached
- **Automatic retry logic** with exponential backoff
- **User feedback** for temporary service unavailability

*For production use, consider upgrading to CoinGecko Pro API for higher limits and guaranteed uptime.*

## 🎯 Professional Development Highlights

This project demonstrates mastery of:

### **🏗 Architecture & Design Patterns**
- **MVVM architecture** with clear separation of concerns
- **Dependency injection** for testable, modular code
- **Protocol-oriented programming** for flexibility
- **Reactive programming** with Combine framework

### **📱 iOS Development Excellence**
- **Modern SwiftUI** with advanced UI patterns
- **Core Data** implementation with complex relationships
- **Memory management** with weak references and proper cleanup
- **Performance optimization** with image caching and data debouncing

### **🔄 Data Management**
- **RESTful API integration** with robust error handling
- **Local persistence** with Core Data stack
- **Real-time data synchronization**
- **Efficient networking** with URLSession and Combine

### **🎨 User Experience Focus**
- **Intuitive navigation** with custom animations
- **Responsive design** across all device sizes
- **Accessibility compliance** with proper labels and hints
- **Performance optimization** for smooth 60fps animations

## 👨‍💻 About the Developer

**Manuel Alvarez** - iOS Developer passionate about creating exceptional mobile experiences

- 🌐 **Portfolio**: [manuelalvarez.vercel.app](https://manuelalvarez.vercel.app/)
- 💼 **LinkedIn**: [Manuel Ignacio Alvarez](https://www.linkedin.com/in/manuelignacioalvarez/)
- 🐙 **GitHub**: [@manuuualvarez](https://github.com/manuuualvarez)

*This application was developed to demonstrate advanced iOS development skills and modern Swift/SwiftUI capabilities for potential employers.*

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- **CoinGecko** for providing comprehensive cryptocurrency data
- **Apple** for the excellent SwiftUI framework and development tools
- **iOS Development Community** for continuous learning and inspiration

---

<div align="center">

**⭐ If you find this project interesting, please consider giving it a star!**

*Built with ❤️ and SwiftUI*

</div>