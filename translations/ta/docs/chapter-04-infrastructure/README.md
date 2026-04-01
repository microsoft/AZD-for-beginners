# Chapter 4: Infrastructure as Code & Deployment

**📚 பாடநெறி**: [AZD For Beginners](../../README.md) | **⏱️ கால அளவு**: 1-1.5 hours | **⭐ சிக்கல்நிலை**: Intermediate

---

## மேலோட்டம்

இந்த அத்தியாயம் Bicep டெம்ப்ளேட்டுகள் கொண்டு Infrastructure as Code (IaC) டென்மைகள், வளங்களின் வழங்கல் மற்றும் Azure Developer CLI பயன்படுத்தி மையப்படுத்தல் (deployment) உத்திகள் பற்றி கையாளுகிறது.

> Validated against `azd 1.23.12` in March 2026.

## கற்றல் நோக்கங்கள்

இந்த அத்தியாயத்தை முடித்தவுடன், நீங்கள்:
- Bicep டெம்ப்ளேட் அமைப்பையும் உரைமுறையையும் புரிந்துகொள்ளலாம்
- `azd provision` மூலம் Azure வளங்களை வழங்க முடியும்
- `azd deploy` மூலம் பயன்பாடுகளை орналுத்த முடியும்
- ப்ளூ-கிரீன் மற்றும் ரோலிங் (rolling) орналுத்தல் உத்திகளை நடைமுறைப்படுத்தலாம்

---

## 📚 பாடங்கள்

| # | பாடம் | விளக்கம் | நேரம் |
|---|--------|-------------|------|
| 1 | [Provisioning Resources](provisioning.md) | AZD மூலம் Azure வளங்களை நிர்வகித்தல் | 45 நிமிடம் |
| 2 | [Deployment Guide](deployment-guide.md) | பயன்பாடு орналுத்தல் உத்திகள் | 45 நிமிடம் |

---

## 🚀 விரைவான தொடக்கம்

```bash
# டெம்ப்ளேட்டை பயன்படுத்தி துவங்கவும்
azd init --template azure-functions-python-v2-http

# உருவாக்கப்படவுள்ளதை முன்னோட்டமாகப் பார்க்கவும்
azd provision --preview

# அடித்தள வசதிகளை மட்டுமே ஏற்பாடு செய்யவும்
azd provision

# குறியீட்டை மட்டும் அமல்படுத்தவும்
azd deploy

# அல்லது இரண்டையும் ஒன்றாகவும்
azd up
```

---

## 📁 AZD திட்ட அமைப்பு

```
my-project/
├── azure.yaml            # ← Project definition
├── infra/                # ← Infrastructure as Code
│   ├── main.bicep        # Entry point
│   ├── main.parameters.json
│   └── modules/          # Reusable components
│       ├── web.bicep
│       └── database.bicep
└── src/                  # Application code
    └── api/
```

---

## 🔧 அவசியமான கட்டளைகள்

| கட்டளை | விளக்கம் |
|---------|-------------|
| `azd init` | திட்டத்தை ஆரம்பிக்க |
| `azd provision` | Azure வளங்களை உருவாக்குதல் |
| `azd deploy` | பயன்பாட்டை орналுத்துதல் |
| `azd up` | provision + deploy |
| `azd down` | அனைத்து வளங்களையும் நீக்கு |

---

## 🔗 வழிசெலுத்தல்

| திசை | அத்தியாயம் |
|-----------|---------|
| **முந்தையது** | [Chapter 3: Configuration](../chapter-03-configuration/README.md) |
| **அடுத்தது** | [Chapter 5: Multi-Agent Solutions](../chapter-05-multi-agent/README.md) |

---

## 📖 சம்பந்தப்பட்ட ஆதாரங்கள்

- [Pre-Deployment Checks](../chapter-06-pre-deployment/README.md)
- [Container App Examples](../../examples/container-app/README.md)
- [Database App Example](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**மறுப்பு**:
இந்த ஆவணம் AI மொழிபெயர்ப்பு சேவை [Co-op Translator](https://github.com/Azure/co-op-translator) மூலம் மொழிபெயர்க்கப்பட்டுள்ளது. நாம் துல்லியத்திற்காக முயற்சித்தாலும், தானியங்கி மொழிபெயர்ப்புகளில் பிழைகள் அல்லது துல்லியக்குறைவுகள் இருக்கலாம் என்பதை தயவுசெய்து கவனத்தில் கொள்ளவும். மூல மொழியில் உள்ள ஆவணம் அதிகாரப்பூர்வ ஆதாரமாக கருதப்பட வேண்டும். முக்கியமான தகவல்களுக்கு, தொழில்முறை மனித மொழிபெயர்ப்பை பரிந்துரைக்கிறோம். இந்த மொழிபெயர்ப்பைப் பயன்படுத்துவதால் ஏற்படும் எந்தவொரு தவறான புரிதல்களுக்கும் அல்லது தவறான விளக்கங்களுக்கும் நாங்கள் பொறுப்பல்ல.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->