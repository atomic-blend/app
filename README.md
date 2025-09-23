# 🌟 Atomic Blend

Welcome to **Atomic Blend** – the open-source, end-to-end encrypted task management app that seamlessly integrates your **work, personal life, and productivity** into one secure and unified space. We believe in the power of having all your tasks, projects, and goals in one place, just like modern productivity tools, but with a crucial difference: your data stays truly yours through end-to-end encryption.

## 🚀 What is Atomic Blend?
Atomic Blend is your **personal and professional hub**, combining task management, note-taking, collaboration, and encrypted data storage into one simple yet powerful platform.

- 🔒 **Privacy First** – End-to-end encryption ensures your data remains yours.
- 📋 **All-in-One** – Manage tasks, notes, calendar, and team collaboration in one place.
- ⚡ **Open Source** – Built for the community, by the community.
- 🔗 **Seamless Integration** – Sync across all your devices, with APIs for extensibility.
- 🌍 **Work & Life Harmony** – Whether it’s projects, groceries, or ideas, keep everything organized.

## Documentation

All the documentation is available here : **[Documentation](https://atomic-blend.gitbook.io/docs)**

## 🤝 How to Contribute
We welcome contributions from everyone! Here's how you can help:
- 🚀 **Submit Issues** – Report bugs or request new features.
- 🛠️ **Develop Features** – Pick an issue and start coding.
- 📖 **Improve Documentation** – Help make Atomic Blend accessible to all.
- ⭐ **Spread the Word** – Star the repo and share with others!

To get started, check out our **[CONTRIBUTING.md](./CONTRIBUTING.md)** file.

## 🛠️ Local Development

### Testing with Local Dependencies

For local development and testing, you can temporarily replace git dependencies that are owned by atomic-blend with local path dependencies. This is useful when you need to test changes across multiple packages simultaneously.

**Example**: If you're working on both the main app and a shared package:

```yaml
# In pubspec.yaml - for local testing
ab_shared:
  path: ../app-shared

flutter_age:
  path: ../flutter_age
```

**⚠️ Important**: 
- **NEVER commit** these path dependencies to version control
- **Always revert** to git dependencies before pushing your changes
- The CI/CD pipeline will automatically fail if path dependencies are detected

**Git dependencies to restore before pushing**:
```yaml
ab_shared:
  git:
    url: https://github.com/atomic-blend/app-shared.git
    ref: d720749296c45563b5a6636d86e4ecc13d91a11d

flutter_age:
  git:
    url: https://github.com/atomic-blend/flutter_age.git
    ref: v0.0.3
```

## 🔗 Links
- 🔥 **Website**: [atomicblend.io](https://atomicblend.io) *(Coming Soon!)*  
- 📜 **Docs**: [atomicblend.io/docs](https://atomic-blend.gitbook.io/docs) 
- 🐙 **GitHub**: [github.com/atomic-blend](https://github.com/atomic-blend)  
- 💬 **Community**: [Discord](https://discord.gg/uVK5Ekqne8)  

## 📜 License
Atomic Blend is licensed under the AGPL v3 License – ensuring freedom and openness while requiring modifications to be shared with the community.

---

👥 **Join the movement!** Let's build a secure, all-in-one everything app together. 🚀 
