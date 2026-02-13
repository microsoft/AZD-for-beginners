# ಮೈಕ್ರೋಸರ್ವಿಸಸ್ ವಾಸ್ತುಶಿಲ್ಪ - ಕಂಟೇನರ್ ಅಪ್ಲಿಕೇಶನ್ ಉದಾಹರಣೆ

⏱️ **ಅಂದಾಜಿನ ಸಮಯ**: 25-35 ನಿಮಿಷಗಳು | 💰 **ಅಂದಾಜಿನ ವೆಚ್ಚ**: ~$50-100/ತಿಂಗಳು | ⭐ **ಸಂಕೀರ್ಣತೆ**: ಉನ್ನತ

**ಸರಳೀಕೃತ ಆದರೆ ಕಾರ್ಯಕ್ಷಮ** ಮೈಕ್ರೋಸರ್ವಿಸಸ್ ವಾಸ್ತುಶಿಲ್ಪವನ್ನು AZD CLI ಬಳಸಿ Azure Container Apps ಗೆ ನಿಯೋಜಿಸಲಾಗಿದೆ. ಈ ಉದಾಹರಣೆ ಸೇವೆ-ಸೇವೆ ಸಂವಹನ, ಕಂಟೇನರ್ ಸಂಘಟನೆ ಮತ್ತು ನಿಗಾ ಮಾಪನವನ್ನು ಪ್ರಾಯೋಗಿಕ 2-ಸೇವಾ ಸೆಟ್ ಅಪ್‌ನೊಂದಿಗೆ ತೋರಿಸುತ್ತದೆ.

> **📚 ಅಧ್ಯಯನದ ದೃಷ್ಠಿಕೋನ**: ಈ ಉದಾಹರಣೆ ಸವಾಲು ಮಾಡಲು ಅನುಕೂಲಕಾರಿಯಾಗಿರುವ ಕನಿಷ್ಠ 2-ಸೇವಾ ವಾಸ್ತುಶಿಲ್ಪದಿಂದ (API ಗೇಟ್ವೇ + ಬ್ಯಾಕ್‌ಎಂಡ್ ಸರ್ವಿಸ್) ಆರಂಭಿಸುತ್ತದೆ, ಇದನ್ನು ನೀವು ನಿಜವಾಗಿ ನಿಯೋಜಿಸಿ ಕಲಿಯಬಹುದು. ಈ ಬೇಸಿಕ್ನನ್ನು ಅರ್ಥಮಾಡಿಕೊಂಡ ನಂತರ, ಸಂಪೂರ್ಣ ಮೈಕ್ರೋಸರ್ವಿಸಸ್ ಪರಿಸರಕ್ಕೆ ವಿಸ್ತರಿಸಲು ಮಾರ್ಗదర్శನೆಯನ್ನು ನೀಡಲಾಗುತ್ತದೆ.

## ನೀವು ಏನು ಕಲಿಯುತ್ತೀರಿ

ಈ ಉದಾಹರಣೆಯನ್ನು ಪೂರ್ಣಗೊಳಿಸುವ ಮೂಲಕ, ನೀವು:
- ಹಲವು ಕಂಟೇನರ್‌ಗಳನ್ನು Azure Container Apps ಗೆ ನಿಯೋಜಿಸುವುದು
- ಆಂತರಿಕ ನೆಟ್ವರ್ಕಿಂಗ್ ಮೂಲಕ ಸೇವೆ-ಸೇವೆ ಸಂವಹನ ತಾನೇಡೆಗೊಳಿಸುವುದು
- ಪರಿಸರ ಆಧಾರಿತ autoscaling ಮತ್ತು ಹ سلامت ತಪಾಸಣೆಗಳನ್ನು ಸಂರಚಿಸುವುದು
- Application Insights ಮೂಲಕ ವಿತರಿತ ಅಪ್ಲಿಕೇಶನ್‌ಗಳನ್ನು ಮಾನಿಟರ್ ಮಾಡುವುದು
- ಮೈಕ್ರೋಸರ್ವಿಸಸ್ ನಿಯೋಜನೆ ಮಾದರಿಗಳು ಮತ್ತು ಉತ್ತಮ ಅಭ್ಯಾಸಗಳನ್ನು ಅರ್ಥಮಾಡಿಕೊಳ್ಳುವುದು
- ಸರಳದಿಂದ ಸಂಕೀರ್ಣ ವಾಸ್ತುಶಿಲ್ಪಗಳಿಗೆ ಕ್ರಮೇಣ ವಿಸ್ತರಣೆ ಮಾಡುವುದನ್ನು ಕಲಿಯುವುದು

## ವಾಸ್ತುಶಿಲ್ಪ

### ಹಂತ 1: ನಾವು ಏನು ನಿರ್ಮಿಸುತ್ತಿದ್ದೇವೆ (ಈ ಉದಾಹರಣೆಯಲ್ಲಿ ಸೇರಿದೆ)

```
                    ┌─────────────────────────────┐
                    │         Internet            │
                    └──────────────┬──────────────┘
                                   │
                                   │ HTTPS
                                   │
                    ┌──────────────▼──────────────┐
                    │      API Gateway            │
                    │   (Node.js Container)       │
                    │   - Routes requests         │
                    │   - Health checks           │
                    │   - Request logging         │
                    └──────────────┬──────────────┘
                                   │
                                   │ HTTP (internal)
                                   │
                    ┌──────────────▼──────────────┐
                    │    Product Service          │
                    │   (Python Container)        │
                    │   - Product CRUD            │
                    │   - In-memory data store    │
                    │   - REST API                │
                    └──────────────┬──────────────┘
                                   │
                    ┌──────────────▼──────────────┐
                    │   Application Insights      │
                    │   (Monitoring & Logs)       │
                    └─────────────────────────────┘
```

**ಎ为何 ಸರಳವಾಗಿ ಆರಂಭಿಸಬೇಕು?**
- ✅ ಬೇಗ ನಿಯೋಜಿಸಿ ಮತ್ತು ಅರ್ಥಮಾಡಿಕೊಳ್ಳಿ (25-35 ನಿಮಿಷಗಳು)
- ✅ ಸಂಕೀರ್ಣತೆ ಇಲ್ಲದೆ ಮುಖ್ಯ ಮೈಕ್ರೋಸರ್ವಿಸಸ್ ಮಾದರಿಗಳನ್ನು ಕಲಿಯಿರಿ
- ✅ ನೀವು ಬದಲಾಯಿಸಲು ಮತ್ತು ಪ್ರಯೋಗಿಸಲು ಇರುವ ಕಾರ್ಯನಿರತ ಕೋಡ್
- ✅ ಕಲಿಕೆಗೆ ಕಡಿಮೆ ವೆಚ್ಚ (~$50-100/ತಿಂಗಳು ವಿರುದ್ಧ $300-1400/ತಿಂಗಳು)
- ✅ ಡೇಟಾಬೇಸ್ ಮತ್ತು ಮೆಸೇಜ್ ಕ್ಯೂಗಳನ್ನು ಸೇರಿಸುವ ಮೊದಲು ವಿಶ್ವಾಸವನ್ನು ನಿರ್ಮಿಸಿ

**ಉಪಮೆ**: ಇದನ್ನು ಚಾಲನೆ ಕಲಿಯುವುದಾಗಿ ಭಾವಿಸಿ. ನೀವು ಖಾಲಿ ಪಾರ್ಕಿಂಗ್ ಲಾಟ್ (2 ಸೇವೆಗಳು) ಜೊತೆಗೆ ಆರಂಭಿಸಿ, ಮೂಲಭೂತಗಳನ್ನು ಮಾಸ್ಟರ್ ಮಾಡಿ, ನಂತರ ನಗರ ಸಂಚಾರಕ್ಕೆ (5+ ಸೇವೆಗಳು ಡೇಟಾಬೇಸ್‌ಗಳೊಂದಿಗೆ) ಮುಂದುವರಿಯಿರಿ.

### ಹಂತ 2: ಭವಿಷ್ಯ ವಿಸ್ತರಣೆ (ಸಂದर्भ ವಾಸ್ತುಶಿಲ್ಪ)

ಒಮ್ಮೆ ನೀವು 2-ಸೇವಾ ವಾಸ್ತುಶಿಲ್ಪವನ್ನು ಮಾಸ್ಟರ್ ಮಾಡಿದರೆ, ನೀವು ವಿಸ್ತರಿಸಬಹುದು:

```
Full Architecture (Not Included - For Reference)
├── API Gateway (✅ Included)
├── Product Service (✅ Included)
├── Order Service (🔜 Add next)
├── User Service (🔜 Add next)
├── Notification Service (🔜 Add last)
├── Azure Service Bus (🔜 For async communication)
├── Cosmos DB (🔜 For product persistence)
├── Azure SQL (🔜 For order management)
└── Azure Storage (🔜 For file storage)
```

ಅಂತಿಮಕ್ಕೆ 단계ಶಃ ಸೂಚನೆಗಳಿಗೆ "Expansion Guide" ಭಾಗವನ್ನು ನೋಡಿ.

## ಸೇರಿಸಲಾಗಿರುವ ವೈಶಿಷ್ಟ್ಯಗಳು

✅ **ಸೇವೆ ಕಂಡುಹಿಡಿತ**: ಕಂಟೇನರ್‌ಗಳ ನಡುವಿನ ಸ್ವಯಂಚಾಲಿತ DNS ಆಧಾರಿತ ಕಂಡುಹಿಡಿತ  
✅ **ಲೋಡ್ ಬ್ಯಾಲೆನ್ಸಿಂಗ್**: ರೆಪ್ಲಿಕಾ ಗಳ ನಡುವಿನ ಬಿಲ್ಟ್-ಇನ್ ಲೋಡ್ ಬ್ಯಾಲೆನ್ಸಿಂಗ್  
✅ **ಆಟೋ-ಸ್ಕೇಲಿಂಗ್**: HTTP ವಿನಂತಿಗಳ ಆಧಾರದಿಂದ ಸೇವೆ ಪ್ರತಿ ಸ್ವತಂತ್ರವಾಗಿ ವಿಸ್ತರಿಸುವುದು  
✅ **ಸ್ವಾಸ್ಥ್ಯ ನಿರೀಕ್ಷಣೆ**: ಎರಡೂ ಸೇವೆಗಳಿಗಾಗಿ ಲೈವ್ನೆಸ್ ಮತ್ತು ರೆಡಿನೆಸ್ ಪ್ರೋಬ್‌ಗಳು  
✅ **ವಿತರಿತ ಲಾಗಿಂಗ್**: Application Insights ಮೂಲಕ ಕೇಂದ್ರಿಕೃತ ಲಾಗಿಂಗ್  
✅ **ಆಂತರಿಕ ನೆಟ್ವರ್ಕಿಂಗ್**: ಭದ್ರ ಸೇವೆ-ಸೇವೆ ಸಂವಹನ  
✅ **ಕಂಟೇನರ್ ಸಂಘಟನೆ**: ಸ್ವಯಂಚಾಲಿತ ನಿಯೋಜನೆ ಮತ್ತು ಸ್ಕೇಲಿಂಗ್  
✅ **ಶೂನ್ಯ-ಡೌನಟೈಮ್ ಅಪ್ಡೇಟ್‌ಗಳು**: ರಿವಿಷನ್ ನಿರ್ವಹಣೆಯೊಂದಿಗೆ ರೋಲಿಂಗ್ ಅಪ್ಡೇಟ್ಸ್  

## ಪೂರ್ವಾಪೇಕ್ಷೆಗಳು

### ಅಗತ್ಯಕಾರಿಯಾದ ಉಪಕರಣಗಳು

ಆರಂಭಿಸುವ ಮೊದಲು, ನೀವು ಈ ಉಪಕರಣಗಳನ್ನು ಹೊಂದಿರುವುದನ್ನು ಪರಿಶೀಲಿಸಿ:

1. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (ಆವೃತ್ತಿ 1.0.0 ಅಥವಾ ಮೇಲ್ಪಟ್ಟು)
   ```bash
   azd version
   # ನಿರೀಕ್ಷಿತ ಫಲಿತಾಂಶ: azd ಆವೃತ್ತಿ 1.0.0 ಅಥವಾ ಹೆಚ್ಚಿನ ಆವೃತ್ತಿ
   ```

2. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (ಆವೃತ್ತಿ 2.50.0 ಅಥವಾ ಮೇಲ್ಪಟ್ಟು)
   ```bash
   az --version
   # ನಿರೀಕ್ಷಿತ ಫಲಿತಾಂಶ: azure-cli 2.50.0 ಅಥವಾ ಅದಕ್ಕಿಂತ ಹೆಚ್ಚಿನ ಆವೃತ್ತಿ
   ```

3. **[Docker](https://www.docker.com/get-started)** (ಸ್ಥಾನಿಕ ಅಭಿವೃದ್ಧಿ/ಪರೀಕ್ಷಣೆಗಾಗಿ - ಐಚ್ಛಿಕ)
   ```bash
   docker --version
   # ನಿರೀಕ್ಷಿತ ಫಲಿತಾಂಶ: Docker ಆವೃತ್ತಿ 20.10 ಅಥವಾ ಅದಕ್ಕಿಂತ ಮೇಲಿನದು
   ```

### Azure ಅಗತ್ಯಗಳು

- ಸಕ್ರಿಯ **Azure subscription** ([create a free account](https://azure.microsoft.com/free/))
- ನಿಮ್ಮ ಸಬ್‌ಸ್ಕ್ರಿಪ್ಶನ್‌ನಲ್ಲಿ ಸಂಪನ್ಮೂಲಗಳನ್ನು ರಚಿಸಲು ಅನುಮತಿಗಳು
- ಸಬ್‌ಸ್ಕ್ರಿಪ್ಶನ್ ಅಥವಾ ರಿಸೋರ್ಸ್ ಗ್ರೂಪ್ ಮೇಲೆ **Contributor** ಪಾತ್ರ

### ಜ್ಞಾನದ ಪೂರ್ವಾಪೇಕ್ಷೆಗಳು

ಇದು **ಉನ್ನತ-ಮಟ್ಟದ** ಉದಾಹರಣೆ. ನಿಮಗೆ ಹೊಂದಿರುವುದಾಗಿರಬೇಕು:
- [Simple Flask API example](../../../../../examples/container-app/simple-flask-api) ಅನ್ನು ಪೂರ್ಣಗೊಳಿಸಿದ್ದಿರಬೇಕು
- ಮೈಕ್ರೋಸರ್ವಿಸಸ್ ವಾಸ್ತುಶಿಲ್ಪದ ಮೂಲಭೂತ ಅರ್ಥವನ್ನು ಹೊಂದಿರಬೇಕು
- REST API ಗಳು ಮತ್ತು HTTP ಬಗ್ಗೆ ಪರಿಚಯ
- ಕಂಟೇನರ್ ಸಂಯೋಜನೆಗಳ ಅರಿವು

**Container Apps ಗೆ ಹೊಸದಾಗಿ ಇದಿರಾ?** ಮೂಲಭೂತಗಳನ್ನು ಕಲಿಯಲು ಮೊದಲು [Simple Flask API example](../../../../../examples/container-app/simple-flask-api) ಅನ್ನು ಆರಂಭಿಸಿ.

## ವೇಗದ ಪ್ರಾರಂಭ (ಹಂತದימום)

### ಹಂತ 1: ಕ್ಲೋನ್ ಮಾಡಿ ಮತ್ತು ನ್ಯಾವಿಗೇಟ್ ಮಾಡಿ

```bash
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/container-app/microservices
```

**✓ ಯಶಸ್ಸಿನ ಪರಿಶೀಲನೆ**: ನೀವು `azure.yaml` ಕಾಣುತ್ತಿರುವುದನ್ನು ಪರಿಶೀಲಿಸಿ:
```bash
ls
# ನಿರೀಕ್ಷಿಸಲಾಗಿದೆ: README.md, azure.yaml, infra/, src/
```

### ಹಂತ 2: Azure ಗೆ ಪ್ರಮಾಣೀಕರಣ ಮಾಡಿ

```bash
azd auth login
```

ಇದು ನಿಮ್ಮ ಬ್ರೌಸರ್ ಅನ್ನು Azure ಪ್ರಮಾಣೀಕರಣಕ್ಕೆ ತೆರೆಯುತ್ತದೆ. ನಿಮ್ಮ Azure ಪ್ರಮಾಣಪತ್ರಗಳಿಂದ ಸೈನ್ ಇನ್ ಮಾಡಿ.

**✓ ಯಶಸ್ಸಿನ ಪರಿಶೀಲನೆ**: ನೀವು ಇದು ಕಾಣಬೇಕು:
```
Logged in to Azure.
```

### ಹಂತ 3: ಪರಿಸರವನ್ನು ಪ್ರಾರಂಭಿಸಿ

```bash
azd init
```

**ನೀವು ನೋಡಲಿರುವ ಪ್ರಾಂಪ್ಟ್ಗಳು**:
- **ಪರಿಸರದ ಹೆಸರು**:ಸಣ್ಣ ಹೆಸರು ನಮೂದಿಸಿ (ಉದಾ., `microservices-dev`)
- **Azure subscription**: ನಿಮ್ಮ subscription ಆಯ್ಕೆಮಾಡಿ
- **Azure ಸ್ಥಳ**: ಪ್ರಾಂತ್ಯ ಆಯ್ಕೆಮಾಡಿ (ಉದಾ., `eastus`, `westeurope`)

**✓ ಯಶಸ್ಸಿನ ಪರಿಶೀಲನೆ**: ನೀವು ಇದು ಕಾಣಬೇಕು:
```
SUCCESS: New project initialized!
```

### ಹಂತ 4: ಮೂಲಸೌಕರ್ಯ ಮತ್ತು ಸೇವೆಗಳನ್ನು ನಿಯೋಜಿಸಿ

```bash
azd up
```

**ಏನಾಗುತ್ತದೆ** (8-12 ನಿಮಿಷಗಳು ತೆಗೆದುಕೊಳ್ಳಬಹುದು):
1. Container Apps ಪರಿಸರವನ್ನು ಸೃಷ್ಟಿಸುತ್ತದೆ
2. ಮಾನಿಟರಿಂಗ್ కోసం Application Insights ಅನ್ನು ಸೃಷ್ಟಿಸುತ್ತದೆ
3. API ಗೇಟ್ವೇ ಕಂಟೇನರ್ (Node.js) ಅನ್ನು ಬಿಲ್ಡ್ ಮಾಡುತ್ತದೆ
4. Product Service ಕಂಟೇನರ್ (Python) ಅನ್ನು ಬಿಲ್ಡ್ ಮಾಡುತ್ತದೆ
5. ಎರಡೂ ಕಂಟೇನರ್‌ಗಳನ್ನು Azure ಗೆ ನಿಯೋಜಿಸುತ್ತದೆ
6. ನೆಟ್ವರ್ಕಿಂಗ್ ಮತ್ತು ಆರೋಗ್ಯ ತಪಾಸಣೆಗಳನ್ನು ಕಾನ್ಫಿಗರ್ ಮಾಡುತ್ತದೆ
7. ಮಾನಿಟರಿಂಗ್ ಮತ್ತು ಲಾಗಿಂಗ್ ಅನ್ನು ಸೆಟ್ ಅಪ್ ಮಾಡುತ್ತದೆ

**✓ ಯಶಸ್ಸಿನ ಪರಿಶೀಲನೆ**: ನೀವು ಇದು ಕಾಣಬೇಕು:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
Endpoint: https://api-gateway-<unique-id>.azurecontainerapps.io
```

**⏱️ ಸಮಯ**: 8-12 ನಿಮಿಷಗಳು

### ಹಂತ 5: ನಿಯೋಜನೆಯನ್ನು ಪರೀಕ್ಷಿಸಿ

```bash
# ಗೇಟ್ವೇ ಎಂಡ್‌ಪಾಯಿಂಟ್ ಪಡೆಯಿರಿ
GATEWAY_URL=$(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')

# API ಗೇಟ್ವೇ ಆರೋಗ್ಯವನ್ನು ಪರೀಕ್ಷಿಸಿ
curl $GATEWAY_URL/health

# ನಿರೀಕ್ಷಿತ ಔಟ್‌ಪುಟ್:
# {"ಸ್ಥಿತಿ":"ಆರೋಗ್ಯವಂತ","ಸೇವೆ":"API ಗೇಟ್ವೇ","ಟೈಮ್‌ಸ್ಟ್ಯಾಂಪ್":"2025-11-19T10:30:00Z"}
```

**ಗೇಟ್ವೇ ಮೂಲಕ ಉತ್ಪನ್ನ ಸೇವೆಯನ್ನು ಪರಿಶೀಲಿಸಿ**:
```bash
# ಉತ್ಪನ್ನಗಳನ್ನು ಪಟ್ಟಿ ಮಾಡಿ
curl $GATEWAY_URL/api/products

# ನಿರೀಕ್ಷಿತ ಫಲಿತಾಂಶ:
# [
#   {"id":1,"name":"ಲ್ಯಾಪ್‌ಟಾಪ್","price":999.99,"stock":50},
#   {"id":2,"name":"ಮೌಸ್","price":29.99,"stock":200},
#   {"id":3,"name":"ಕೀಬೋರ್ಡ್","price":79.99,"stock":150}
# ]
```

**✓ ಯಶಸ್ಸಿನ ಪರಿಶೀಲನೆ**: ಎರಡೂ ಎಂಡ್ಪಾಯಿಂಟ್‌ಗಳು ದೋಷವಿಲ್ಲದೆ JSON ಡೇಟಾವನ್ನು_Return ಮಾಡುತ್ತವೆ.

---

**🎉 ಅಭಿನಂದನೆಗಳು!** ನೀವು Azure ಗೆ ಮೈಕ್ರೋಸರ್ವಿಸಸ್ ವಾಸ್ತುಶಿಲ್ಪವನ್ನು ನಿಯೋಜಿಸಿದ್ದೀರಿ!

## ಯೋಜನಾ ರಚನೆ

ಎಲ್ಲಾ ಅನುಷ್ಠಾನ ಫೈಲ್‌ಗಳು ಸೇರಿವೆ—ಇದು ಸಂಪೂರ್ಣ, ಕಾರ್ಯನಿರತ ಉದಾಹರಣೆ:

```
microservices/
│
├── README.md                         # This file
├── azure.yaml                        # AZD configuration
├── .gitignore                        # Git ignore patterns
│
├── infra/                           # Infrastructure as Code (Bicep)
│   ├── main.bicep                   # Main orchestration
│   ├── abbreviations.json           # Naming conventions
│   ├── core/                        # Shared infrastructure
│   │   ├── container-apps-environment.bicep  # Container environment + registry
│   │   └── monitor.bicep            # Application Insights + Log Analytics
│   └── app/                         # Service definitions
│       ├── api-gateway.bicep        # API Gateway container app
│       └── product-service.bicep    # Product Service container app
│
└── src/                             # Application source code
    ├── api-gateway/                 # Node.js API Gateway
    │   ├── app.js                   # Express server with routing
    │   ├── package.json             # Node dependencies
    │   └── Dockerfile               # Container definition
    └── product-service/             # Python Product Service
        ├── main.py                  # Flask API with product data
        ├── requirements.txt         # Python dependencies
        └── Dockerfile               # Container definition
```

**ಪ್ರತಿ ಘಟಕ ಏನು ಮಾಡುತ್ತದೆ:**

**Infrastructure (infra/)**:
- `main.bicep`: ಎಲ್ಲಾ Azure ಸಂಪನ್ಮೂಲಗಳು ಮತ್ತು ಅವುಗಳ ಅವಲಂಬನೆಗಳನ್ನು ಸಮನ್ವಯಗೊಳಿಸುತ್ತದೆ
- `core/container-apps-environment.bicep`: Container Apps ಪರಿಸರ ಮತ್ತು Azure Container Registry ಸೃಷ್ಟಿಸುತ್ತದೆ
- `core/monitor.bicep`: ವಿತರಿತ ಲಾಗಿಂಗ್ ಗಾಗಿ Application Insights ಸೆಟ್ ಮಾಡುತ್ತದೆ
- `app/*.bicep`: ಸ್ಕೇಲಿಂಗ್ ಮತ್ತು ಆರೋಗ್ಯ ತಪಾಸಣೆಗಳೊಂದಿಗೆ ವ್ಯಕ್ತಿಗತ container app ವ್ಯಾಖ್ಯಾನಗಳು

**API Gateway (src/api-gateway/)**:
- ಸಾರ್ವಜನಿಕಮುಖಿ ಸೇವೆ, ಬ್ಯಾಕ್‌ಎಂಡ್ ಸೇವೆಗಳಿಗೆ ವಿನಂತಿಗಳನ್ನು ಮಾರ್ಗದರ್ಶನ ಮಾಡುತ್ತದೆ
- ಲಾಗಿಂಗ್, ದೋಷ ನಿರ್ವಹಣೆ ಮತ್ತು ವಿನಂತಿ ಫಾರ್ವಾರ್ಡಿಂಗ್ ಅನ್ನು ಅನುಷ್ಠಾನಗೊಳಿಸುತ್ತದೆ
- ಸೇವೆ-ಸೇವೆ HTTP ಸಂವಹನವನ್ನು ಪ್ರದರ್ಶಿಸುತ್ತದೆ

**Product Service (src/product-service/)**:
- ಕೇವಲ ಸೌಕರ್ಯಕ್ಕಾಗಿ ಇನ್-ಮೆಮೊರಿ ಉತ್ಪನ್ನ ಕ್ಯಾಟಲಾಗ್ ಹೊಂದಿರುವ ಆಂತರಿಕ ಸೇವೆ
- REST API ಮತ್ತು ಹ سلامت ತಪಾಸಣೆಗಳು
- ಬ್ಯಾಕ್‌ಎಂಡ್ ಮೈಕ್ರೋಸರ್ವಿಸ್ ಮಾದರಿಯ ಉದಾಹರಣೆ

## ಸೇವೆಗಳ ಅವಲೋಕನ

### API Gateway (Node.js/Express)

**Port**: 8080  
**Access**: ಸಾರ್ವಜನಿಕ (external ingress)  
**ಉದ್ದೇಶ**: ಒಳಬರುವ ವಿನಂತಿಗಳನ್ನು ಸಂಬಂಧಿತ ಬ್ಯಾಕ್‌ಎಂಡ್ ಸೇವೆಗಳಿಗೆ ಮಾರ್ಗದರ್ಶಿಸುವುದು  

**ಎಂಡ್ಪಾಯಿಂಟ್‌ಗಳು**:
- `GET /` - ಸೇವೆ ಮಾಹಿತಿ
- `GET /health` - ಆರೋಗ್ಯ ಪರೀಕ್ಷಾ ಎಂಡ್ಪಾಯಿಂಟ್
- `GET /api/products` - product service ಕ್ಕೆ ಫಾರ್ವರ್ಡ್ (ಎಲ್ಲಾವನ್ನು ಪಟ್ಟಿ ಮಾಡಿ)
- `GET /api/products/:id` - product service ಕ್ಕೆ ಫಾರ್ವರ್ಡ್ (ID ಆಧಾರಿತ ಪ್ರಾಪ್ತಿ)

**ಪ್ರಮುಖ ವೈಶಿಷ್ಟ್ಯಗಳು**:
- axios ಮೂಲಕ ವಿನಂತಿ ಮಾರ್ಗದರ್ಶನ
- ಕೇಂದ್ರಿಕೃತ ಲಾಗಿಂಗ್
- ದೋಷ ನಿರ್ವಹಣೆ ಮತ್ತು ಟೈಮೌಟ್ ನಿರ್ವಹಣೆ
- ಪರಿಸರ ಚರಗಳ ಮೂಲಕ ಸೇವೆ ಕಂಡುಹಿಡಿತ
- Application Insights ಏಕೀಕರಣ

**ಕೋಡ್ ಹೈಲೈಟ್** (`src/api-gateway/app.js`):
```javascript
// ಆಂತರಿಕ ಸೇವಾ ಸಂವಹನ
app.get('/api/products', async (req, res) => {
  const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
  res.json(response.data);
});
```

### Product Service (Python/Flask)

**Port**: 8000  
**Access**: ಆಂತರಿಕ ಮಾತ್ರ (ಬಾಹ್ಯ ಇನ್ಗ್ರೆಸ್ಸಿಲ್ಲ)  
**ಉದ್ದೇಶ**: ಇನ್-ಮೆಮೊರಿ ಡೇಟಾ ಬಳಸಿ ಉತ್ಪನ್ನ ಕ್ಯಾಟಲಾಗ್ ನಿರ್ವಹಣೆ  

**ಎಂಡ್ಪಾಯಿಂಟ್‌ಗಳು**:
- `GET /` - ಸೇವೆ ಮಾಹಿತಿ
- `GET /health` - ಆರೋಗ್ಯ ಪರೀಕ್ಷಾ ಎಂಡ್ಪಾಯಿಂಟ್
- `GET /products` - ಎಲ್ಲಾ ಉತ್ಪನ್ನಗಳನ್ನು ಪಟ್ಟಿ ಮಾಡಿ
- `GET /products/<id>` - ID ಮೂಲಕ ಉತ್ಪನ್ನವನ್ನು ಪಡೆಯಿರಿ

**ಪ್ರಮುಖ ವೈಶಿಷ್ಟ್ಯಗಳು**:
- Flask ಮೂಲಕ RESTful API
- ಸರಳ ಇನ್-ಮೆಮೊರಿ ಉತ್ಪನ್ನ ಸ್ಟೋರ್ (ಡೇಟಾಬೇಸ್ ಅಗತ್ಯವಿಲ್ಲ)
- ಪ್ರೋಬ್‌ಗಳೊಂದಿಗೆ ಆರೋಗ್ಯ ಮಾನಿಟರಿಂಗ್
- ಸಂರಚಿತ ಲಾಗಿಂಗ್
- Application Insights ಏಕೀಕರಣ

**ಡೇಟಾ ಮಾದರಿ**:
```python
{
  "id": 1,
  "name": "Laptop",
  "description": "High-performance laptop",
  "price": 999.99,
  "stock": 50
}
```

**ಆಂತರಿಕ ಮಾತ್ರ ಏಕೆ?**
Product Service ಸಾರ್ವಜನಿಕವಾಗಿ ಬಹಿರಂಗವಾಗಿಲ್ಲ. ಎಲ್ಲ ವಿನಂತಿಗಳು API ಗೇಟ್ವೇ ಮೂಲಕಲೇ ಬರುವುದು, ಇದು ನೀಡುವುದು:
- ಭದ್ರತೆ: ನಿಯಂತ್ರಿತ ಪ್ರವೇಶ ಬಿಂದು
- ಸ್ಥಿತಿಸ್ಥಾಪಕತೆ: ಬ್ಯಾಕ್‌ಎಂಡ್ ಬದಲಾದರೂ ಕ್ಲೈಂಟ್ ಮೇಲೆ ಪ್ರಭಾವ ಬರುವುದಿಲ್ಲ
- ಮಾನಿಟರಿಂಗ್: ಕೇಂದ್ರಿಕೃತ ವಿನಂತಿ ಲಾಗಿಂಗ್

## ಸೇವೆ ಸಂವಹನವನ್ನು ಅರ್ಥಮಾಡಿಕೊಳ್ಳುವುದು

### ಸೇವೆಗಳು ಹೇಗೆ parಸಂವಾದಿಸುತ್ತವೆ

ಈ ಉದಾಹರಣೆಯಲ್ಲಿ, API ಗೇಟ್ವೇ Product Service ನೊಂದಿಗೆ ಸಂಪರ್ಕ establishes ಮಾಡುವುದಕ್ಕೆ **ಆಂತರಿಕ HTTP ಕಾಲ್‌ಗಳು** ಬಳಸುತ್ತದೆ:

```javascript
// API ಗೇಟ್‌ವೇ (src/api-gateway/app.js)
const PRODUCT_SERVICE_URL = process.env.PRODUCT_SERVICE_URL;

// ಆಂತರಿಕ HTTP ವಿನಂತಿ ಮಾಡಿ
const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
```

**ಮುಖ್ಯ ಅಂಶಗಳು**:

1. **DNS-ಆಧಾರಿತ ಕಂಡುಹಿಡಿತ**: Container Apps ಸ್ವಯಂಚಾಲಿತವಾಗಿ ಆಂತರಿಕ ಸೇವೆಗಳಿಗೆ DNS ಒದಗಿಸುತ್ತದೆ
   - Product Service FQDN: `product-service.internal.<environment>.azurecontainerapps.io`
   - ಸರಳೀಕೃತವಾಗಿ: `http://product-service` (Container Apps ಇದು ಬಗೆಹರಿಸುತ್ತದೆ)

2. **ಯಾವುದೇ ಸಾರ್ವಜನಿಕ ಅಪ್‌ಶೋರ್ ಇಲ್ಲ**: Product Service ನಲ್ಲಿ Bicep ನಲ್ಲಿ `external: false` ಇದೆ
   - ಮಾತ್ರ Container Apps ಪರಿಸರದ ಒಳಗೆ ಲಭ್ಯ
   - ಇಂಟರ್ನೆಟ್ನಿಂದ ತಲುಪಲಾಗುವುದಿಲ್ಲ

3. **ಪರಿಸರ ಚರಗಳು**: ಸೇವೆ URL ಗಳು ನಿಯೋಜನಾ ಸಮಯದಲ್ಲಿ ಇಂಜೆಕ್ಟ್ ಆಗುತ್ತವೆ
   - Bicep ಗೇಟ್ವೇಗೆ ಆಂತರಿಕ FQDN ಅನ್ನು ಪಾಸ್ ಮಾಡುತ್ತದೆ
   - ಅಪ್ಲಿಕೇಶನ್ ಕೋಡ್‌ನಲ್ಲಿ ಹಾರ್ಡ್‌ಕೋಡಡ್ URL ಗಳಿಲ್ಲ

**ಉಪಮೆ**: ಇದನ್ನು ಕಚೇರಿ ಕೋಣೆಗಳಂತೆ ಭಾವಿಸಿ. API ಗೇಟ್ವೇ ರಿಸೆಪ್‌ಶನ್ ಡೆಸ್ಕ್ (ಸಾರ್ವಜನಿಕ-ಮುಖಿ) ಹೀಗಿದ್ದು, Product Service ಒಂದು ಕಚೇರಿ ಕೊಠಡಿ (ಆಂತರಿಕ ಮಾತ್ರ). ಭೇಟಿ ಮಾಡುವವರು ಯಾವುದೇ ಕಚೇರಿಗೆ ಸೇರಲು ರಿಸೆಪ್‌ಶನ್ ಮೂಲಕ ಹೋಗಬೇಕು.

## ನಿಯೋಜನೆ ಆಯ್ಕೆಗಳು

### ಸಂಪೂರ್ಣ ನಿಯೋಜನೆ (ಶಿಫಾರಸು ಮಾಡಲಾಗಿದೆ)

```bash
# ಇನ್‌ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ಮತ್ತು ಎರಡೂ ಸೇವೆಗಳನ್ನು ನಿಯೋಜಿಸಿ
azd up
```

ಇದು ನಿಯೋಜಿಸುತ್ತದೆ:
1. Container Apps ಪರಿಸರ
2. Application Insights
3. Container Registry
4. API ಗೇಟ್ವೇ ಕಂಟೇನರ್
5. Product Service ಕಂಟೇನರ್

**ಸಮಯ**: 8-12 ನಿಮಿಷಗಳು

### ವೈಯಕ್ತಿಕ ಸೇವೆಯನ್ನು ನಿಯೋಜಿಸಿ

```bash
# ಒಂದು ಸೇವೆ ಮಾತ್ರ ನಿಯೋಜಿಸಿ (ಆರಂಭಿಕ azd up ನಂತರ)
azd deploy api-gateway

# ಅಥವಾ ಉತ್ಪನ್ನ ಸೇವೆಯನ್ನು ನಿಯೋಜಿಸಿ
azd deploy product-service
```

**ಬಳಕೆ ಪ್ರಕರಣ**: ನೀವು ಒಂದು ಸೇವೆಯಲ್ಲಿ ಕೋಡ್ ಅನ್ನು ಅಪ್ಡೇಟ್ ಮಾಡಿ ಅದರನ್ನೇ ಮಾತ್ರ ಪುನರ್‌ನಿಯೋಜನೆ ಮಾಡಬೇಕಾದರೆ.

### ಸಂರಚನೆಯನ್ನು ಅಪ್ಡೇಟ್ ಮಾಡಿ

```bash
# ಸ್ಕೆಲಿಂಗ್ ಪ್ಯಾರಾಮೀಟರ್‌ಗಳನ್ನು ಬದಲಿಸಿ
azd env set GATEWAY_MAX_REPLICAS 30

# ಹೊಸ ಸಂರಚನೆಯೊಂದಿಗೆ ಮರುನಿಯೋಜಿಸಿ
azd up
```

## ಸಂರಚನೆ

### ಸ್ಕೇಲಿಂಗ್ ಸಂರಚನೆ

ಎರಡೂ ಸೇವೆಗಳು ತಮ್ಮ Bicep ಫೈಲ್‌ಗಳಲ್ಲಿ HTTP ಆಧಾರಿತ autoscaling ಜೊತೆಯಾಗಿ ಸಂರಚಿಸಲಾಗಿವೆ:

**API Gateway**:
- ಕನಿಷ್ಟ ರೆಪ್ಲಿಕಾ: 2 (ಪ್ರಾಪ್ತತೆಗೆ ಸದಾ ಕನಿಷ್ಠ 2)
- ಗರಿಷ್ಠ ರೆಪ್ಲಿಕಾ: 20
- ಸ್ಕೇಲ್ ಟ್ರಿಗರ್: ಪ್ರತಿ ರೆಪ್ಲಿಕಾವೇ 50 ಸಂವೃತ್ತಿ ವಿನಂತಿಗಳು

**Product Service**:
- ಕನಿಷ್ಟ ರೆಪ್ಲಿಕಾ: 1 (ಅವಶ್ಯಕತೆ ಇದ್ದರೆ ಶೂನ್ಯಕ್ಕೆ ಸ್ಕೇಲ್ ಆಗಬಹುದು)
- ಗರಿಷ್ಠ ರೆप್ಲಿಕಾ: 10
- ಸ್ಕೇಲ್ ಟ್ರಿಗರ್: ಪ್ರತಿ ರೆಪ್ಲಿಕಾವೇ 100 ಸಂವೃತ್ತಿ ವಿನಂತಿಗಳು

**ಸ್ಕೇಲಿಂಗ್ ಕಸ್ಟಮೈಸ್ ಮಾಡುವುದು** (in `infra/app/*.bicep`):
```bicep
scale: {
  minReplicas: 1
  maxReplicas: 10
  rules: [
    {
      name: 'http-scale-rule'
      http: {
        metadata: {
          concurrentRequests: '100'  // Adjust this
        }
      }
    }
  ]
}
```

### ಸಂಪನ್ಮೂಲ ನಿಯೋಜನೆ

**API Gateway**:
- CPU: 1.0 vCPU
- ಮೆಮೊರಿ: 2 GiB
- ಕಾರಣ: ಎಲ್ಲಾ ಹೊರಗಿನ ಟ್ರಾಫ Fic ಅನ್ನು ನಿರ್ವಹಿಸುತ್ತದೆ

**Product Service**:
- CPU: 0.5 vCPU
- ಮೆಮೊರಿ: 1 GiB
- ಕಾರಣ: ತೂಕದಿಲ್ಲದ ಇನ್-ಮೆಮೊರಿ ಕಾರ್ಯಾಚರಣೆಗಳು

### ಆರೋಗ್ಯ ತಪಾಸಣೆಗಳು

ಎರಡೂ ಸೇವೆಗಳಲ್ಲಿ ಲೈವ್ನೆಸ್ ಮತ್ತು ರೆಡಿನೆಸ್ ಪ್ರೋಬ್‌ಗಳು ಸೇರಿವೆ:

```bicep
probes: [
  {
    type: 'Liveness'
    httpGet: {
      path: '/health'
      port: 8080
    }
    initialDelaySeconds: 10
    periodSeconds: 30
  }
  {
    type: 'Readiness'
    httpGet: {
      path: '/health'
      port: 8080
    }
    initialDelaySeconds: 5
    periodSeconds: 10
  }
]
```

**ಇದರಿಂದ ಅರ್ಥ ಏನು**:
- **ಲೈವ್ನೆಸ್**: ಆರೋಗ್ಯ ತಪಾಸಣೆ ವಿಫಲವಾದರೆ, Container Apps ಕಂಟೇನರ್ ಅನ್ನು ಮರುಪ್ರಾರಂಭಿಸುತ್ತದೆ
- **ರೆಡಿನೆಸ್**: ಸಿದ್ಧವಾಗದಿದ್ದರೆ, Container Apps ಆ ರೆಪ್ಲಿಕಾದತ್ತ ಟ್ರಾಫಿಕ್ ರೌಟ್ ಮಾಡುತ್ತಿಲ್ಲ



## ಮಾನಿಟರಿಂಗ್ ಮತ್ತು ಅಬ್ಬಲಿಗೋಚನೀಯತೆ

### ಸೇವೆ ಲಾಗ್‌ಗಳ ವೀಕ್ಷಣೆ

```bash
# azd monitor ಬಳಸಿ ಲಾಗ್‌ಗಳನ್ನು ವೀಕ್ಷಿಸಿ
azd monitor --logs

# ಅಥವಾ ನಿರ್ದಿಷ್ಟ ಕಂಟೈನರ್ ಅಪ್ಲಿಕೇಶನ್‌ಗಳಿಗೆ Azure CLI ಅನ್ನು ಬಳಸಿ:
# API ಗೇಟ್ವೇಯಿಂದ ಲಾಗ್‌ಗಳನ್ನು ಸ್ಟ್ರೀಮ್ ಮಾಡಿ
az containerapp logs show --name api-gateway --resource-group $RG_NAME --follow

# ಉತ್ಪನ್ನ ಸೇವೆಗಳ ಇತ್ತೀಚಿನ ಲಾಗ್‌ಗಳನ್ನು ವೀಕ್ಷಿಸಿ
az containerapp logs show --name product-service --resource-group $RG_NAME --tail 100
```

**ನಿರೀಕ್ಷಿತ ಔಟ್‌ಪುಟ್**:
```
[api-gateway] API Gateway listening on port 8080
[api-gateway] Product Service URL: http://product-service
[api-gateway] GET /api/products 200 - 45ms
[product-service] Retrieved 5 products
```

### Application Insights ಕ್ವೆರಿಗಳು

Azure ಪೋರ್ಟಲ್‌ನಲ್ಲಿ Application Insights ಗೆ ಪ್ರವೇಶಿಸಿ, ನಂತರ ಈ ಕ್ವೆರಿಗಳನ್ನು ರನ್ ಮಾಡಿ:

**ಸ್ಲೋ ವಿನಂತಿಗಳನ್ನು ಹುಡುಕು**:
```kusto
requests
| where timestamp > ago(1h)
| where duration > 1000  // Requests taking >1 second
| summarize count() by name, cloud_RoleName
| order by count_ desc
```

**ಸೇವೆ-ಸೇವೆ ಕರೆಗಳನ್ನು ಟ್ರ್ಯಾಕ್ ಮಾಡಿ**:
```kusto
dependencies
| where timestamp > ago(1h)
| where type == "Http"
| project timestamp, name, target, duration, success
| order by timestamp desc
```

**ಸೇವೆಯನುದೇ ದೋಷ ದರ**:
```kusto
exceptions
| where timestamp > ago(24h)
| summarize errorCount = count() by cloud_RoleName, type
| order by errorCount desc
```

**ಕಾಲಾನುಗತ ವಿನಂತಿ ಪ್ರಮಾಣ**:
```kusto
requests
| where timestamp > ago(1h)
| summarize requestCount = count() by bin(timestamp, 5m), cloud_RoleName
| render timechart
```

### ಮಾನಿಟರಿಂಗ್ ಡ್ಯಾಶ್‌ಬೋರ್ಡ್ ಪ್ರವೇಶ

```bash
# Application Insights ವಿವರಗಳನ್ನು ಪಡೆಯಿ
azd env get-values | grep APPLICATIONINSIGHTS

# Azure ಪೋರ್ಟಲ್‌ನಲ್ಲಿ ನಿರೀಕ್ಷಣೆಯನ್ನು ತೆರೆಯಿ
az monitor app-insights component show \
  --app $(azd env get-values | grep APPLICATIONINSIGHTS_CONNECTION_STRING | cut -d '=' -f2) \
  --resource-group $(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2) \
  --query "appId" -o tsv
```

### ಲೈವ್ ಮೆಟ್ರಿಕ್ಸ್

1. Azure ಪೋರ್ಟಲ್‌ನಲ್ಲಿ Application Insights ಗೆ ಹೋಗಿ
2. "Live Metrics" ಮೇಲೆ ಕ್ಲಿಕ್ ಮಾಡಿ
3. ನೈಋತ್ಯ-ಕಾಲಿನ ವಿನಂತಿಗಳು, ವೈಫಲ್ಯಗಳು ಮತ್ತು ಕಾರ್ಯಕ್ಷಮತೆಯನ್ನು ನೋಡಿ
4. ಪ್ರಯೋಗಕ್ಕಾಗಿ ಓಡಿಸಿ: `curl $(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')/api/products`

## ಪ್ರಾಯೋಗಿಕ ಅಭ್ಯಾಸಗಳು

[Note: See full exercises above in the "Practical Exercises" section for detailed step-by-step exercises including deployment verification, data modification, autoscaling tests, error handling, and adding a third service.]

## ವೆಚ್ಚ ವಿಶ್ಲೇಷಣೆ

### ಅಂದಾಜು ಮಾಸಿಕ ವೆಚ್ಚಗಳು (ಈ 2-ಸೇವಾ ಉದಾಹರಣೆಗೆ)

| Resource | Configuration | Estimated Cost |
|----------|--------------|----------------|
| API Gateway | 2-20 replicas, 1 vCPU, 2GB RAM | $30-150 |
| Product Service | 1-10 replicas, 0.5 vCPU, 1GB RAM | $15-75 |
| Container Registry | Basic tier | $5 |
| Application Insights | 1-2 GB/month | $5-10 |
| Log Analytics | 1 GB/month | $3 |
| **ಮೊತ್ತ** | | **$58-243/month** |

**ಬಳಕೆ ಆಧಾರಿತ ವೆಚ್ಚ ವಿಭಾಗ**:
- **ಕಳೆಗಣಿಕೆಯ ಟ್ರಾಫಿಕ್** (ಪರೀಕ್ಷೆ/ಕಲಿಕೆ): ~$60/ತಿಂಗಳು
- **ಮಧ್ಯಮ ಟ್ರಾಫಿಕ್** (ಸಣ್ಣ ಉತ್ಪಾದನೆ): ~$120/ತಿಂಗಳು
- **ಹೆಚ್ಚು ಟ್ರಾಫಿಕ್** ( ಬ್ಯುಸೀ ಪೀರಿಯಡ್‌ಗಳು): ~$240/ತಿಂಗಳು

### ವೆಚ್ಚವನ್ನು ಸಮರ್ಥವಾಗಿ ಕಡಿಮೆ ಮಾಡುವ ಸಲಹೆಗಳು

1. **ವಿಕಸನಕ್ಕಾಗಿ ಶೂನ್ಯಕ್ಕೆ ಸ್ಕೇಲ್ ಮಾಡಿರಿ**:
   ```bicep
   scale: {
     minReplicas: 0  // Save $30-40/month when not in use
     maxReplicas: 10
   }
   ```

2. **Cosmos DB ಗೆ Consumption Plan ಬಳಸಿ** (ನೀವು ಅದನ್ನು ಸೇರಿಸುವಾಗ):
   - ನೀವು ಬಳಸಿದಷ್ಟು ಮಾತ್ರ ಪಾವತಿಸಿ
   - ಕನಿಷ್ಟ ಶುಲ್ಕ ಇರುವುದಿಲ್ಲ

3. **Application Insights ಸ್ಯಾಂಪ್ಲಿಂಗ್ ಸೆಟ್ ಮಾಡಿ**:
   ```javascript
   appInsights.defaultClient.config.samplingPercentage = 50; // ವಿನಂತಿಗಳ 50% ಅನ್ನು ಆಯ್ಕೆ ಮಾಡಿ
   ```

4. **ಅವಶ್ಯಕವಿಲ್ಲದಾಗ ಸ್ವಚ್ಛಗೊಳಿಸಿ**:
   ```bash
   azd down
   ```

### ಉಚಿತ ಟಿಯರ್ ಆಯ್ಕೆಗಳು
For learning/testing, consider:
- Use Azure free credits (first 30 days)
- Keep to minimum replicas
- Delete after testing (no ongoing charges)

---

## ಶುದ್ಧೀಕರಣ

To avoid ongoing charges, delete all resources:

```bash
azd down --force --purge
```

**ದೃಢೀಕರಣ ಪ್ರಾಂಪ್ಟ್**:
```
? Total resources to delete: 6, are you sure you want to continue? (y/N)
```

ದೃಢೀಕರಣಕ್ಕೆ `y` ಟೈಪ್ ಮಾಡಿ.

**ಏನು ಅಳಿಸಲಾಗುತ್ತದೆ**:
- Container Apps Environment
- Both Container Apps (gateway & product service)
- Container Registry
- Application Insights
- Log Analytics Workspace
- Resource Group

**✓ ಶುದ್ಧೀಕರಣ ಪರಿಶೀಲಿಸಿ**:
```bash
az group list --query "[?starts_with(name,'rg-microservices')]" --output table
```

ಖಾಲಿ ಆಗಿರಬೇಕು.

---

## ವಿಸ್ತರಣೆ ಮಾರ್ಗದರ್ಶಿ: 2ರಿಂದ 5+ ಸೇವೆಗಳಿಗೆ

Once you've mastered this 2-service architecture, here's how to expand:

### ಹಂತ 1: ಡೇಟಾಬೇಸ್ ಸ್ಥಾಯಿತ್ವವನ್ನು ಸೇರಿಸಿ (ಮುಂದಿನ ಹಂತ)

**ಉತ್ಪನ್ನ ಸೇವೆಗೆ Cosmos DB ಸೇರಿಸಿ**:

1. `infra/core/cosmos.bicep` ಸೃಷ್ಟಿಸಿ:
   ```bicep
   resource cosmosAccount 'Microsoft.DocumentDB/databaseAccounts@2023-04-15' = {
     name: name
     location: location
     kind: 'GlobalDocumentDB'
     properties: {
       databaseAccountOfferType: 'Standard'
       locations: [{ locationName: location, failoverPriority: 0 }]
     }
   }
   ```

2. ಉತ್ಪನ್ನ ಸೇವೆಯನ್ನು in-memory ಡೇಟಾ ಬದಲು Cosmos DB ಬಳಸುವಂತೆ ನವೀಕರಿಸಿ

3. ಅಂದಾಜು ಹೆಚ್ಚುವರಿ ವೆಚ್ಚ: ~ $25/ಮಾಸ (serverless)

### ಹಂತ 2: ಮೂರನೇ ಸೇವೆ ಸೇರಿಸಿ (ಆರ್ಡರ್ ನಿರ್ವಹಣೆ)

**ಆರ್ಡರ್ ಸೇವೆ ರಚಿಸಿ**:

1. ಹೊಸ ಫೋಲ್ಡರ್: `src/order-service/` (Python/Node.js/C#)
2. ಹೊಸ Bicep: `infra/app/order-service.bicep`
3. API Gateway ಅನ್ನು `/api/orders` ಗೆ ರೌಟ್ ಮಾಡಲು ನವೀಕರಿಸಿ
4. ಆರ್ಡರ್ ಸ್ಥಾಯಿತ್ವಕ್ಕೆ Azure SQL Database ಸೇರಿಸಿ

**ಆರ್ಕಿಟೆಕ್ಚರ ಆಗುತ್ತದೆ**:
```
API Gateway → Product Service (Cosmos DB)
           → Order Service (Azure SQL)
```

### ಹಂತ 3: ಅಸಿಂಕ್ರೋನಸ್ ಸಂವಹನ ಸೇರಿಸಿ (Service Bus)

**ಈವೆಂಟ್-ಪ್ರೇರಿತ ಆರ್ಕಿಟೆಕ್ಚರ್ ಜಾರಿಗೊಳಿಸಿ**:

1. Azure Service Bus ಸೇರಿಸಿ: `infra/core/servicebus.bicep`
2. Product Service "ProductCreated" ಈವೆಂಟ್ಗಳನ್ನು ಪ್ರಕಟಿಸುತ್ತದೆ
3. Order Service ಉತ್ಪನ್ನ ಈವೆಂಟ್ಗಳಿಗೆ ಸಬ್‌ಸ್ಕ್ರೈಬ್ ಮಾಡುತ್ತದೆ
4. ಈವೆಂಟ್ಗಳನ್ನು ಪ್ರಕ್ರಿಯೆ ಮಾಡಲು Notification Service ಸೇರಿಸಿ

**Pattern**: Request/Response (HTTP) + Event-Driven (Service Bus)

### ಹಂತ 4: ಬಳಕೆದಾರ ಪ್ರಾಮಾಣೀಕರಣ ಸೇರಿಸಿ

**ಬಳಕೆದಾರ ಸೇವೆ ಜಾರಿಗೊಳಿಸಿ**:

1. `src/user-service/` ರಚಿಸಿ (Go/Node.js)
2. Azure AD B2C ಅಥವಾ ಕಸ್ಟಮ್ JWT ಪ್ರಾಮಾಣೀಕರಣ ಸೇರಿಸಿ
3. API Gateway ಟೋಕನ್ ಗಳನ್ನು ಮಾನ್ಯಗೊಳಿಸುತ್ತದೆ
4. ಸೇವೆಗಳು ಬಳಕೆದಾರ ಅನುಮತಿಗಳನ್ನು ಪರಿಶೀಲಿಸುತ್ತವೆ

### ಹಂತ 5: ಉತ್ಪಾದನಾ ಸಿದ್ಧತೆ

**ಈ ಘಟಕಗಳನ್ನು ಸೇರಿಸಿ**:
- Azure Front Door (global load balancing)
- Azure Key Vault (secret management)
- Azure Monitor Workbooks (custom dashboards)
- CI/CD Pipeline (GitHub Actions)
- Blue-Green Deployments
- Managed Identity for all services

**ಸಂಪೂರ್ಣ ಉತ್ಪಾದನಾ ಆರ್ಕಿಟೆಕ್ಚರ್ ವೆಚ್ಚ**: ~ $300-1,400/ಮಾಸ

---

## ಇನ್ನಷ್ಟು ತಿಳಿಯಿರಿ

### ಸಂಬಂಧಿತ ಡಾಕ್ಯುಮೆಂಟೇಶನ್
- [Azure Container Apps ಡಾಕ್ಯುಮೆಂಟೇಶನ್](https://learn.microsoft.com/azure/container-apps/)
- [ಮೈಕ್ರೋಸರ್ವೀಸ್ ಆರ್ಕಿಟೆಕ್ಚರ್ ಮಾರ್ಗದರ್ಶಿ](https://learn.microsoft.com/azure/architecture/guide/architecture-styles/microservices)
- [ವಿತರಿತ ಟ್ರೇಸಿಂಗ್‌ಗಾಗಿ Application Insights](https://learn.microsoft.com/azure/azure-monitor/app/distributed-tracing)
- [Azure Developer CLI ಡಾಕ್ಯುಮೆಂಟೇಶನ್](https://learn.microsoft.com/azure/developer/azure-developer-cli/)

### ಈ ಕೋರ್ಸಿನ ಮುಂದಿನ ಹಂತಗಳು
- ← Previous: [ಸರಳ Flask API](../../../../../examples/container-app/simple-flask-api) - ಆರಂಭಿಕ ಒಂದು-ಕಂಟೇನರ್ ಉದಾಹರಣೆ
- → Next: [AI ಏಕೀಕರಣ ಮಾರ್ಗದರ್ಶಿ](../../../../../examples/docs/ai-foundry) - AI ಸಾಮರ್ಥ್ಯಗಳನ್ನು ಸೇರಿಸಿ
- 🏠 [ಕೋರ್ಸ್ ಮುಖ್ಯಪುಟ](../../README.md)

### ಹೋಲಿಕೆ: ಯಾವಾಗ ಯಾವವನ್ನು ಬಳಸಬೇಕು

**ಒಂದು ಕಂಟೇನರ್ ಅಪ್ಲಿಕೇಶನ್** (ಸರಳ Flask API ಉದಾಹರಣೆ):
- ✅ ಸರಳ ಅಪ್ಲಿಕೇಶನ್ಗಳು
- ✅ ಏಕಘಟಕ ಆರ್ಕಿಟೆಚರ್
- ✅ ವೇಗವಾಗಿ ನಿಯೋಜಿಸಲು
- ❌ ವಿಸ್ತರಣಾ ಸಾಮರ್ಥ್ಯ ಮಿತವಾಗಿದೆ
- **ವೆಚ್ಚ**: ~ $15-50/ಮಾಸ

**ಮೈಕ್ರೋಸರ್ವೀಸ್** (ಈ ಉದಾಹರಣೆ):
- ✅ ಸಂಕೀರ್ಣ ಅಪ್ಲಿಕೇಶನ್ಗಳು
- ✅ ಪ್ರತಿ ಸೇವೆಗಾಗಿ ಸ್ವತಂತ್ರವಾಗಿ ವಿಸ್ತರಿಸಬಹುದು
- ✅ ತಂಡದ ಸ್ವಾಯತ್ತತೆ (ವಿಭಿನ್ನ ಸೇವೆಗಳು, ವಿಭಿನ್ನ ತಂಡಗಳು)
- ❌ ನಿರ್ವಹಣೆಗೆ ಹೆಚ್ಚಿನ ಸಂಕೀರ್ಣತೆ
- **ವೆಚ್ಚ**: ~ $60-250/ಮಾಸ

**Kubernetes (AKS)**:
- ✅ ಗರಿಷ್ಠ ನಿಯಂತ್ರಣ ಮತ್ತು ಲಚಿಕತೆಯುಳ್ಳದು
- ✅ ಬಹು-ಕ್ಲೌಡ್ ಪೋರ್ಟೇಬಿಲಿಟಿ
- ✅ ಅತ್ಯಾಧುನಿಕ ನೆಟ್ವರ್ಕಿಂಗ್
- ❌ Kubernetes ಪರಿಣತಿ ಬೇಕಾಗುತ್ತದೆ
- **ವೆಚ್ಚ**: ~ $150-500/ಮಾಸ ಕನಿಷ್ಠ

**ಶಿಫಾರಸು**: Container Apps (ಈ ಉದಾಹರಣೆ) ನಿಂದ ಪ್ರಾರಂಭಿಸಿ, Kubernetes-ನ ವಿಶೇಷ ವೈಶಿಷ್ಟ್ಯಗಳು ಬೇಕಾದರೆ ಮಾತ್ರ AKS ಗೆ ಬದಲಾಯಿಸಿ.

---

## ಹೆಚ್ಚಿನವಾಗಿ ಕೇಳಲಾಗುವ ಪ್ರಶ್ನೆಗಳು

**Q: 5+ ಬದಲು ಏಕೆ ಕೇವಲ 2 ಸೇವೆಗಳು?**  
A: ಶಿಕ್ಷಣಾತ್ಮಕ ಕ್ರಮ. ಜಟಿಲತೆ ಸೇರಿಸುವ ಮೊದಲು ಮೂಲಾಂಶಗಳನ್ನು (ಸೇವೆಗಳ ಸಂವಹನ, ಮಾನಿಟರಿಂಗ್, ಸ್ಕೇಲಿಂಗ್) ಸರಳ ಉದಾಹರಣೆಯ ಮೂಲಕ ಆಜ್ಞಾಪಿಸಿಕೊಳ್ಳಿ. ನೀವು ಇಲ್ಲಿ ಕಲಿತುಕೊಳ್ಳುವ ಮಾದರಿಗಳು 100-ಸೇವೆಗಳ ವಿಸ್ತಾರಕ್ಕೆ ಅನ್ವಯಿಸುತ್ತವೆ.

**Q: ನಾನು ಹೆಚ್ಚು ಸೇವೆಗಳು ಸೇರಿಸಬಹುದೇ?**  
A: ಖಚಿತವಾಗಿ! ಮೇಲಿನ ವಿಸ್ತರಣಾ ಮಾರ್ಗದರ್ಶಿಯನ್ನು ಅನುಸರಿಸಿ. ಪ್ರತಿ ಹೊಸ ಸೇವೆ ಅದೇ ಮಾದರಿಯನ್ನು ಅನುಸರಿಸುತ್ತದೆ: src ಫೋಲ್ಡರ್ ರಚಿಸಿ, Bicep ಫೈಲ್ ರಚಿಸಿ, azure.yaml ಅನ್ನು ನವೀಕರಿಸಿ, ಡಿಪ್ಲಾಯ್ ಮಾಡಿ.

**Q: ಇದು ಉತ್ಪಾದನಗೆ ತಯಾರಾಗಿದೆಯೇ?**  
A: ಇದು ದೃಢವಾದ ಅಡಿಪಾಯವಾಗಿದೆ. ಉತ್ಪಾದನಕ್ಕೆ, managed identity, Key Vault, ಸ್ಥಿರ ಡೇಟಾಬೇಸ್‌ಗಳು, CI/CD ಪೈಪ್‌ಲೈನ್, ಮಾನಿಟರಿಂಗ್ ಅಲರ್ಟ್‌ಗಳು ಮತ್ತು ಬ್ಯಾಕಪ್ ತಂತ್ರಜ್ಞಾನ ಸೇರಿಸಿ.

**Q: Dapr ಅಥವಾ ಬೇರೆ ಸರ್ವೀಸ್ ಮೆಶ್ ಯಾಕೆ ಬಳಸಬಾರದು?**  
A: ಕಲಿಕೆಗೆ ಸರಳವಾಗಿರಲಿ. ನೇಟಿವ್ Container Apps ನೆಟ್ವರ್ಕಿಂಗ್ ಅನ್ನು ನೀವು ಅರ್ಥಮಾಡಿಕೊಂಡ ಬಳಿಕ, ಉನ್ನತ ಸನ್ನಿವೇಶಗಳಿಗಾಗಿ Dapr ಅನ್ನು ಕೂಡ ಸೇರಿಸಬಹುದು.

**Q: ನಾನು ಸ್ಥಳೀಯವಾಗಿ ಹೇಗೆ ಡಿಬಗ್ ಮಾಡಲಿ?**  
A: Docker ನೊಂದಿಗೆ ಸ್ಥಳೀಯವಾಗಿ ಸೇವೆಗಳನ್ನು ಚಲಾಯಿಸಿ:
```bash
cd src/api-gateway
docker build -t local-gateway .
docker run -p 8080:8080 -e PRODUCT_SERVICE_URL=http://localhost:8000 local-gateway
```

**Q: ನಾನು ವಿವಿಧ ಪ್ರೋಗ್ರಾಮಿಂಗ್ ಭಾಷೆಗಳನ್ನು ಬಳಸಬಹುದೇ?**  
A: ಹೌದು! ಈ ಉದಾಹರಣೆಯಲ್ಲಿ Node.js (gateway) + Python (product service) ತೋರಿಸಲಾಗಿದೆ. ಕಂಟೇನರ್ಗಳಲ್ಲಿ ಚಾಲನೆಯಲ್ಲಿರುವ ಯಾವುದೇ ಭಾಷೆಗಳನ್ನೂ ಮಿಶ್ರಣ ಮಾಡಬಹುದು.

**Q: ನನಗೆ Azure ಕ್ರೆಡಿಟ್‌ಗಳು ಇಲ್ಲದಿದ್ದರೆ ಏನು?**  
A: ಹೊಸ ಖಾತೆಗಳಿಗೆ Azure ಉಚಿತ ಟಿಯರ್ (ಮೊದಲ 30 ದಿನಗಳು) ಬಳಸಿ ಅಥವಾ ಕಿರು ಪರೀಕ್ಷಾ ಅವಧಿಗಳಿಗಾಗಿ ನಿಯೋಜಿಸಿ ಮತ್ತು ತಕ್ಷಣ ಅಳಿಸಿ.

---

> **🎓 ಕಲಿಕಾ ಪಥ ಸಾರಾಂಶ**: ನೀವು ಸ್ವಯಂಚಾಲಿತ ಸ್ಕೇಲಿಂಗ್, ಆಂತರಿಕ ನೆಟ್ವರ್ಕಿಂಗ್, ಕೇಂದ್ರಿತ ಮಾನಿಟರಿಂಗ್ ಮತ್ತು ಉತ್ಪಾದನಾ-ಸಿದ್ಧ ಮಾದರಿಗಳೊಂದಿಗೆ ಬಹು-ಸೇವಾ ಆರ್ಕಿಟೆಚರ್ ಅನ್ನು ನಿಯೋಜಿಸುವುದನ್ನು ಕಲಿತಿದ್ದೀರಿ. ಈ ಅಡಿಪಾಯವು ನಿಮಗೆ ಸಂಕೀರ್ಣ ವಿತರಿತ ವ್ಯವಸ್ಥೆಗಳು ಮತ್ತು ಎಂಟರ್ಪ್ರೈಸ್ ಮೈಕ್ರೋಸರ್ವೀಸ್ ಆರ್ಕಿಟೆಕ್ಚರ್‌ಗಳಿಗೆ ಸಿದ್ಧತೆ ಒದಗಿಸುತ್ತದೆ.

**📚 ಕೋರ್ಸ್ ನ್ಯಾವಿಗೇಶನ್:**
- ← Previous: [ಸರಳ Flask API](../../../../../examples/container-app/simple-flask-api)
- → Next: [ಡೇಟಾಬೇಸ್ ಇಂಟಿಗ್ರೇಶನ್ ಉದಾಹರಣೆ](../../../../../examples/database-app)
- 🏠 [ಕೋರ್ಸ್ ಮುಖ್ಯಪುಟ](../../../README.md)
- 📖 [Container Apps ಉತ್ತಮ ಅಭ್ಯಾಸಗಳು](../../../docs/chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
ನಿರಾಕರಣೆ:
ಈ ದಾಖಲೆ [Co-op Translator](https://github.com/Azure/co-op-translator) ಎಂಬ AI ಅನುವಾದ ಸೇವೆಯನ್ನು ಬಳಸಿ ಅನುವಾದಿಸಲಾಗಿದೆ. ನಾವು ಶುದ್ಧತೆಯತ್ತ ಪ್ರಯತ್ನಿಸಿದರೂ ಸಹ, ಸ್ವಯಂಚಾಲಿತ ಅನುವಾದಗಳಲ್ಲಿ ದೋಷಗಳು ಅಥವಾ ಅನಿಖರತೆಗಳು ಇರಬಲ್ಲವು ಎಂಬುದನ್ನು ದಯವಿಟ್ಟು ಗಮನಿಸಿ. ಮೂಲ ದಾಖಲೆ ಅದರ ಸ್ಥಳೀಯ ಭಾಷೆಯಲ್ಲಿರುವ ಪ್ರತಿ ನಿಯಮಾನುಸಾರ ಅಧಿಕೃತ ಮೂಲವೆಂದು ಪರಿಗಣಿಸಬೇಕು. ಗಂಭೀರ ಮಾಹಿತಿಗೆ ವೃತ್ತಿಪರ ಮಾನವ ಅನುವಾದವನ್ನು ಶಿಫಾರಸು ಮಾಡಲಾಗಿದೆ. ಈ ಅನುವಾದದ ಬಳಕೆಯಿಂದ ಉಂಟಾಗುವ ಯಾವುದೇ ಅಸಮಂಜಸದಂತ ಅಥವಾ ತಪ್ಪು ವ್ಯಾಖ್ಯಾನಗಳಿಗಾಗಿ ನಾವು ಹೊಣೆಗಾರರಾಗಿರುವುದಿಲ್ಲ.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->